#include <iostream>
#include <iomanip>
#include <vector>
#include <fstream>
#include <sstream>
#include <cmath>

#include "dg/backend/xspacelib.cuh"
#include "dg/functors.h"
#include "file/read_input.h"

#include "dg/backend/timer.cuh"
#include "solovev.h"
#include "taylor.h"
//#include "guenther.h"
#include "curvilinearX.h"
#include "dg/ds.h"
#include "init.h"

#include "file/nc_utilities.h"

//typedef dg::FieldAligned< solovev::ConformalXGrid3d<dg::DVec> , dg::IDMatrix, dg::DVec> DFA;
double sine( double x) {return sin(x);}
double cosine( double x) {return cos(x);}
typedef dg::FieldAligned< dg::CurvilinearGridX3d<dg::DVec> , dg::IDMatrix, dg::DVec> DFA;

thrust::host_vector<double> periodify( const thrust::host_vector<double>& in, const dg::GridX3d& g)
{
    assert( g.Nz() == 2);
    thrust::host_vector<double> out(g.size());
    for( unsigned s=0; s<g.Nz(); s++)
    for( unsigned i=0; i<g.Ny(); i++)
    for( unsigned k=0; k<g.n(); k++)
    for( unsigned j=0; j<g.Nx(); j++)
    for( unsigned l=0; l<g.n(); l++)
        out[(((s*g.Ny()+i)*g.n() + k)*g.Nx() + j)*g.n()+l] = 
            in[((i*g.n() + k)*g.Nx() + j)*g.n()+l];

    //exchange two segments
    for( unsigned i=g.outer_Ny(); i<2*g.outer_Ny(); i++)
    for( unsigned k=0; k<g.n(); k++)
    for( unsigned j=0; j<g.Nx(); j++)
    for( unsigned l=0; l<g.n(); l++)
        out[(((1*g.Ny() + i)*g.n() + k)*g.Nx() + j)*g.n()+l] = 
            in[(((i+g.inner_Ny())*g.n() + k)*g.Nx() + j)*g.n()+l];
    for( unsigned i=g.inner_Ny()+g.outer_Ny(); i<g.Ny(); i++)
    for( unsigned k=0; k<g.n(); k++)
    for( unsigned j=0; j<g.Nx(); j++)
    for( unsigned l=0; l<g.n(); l++)
        out[(((1*g.Ny() + i)*g.n() + k)*g.Nx() + j)*g.n()+l] = 
            in[(((i-g.inner_Ny())*g.n() + k)*g.Nx() + j)*g.n()+l];
    if( g.outer_Ny() == 0)
    {
    //exchange two segments
    for( unsigned i=0; i<g.Ny()-1; i++)
    for( unsigned k=0; k<g.n(); k++)
    for( unsigned j=0; j<g.Nx(); j++)
    for( unsigned l=0; l<g.n(); l++)
        out[(((1*g.Ny() + i)*g.n() + k)*g.Nx() + j)*g.n()+l] = 
            in[(((i+1)*g.n() + k)*g.Nx() + j)*g.n()+l];
    for( unsigned i=g.Ny()-1; i<g.Ny(); i++)
    for( unsigned k=0; k<g.n(); k++)
    for( unsigned j=0; j<g.Nx(); j++)
    for( unsigned l=0; l<g.n(); l++)
        out[(((1*g.Ny() + i)*g.n() + k)*g.Nx() + j)*g.n()+l] = 
            in[(((0)*g.n() + k)*g.Nx() + j)*g.n()+l];
    }


    return out;
}

