#include <iostream>
#include <iomanip>
#include <vector>
#include <sstream>
#include <cmath>
// #define DG_DEBUG



#include "dg/backend/timer.cuh"
#include "dg/backend/xspacelib.cuh"
#include "file/read_input.h"
#include "file/nc_utilities.h"


#include "asela.cuh"
#include "bessel.h"
#include "parameters.h"
#include "geometry.h"


/*
   - reads parameters from input.txt or any other given file, 
   - integrates the ToeflR - functor and 
   - writes outputs to a given outputfile using hdf5. 
        density fields are the real densities in XSPACE ( not logarithmic values)
*/

const unsigned k = 3;//!< a change in k needs a recompilation

int main( int argc, char* argv[])
{
    //Parameter initialisation
    std::vector<double> v,v3;
    std::string input, geom;
    if( argc != 3)
    {
        std::cerr << "ERROR: Wrong number of arguments!\nUsage: "<< argv[0]<<" [inputfile] [outputfile]\n";
        return -1;
    }
    else 
    {
        v = file::read_input( argv[1]);
        input = file::read_file( argv[1]);
    }
    const Parameters p( v);
    p.display( std::cout);

    ////////////////////////////////set up computations///////////////////////////
    try{ v3 = file::read_input( "geometry_params.txt"); }
    catch (toefl::Message& m) {  m.display(); 
    geom = file::read_file( "geometry_params.txt");
    std::cout << geom << std::endl;
        for( unsigned i = 0; i<v.size(); i++)
        return -1;}

     const solovev::GeomParameters gp(v3);
    gp.display( std::cout);
    double Rmin=gp.R_0-(gp.boxscale)*gp.a;
    double Zmin=-(gp.boxscale)*gp.a*gp.elongation;
    double Rmax=gp.R_0+(gp.boxscale)*gp.a; 
    double Zmax=(gp.boxscale)*gp.a*gp.elongation;
    //Make grid
     dg::Grid3d<double > grid( Rmin,Rmax, Zmin,Zmax, 0, 2.*M_PI, p.n, p.Nx, p.Ny, p.Nz, dg::DIR, dg::DIR, dg::PER);  
     
    //create RHS 
    eule::Feltor<dg::DMatrix, dg::DVec, dg::DVec > feltor( grid, p,gp); //initialize before rolkar!
    eule::Rolkar<dg::DMatrix, dg::DVec, dg::DVec > rolkar( grid, p,gp);
    //Initial profile with bath
    dg::BathRZ init0(16,16,p.Nz,Rmin,Zmin, 30.,15.,p.amp);
    solovev::Nprofile grad(gp); 
    std::vector<dg::DVec> y0(4, dg::evaluate( grad, grid)), y1(y0); 
    dg::blas1::pointwiseDot(rolkar.dampin(),(dg::DVec)dg::evaluate(init0, grid), y1[0]); //is damping on bath

    
    dg::blas1::axpby( 1., y1[0], 1., y0[0]);
    dg::blas1::axpby( 1., y1[0], 1., y0[1]);
    dg::blas1::axpby( 0., y0[2], 0., y0[2]); //set Ue = 0
    dg::blas1::axpby( 0., y0[3], 0., y0[3]); //set Ui = 0
    feltor.log( y0, y0, 2); //transform to logarithmic values (ne and ni)
    
    dg::Karniadakis< std::vector<dg::DVec> > karniadakis( y0, y0[0].size(), p.eps_time);
    karniadakis.init( feltor, rolkar, y0, p.dt);
    double time = 0;
    unsigned step = 0;

    /////////////////////////////set up hdf5/////////////////////////////////
    //file::T5trunc t5file( argv[2], input);
    file::NC_Error_Handle h;
    int ncid;
    h = nc_create( argv[2], NC_CLOBBER, &ncid);
    h = nc_put_att_text( ncid, NC_GLOBAL, "inputfile", input.size(), input.data());
    h = nc_put_att_text( ncid, NC_GLOBAL, "geomfile", geom.size(), geom.data());
    int dim_ids[4], tvarID;
    h = file::define_dimensions( ncid, dim_ids, &tvarID, grid);


    std::vector<std::string> names(7);
    int dataIDs[names.size()];
    names[0] = "electrons", names[1] = "ions", names[2] = "Ue", names[3] = "Ui";
    names[4] = "potential", names[5] = "aparallel", names[6] = "energy";

    for( unsigned i=0; i<names.size()-1; i++) {
        h = nc_def_var( ncid, names[i].data(), NC_DOUBLE, 4, dim_ids, &dataIDs[i]);}
    nc_def_var( ncid, names[6].data(), NC_DOUBLE, 1, dim_ids, &dataIDs[6]);
    h = nc_enddef(ncid);


    ///////////////////////////////////first output/////////////////////////
    size_t count[4] = {1., grid.Nz(), grid.n()*grid.Ny(), grid.n()*grid.Nx()};
    size_t start[4] = {0, 0, 0, 0};
    feltor.exp( y0,y0,2); //transform to correct values
    dg::HVec output;

    for( unsigned i=0; i<2; i++)
    {
        output = y0[i];//transfer to host
        h = nc_put_vara_double( ncid, dataIDs[i], start, count, output.data() );
    }
    output = feltor.uparallel()[0];
    h = nc_put_vara_double( ncid, dataIDs[2], start, count, output.data() );
    output = feltor.uparallel()[1];
    h = nc_put_vara_double( ncid, dataIDs[3], start, count, output.data() );
    output = feltor.potential()[0];
    h = nc_put_vara_double( ncid, dataIDs[4], start, count, output.data() );
    output = feltor.aparallel();
    h = nc_put_vara_double( ncid, dataIDs[5], start, count, output.data() );
    h = nc_close(ncid);

    double E0 = feltor.energy(), energy0 = E0, E1 = 0, diff = 0;

    //t5file.append( feltor.mass(), feltor.mass_diffusion(), feltor.energy(), feltor.energy_diffusion());
    ///////////////////////////////////////Timeloop/////////////////////////////////
    dg::Timer t;
    t.tic();
    try

    {
#ifdef DG_BENCHMARK
    unsigned step = 0;
#endif //DG_BENCHMARK
    for( unsigned i=0; i<p.maxout; i++)
    {

#ifdef DG_BENCHMARK
        dg::Timer ti;
        ti.tic();
#endif//DG_BENCHMARK
        for( unsigned j=0; j<p.itstp; j++)
        {
            try{ karniadakis( feltor, rolkar, y0);}
            catch( dg::Fail& fail) { 
                std::cerr << "CG failed to converge to "<<fail.epsilon()<<"\n";
                std::cerr << "Does Simulation respect CFL condition?\n";
                break;
            }
            //t5file.append( feltor.mass(), feltor.mass_diffusion(), feltor.energy(), feltor.energy_diffusion());
        }
        time += p.itstp*p.dt;
        //new time stuff
        start[0] = i;

        feltor.exp( y0,y0,2); //transform to correct values
        h = nc_open(argv[2], NC_WRITE, &ncid);

        for( unsigned j=0; j<2; j++)
        {
            output = y0[j];//transfer to host
            h = nc_put_vara_double( ncid, dataIDs[j], start, count, output.data());
        }
        output = feltor.uparallel()[0];
        h = nc_put_vara_double( ncid, dataIDs[2], start, count, output.data() );
        output = feltor.uparallel()[1];
        h = nc_put_vara_double( ncid, dataIDs[3], start, count, output.data() );
        output = feltor.potential()[0];
        h = nc_put_vara_double( ncid, dataIDs[4], start, count, output.data() );
        output = feltor.aparallel();
        h = nc_put_vara_double( ncid, dataIDs[5], start, count, output.data() );
        //write time data
        h = nc_put_vara_double( ncid, tvarID, start, count, &time);
        E1 = (feltor.energy()-energy0)/energy0;
        h = nc_put_vara_double( ncid, dataIDs[6], start, count,&E1);

        h = nc_close(ncid);

#ifdef DG_BENCHMARK
        ti.toc();
        step+=p.itstp;
        std::cout << "\n\t Step "<<step <<" of "<<p.itstp*p.maxout <<" at time "<<time;
        std::cout << "\n\t Average time for one step: "<<ti.diff()/(double)p.itstp<<"s\n\n"<<std::flush;
#endif//DG_BENCHMARK
    }
    }
    catch( dg::Fail& fail) { 
        std::cerr << "CG failed to converge to "<<fail.epsilon()<<"\n";
        std::cerr << "Does Simulation respect CFL condition?\n";
    }
    t.toc(); 
    unsigned hour = (unsigned)floor(t.diff()/3600);
    unsigned minute = (unsigned)floor( (t.diff() - hour*3600)/60);
    double second = t.diff() - hour*3600 - minute*60;
    std::cout << std::fixed << std::setprecision(2) <<std::setfill('0');
    std::cout <<"Computation Time \t"<<hour<<":"<<std::setw(2)<<minute<<":"<<second<<"\n";
    std::cout <<"which is         \t"<<t.diff()/p.itstp/p.maxout<<"s/step\n";

    return 0;

}