int main( int argc, char* argv[])
{
    std::cout << "Type n, Nx, Ny, Nz (Nx must be divided by 4 and Ny by 10) \n";
    unsigned n, Nx, Ny, Nz;
    std::cin >> n>> Nx>>Ny>>Nz;   
    Json::Reader reader;
    Json::Value js;
    if( argc==1)
    {
        //std::ifstream is("geometry_params_Xpoint_taylor.js");
        std::ifstream is("geometry_params_Xpoint.js");
        reader.parse(is,js,false);
    }
    else
    {
        std::ifstream is(argv[1]);
        reader.parse(is,js,false);
    }
    solovev::GeomParameters gp(js);
    dg::Timer t;
    std::cout << "Type psi_0 \n";
    double psi_0 = -16;
    std::cin >> psi_0;
    std::cout << "Type fx and fy ( fx*Nx and fy*Ny must be integer) \n";
    double fx_0=1./4., fy_0=1./22.;
    std::cin >> fx_0>> fy_0;
    gp.display( std::cout);
    std::cout << "Constructing orthogonal grid ... \n";
    t.tic();
    solovev::Psip psip( gp); 
    std::cout << "Psi min "<<psip(gp.R_0, 0)<<"\n";
    solovev::PsipR psipR(gp); solovev::PsipZ psipZ(gp);
    solovev::PsipRR psipRR(gp); solovev::PsipRZ psipRZ(gp); solovev::PsipZZ psipZZ(gp);
    double R_X = gp.R_0-1.1*gp.triangularity*gp.a;
    double Z_X = -1.1*gp.elongation*gp.a;
    dg::findXpoint( psipR, psipZ, psipRR, psipRZ, psipZZ, R_X, Z_X);

    double R0 = gp.R_0, Z0 = 0;
    dg::RibeiroX<solovev::Psip,solovev::PsipR,solovev::PsipZ,solovev::PsipRR, solovev::PsipRZ, solovev::PsipZZ> generator(psip, psipR, psipZ, psipRR, psipRZ, psipZZ, psi_0, fx_0, R_X,Z_X, R0, Z0);
    dg::CurvilinearGridX3d<dg::DVec> g3d(generator, psi_0, fx_0, fy_0, n, Nx, Ny,Nz, dg::DIR, dg::NEU);
    dg::CurvilinearGridX2d<dg::DVec> g2d = g3d.perp_grid();
    t.toc();
    dg::GridX3d g3d_periodic(g3d.x0(), g3d.x1(), g3d.y0(), g3d.y1(), g3d.z0(), g3d.z1(), g3d.fx(), g3d.fy(), g3d.n(), g3d.Nx(), g3d.Ny(), 2); 
    std::cout << "Construction took "<<t.diff()<<"s"<<std::endl;
    dg::Grid1d g1d( g2d.x0(), g2d.x1(), g2d.n(), g2d.Nx());
    dg::HVec x_left = dg::evaluate( sine, g1d), x_right(x_left);
    dg::HVec y_left = dg::evaluate( cosine, g1d);
    int ncid;
    file::NC_Error_Handle err;
    err = nc_create( "ribeiroX.nc", NC_NETCDF4|NC_CLOBBER, &ncid);
    int dim3d[3], dim1d[1];
    err = file::define_dimensions(  ncid, dim3d, g3d_periodic.grid());
    //err = file::define_dimensions(  ncid, dim3d, g2d.grid());
    err = file::define_dimension(  ncid, "i", dim1d, g1d);
    int coordsID[2], onesID, defID, volID, divBID;
    int coord1D[5];
    err = nc_def_var( ncid, "x_XYP", NC_DOUBLE, 3, dim3d, &coordsID[0]);
    err = nc_def_var( ncid, "y_XYP", NC_DOUBLE, 3, dim3d, &coordsID[1]);
    err = nc_def_var( ncid, "x_left", NC_DOUBLE, 1, dim1d, &coord1D[0]);
    err = nc_def_var( ncid, "y_left", NC_DOUBLE, 1, dim1d, &coord1D[1]);
    err = nc_def_var( ncid, "x_right", NC_DOUBLE, 1, dim1d, &coord1D[2]);
    err = nc_def_var( ncid, "y_right", NC_DOUBLE, 1, dim1d, &coord1D[3]);
    err = nc_def_var( ncid, "f_x", NC_DOUBLE, 1, dim1d, &coord1D[4]);
    //err = nc_def_var( ncid, "z_XYP", NC_DOUBLE, 3, dim3d, &coordsID[2]);
    err = nc_def_var( ncid, "psi", NC_DOUBLE, 3, dim3d, &onesID);
    err = nc_def_var( ncid, "deformation", NC_DOUBLE, 3, dim3d, &defID);
    err = nc_def_var( ncid, "volume", NC_DOUBLE, 3, dim3d, &volID);
    err = nc_def_var( ncid, "divB", NC_DOUBLE, 3, dim3d, &divBID);

    thrust::host_vector<double> psi_p = dg::pullback( psip, g2d);
    g2d.display();
    err = nc_put_var_double( ncid, onesID, periodify(psi_p, g3d_periodic).data());
    //err = nc_put_var_double( ncid, onesID, periodify(g2d.g(), g3d_periodic).data());
    dg::HVec X( g2d.size()), Y(X); //P = dg::pullback( dg::coo3, g);
    for( unsigned i=0; i<g2d.size(); i++)
    {
        X[i] = g2d.r()[i];
        Y[i] = g2d.z()[i];
    }

    dg::DVec ones = dg::evaluate( dg::one, g2d);
    dg::DVec temp0( g2d.size()), temp1(temp0);
    dg::DVec w2d = dg::create::weights( g2d);

    err = nc_put_var_double( ncid, coordsID[0], periodify(X, g3d_periodic).data());
    err = nc_put_var_double( ncid, coordsID[1], periodify(Y, g3d_periodic).data());
    //err = nc_put_var_double( ncid, coordsID[0], X.data());
    //err = nc_put_var_double( ncid, coordsID[1], Y.data());
    //err = nc_put_var_double( ncid, coord1D[0], g3d.rx0().data());
    //err = nc_put_var_double( ncid, coord1D[1], g3d.zx0().data());
    //err = nc_put_var_double( ncid, coord1D[2], g3d.rx1().data());
    //err = nc_put_var_double( ncid, coord1D[3], g3d.zx1().data());
    //err = nc_put_var_double( ncid, coord1D[4], periodify(g3d.f_x(), g3d_periodic).data());
    //err = nc_put_var_double( ncid, coord1D[4], g3d.f_x().data());
    //err = nc_put_var_double( ncid, coordsID[2], g.z().data());

    dg::blas1::pointwiseDivide( g2d.g_yy(), g2d.g_xx(), temp0);
    dg::blas1::axpby( 1., ones, -1., temp0, temp0);
    dg::blas1::transfer( temp0, X);
    err = nc_put_var_double( ncid, defID, periodify(X, g3d_periodic).data());
    //err = nc_put_var_double( ncid, defID, X.data());
    dg::blas1::transfer( g2d.vol(), X);
    dg::blas1::transfer( g2d.g_yy(),Y);
    dg::blas1::pointwiseDot( Y, X, X);
    err = nc_put_var_double( ncid, volID, periodify(X, g3d_periodic).data());
    //err = nc_put_var_double( ncid, volID, X.data());

    std::cout << "Construction successful!\n";

    //compute error in volume element (in conformal grid g^xx is the volume element)
    dg::blas1::pointwiseDot( g2d.g_xx(), g2d.g_yy(), temp0);
    dg::blas1::pointwiseDot( g2d.g_xy(), g2d.g_xy(), temp1);
    dg::blas1::axpby( 1., temp0, -1., temp1, temp0);
    dg::blas1::transfer( g2d.g_xx(),  temp1);
    dg::blas1::pointwiseDot( temp1, temp1, temp1);
    dg::blas1::axpby( 1., temp1, -1., temp0, temp0);
    double error = sqrt( dg::blas2::dot( temp0, w2d, temp0)/dg::blas2::dot( temp1, w2d, temp1));
    std::cout<< "Rel Error in Determinant is "<<error<<"\n";

    //compute error in determinant vs volume form
    dg::blas1::pointwiseDot( g2d.g_xx(), g2d.g_yy(), temp0);
    dg::blas1::pointwiseDot( g2d.g_xy(), g2d.g_xy(), temp1);
    dg::blas1::axpby( 1., temp0, -1., temp1, temp0);
    dg::blas1::transform( temp0, temp0, dg::SQRT<double>());
    dg::blas1::pointwiseDivide( ones, temp0, temp0);
    dg::blas1::transfer( temp0, X);
    err = nc_put_var_double( ncid, volID, periodify(X, g3d_periodic).data());
    dg::blas1::axpby( 1., temp0, -1., g2d.vol(), temp0);
    error = sqrt(dg::blas2::dot( temp0, w2d, temp0)/dg::blas2::dot( g2d.vol(), w2d, g2d.vol()));
    std::cout << "Rel Consistency  of volume is "<<error<<"\n";

    //compare g^xx to volume form
    dg::blas1::transfer( g2d.g_xx(), temp0);
    dg::blas1::pointwiseDivide( ones, temp0, temp0);
    dg::blas1::axpby( 1., temp0, -1., g2d.vol(), temp0);
    error=sqrt(dg::blas2::dot( temp0, w2d, temp0))/sqrt( dg::blas2::dot(g2d.vol(), w2d, g2d.vol()));
    std::cout << "Rel Error of volume form is "<<error<<"\n";

    std::cout << "TEST VOLUME IS:\n";
    dg::CartesianGrid2d g2dC( gp.R_0 -1.2*gp.a, gp.R_0 + 1.2*gp.a, -2.0*gp.a*gp.elongation, 1.2*gp.a*gp.elongation, 1, 5e3, 1e4, dg::PER, dg::PER);
    gp.psipmax = 0., gp.psipmin = psi_0;
    solovev::Iris iris( gp);
    dg::HVec vec  = dg::evaluate( iris, g2dC);
    dg::DVec cutter = dg::pullback( iris, g2d), vol( cutter);
    dg::blas1::pointwiseDot(cutter, w2d, vol);
    double volume = dg::blas1::dot( g2d.vol(), vol);
    dg::HVec g2d_weights = dg::create::volume( g2dC);
    double volumeRZP = dg::blas1::dot( vec, g2d_weights);
    std::cout << "volumeXYP is "<< volume<<std::endl;
    std::cout << "volumeRZP is "<< volumeRZP<<std::endl;
    std::cout << "relative difference in volume is "<<fabs(volumeRZP - volume)/volume<<std::endl;
    std::cout << "Note that the error might also come from the volume in RZP!\n";

   // ///////////////////////////TEST 3d grid//////////////////////////////////////
   // std::cout << "Start DS test!"<<std::endl;
   // const dg::DVec vol3d = dg::create::volume( g3d);
   // //DFA fieldaligned(OrthogonalXField( gp, g2d, g2d.g()), g3d, gp.rk4eps, dg::NoLimiter(), dg::NEU); 
   // DFA fieldaligned( CurvilinearField( gp, g2d.x(), g2d.f_x()), g3d, gp.rk4eps, dg::NoLimiter(), dg::NEU); 

   // //dg::DS<DFA, dg::Composite<dg::DMatrix>, dg::DVec> ds( fieldaligned, OrthogonalXField(gp, g2d, g2d.g()), dg::normed, dg::centered, false);
   // dg::DS<DFA, dg::Composite<dg::DMatrix>, dg::DVec> ds( fieldaligned, CurvilinearField(gp, g2d.x(), g2d.f_x()), dg::normed, dg::centered, false);
   // dg::DVec B = dg::pullback( solovev::InvB(gp), g3d), divB(B);
   // dg::DVec lnB = dg::pullback( solovev::LnB(gp), g3d), gradB(B);
   // const dg::DVec gradLnB = dg::pullback( solovev::GradLnB(gp), g3d);
   // dg::blas1::pointwiseDivide( ones, B, B);

   // ds.centeredT( B, divB);
   // std::cout << "Divergence of B is "<<sqrt( dg::blas2::dot( divB, vol3d, divB))<<"\n";
   // ds.centered( lnB, gradB);
   // dg::blas1::axpby( 1., gradB, -1., gradLnB, gradB);
   // //test if topological shift was correct!!
   // X = gradB;
   // dg::blas1::pointwiseDot(cutter, gradB, gradB);
   // double norm = sqrt( dg::blas2::dot( gradLnB, vol3d, gradLnB) );
   // std::cout << "rel. error of lnB is    "<<sqrt( dg::blas2::dot( gradB, vol3d, gradB))/norm<<" (doesn't fullfill boundary conditions so it was cut at separatrix)\n";

   // const dg::DVec function = dg::pullback(solovev::FuncNeu(gp), g3d);
   // dg::DVec temp(function);
   // const dg::DVec derivative = dg::pullback(solovev::DeriNeu(gp), g3d);
   // ds( function, temp);
   // dg::blas1::axpby( 1., temp, -1., derivative, temp);
   // norm = sqrt( dg::blas2::dot( derivative, vol3d, derivative) );
   // std::cout << "rel. error of DS  is    "<<sqrt( dg::blas2::dot( temp, vol3d, temp))/norm<<"\n";
   // err = nc_put_var_double( ncid, divBID, periodify(X, g3d_periodic).data());
   // //err = nc_put_var_double( ncid, divBID, X.data());
    err = nc_close( ncid);


    return 0;
}
