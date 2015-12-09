#include <iostream>
#include <iomanip>
#include <vector>
#include <fstream>
#include <sstream>
#include <cmath>

#include "dg/backend/xspacelib.cuh"
#include "dg/functors.h"
#include "file/read_input.h"
#include "draw/host_window.h"

#include "dg/backend/timer.cuh"
#include "conformal.h"
#include "feltor/parameters.h"
#include "init.h"

#include "file/nc_utilities.h"

double sineX( double x, double y) {return sin(x)*sin(y);}
double cosineX( double x, double y) {return cos(x)*sin(y);}
double sineY( double x, double y) {return sin(x)*sin(y);}
double cosineY( double x, double y) {return sin(x)*cos(y);}

int main( int argc, char* argv[])
{
    std::cout << "Type n, Nx, Ny, Nz\n";
    unsigned n, Nx, Ny, Nz;
    std::cin >> n>> Nx>>Ny>>Nz;   
    std::cout << "Type psi_0 and psi_1\n";
    double psi_0, psi_1;
    std::cin >> psi_0>> psi_1;
    std::vector<double> v, v2;
try{ 
        if( argc==1)
        {
            v = file::read_input( "geometry_params.txt"); 
        }
        else
        {
            v = file::read_input( argv[1]); 
        }
    }
    catch (toefl::Message& m) {  
        m.display(); 
        for( unsigned i = 0; i<v.size(); i++)
            std::cout << v[i] << " ";
            std::cout << std::endl;
        return -1;}
    //write parameters from file into variables
    solovev::GeomParameters gp(v);
    gp.display( std::cout);
    dg::Timer t;
    solovev::detail::Fpsi fpsi( gp, -10);
    solovev::Psip psip( gp); 
    std::cout << "Psi min "<<psip(gp.R_0, 0)<<"\n";
    t.tic();
    solovev::ConformalRingGrid g(gp, psi_0, psi_1, n, Nx, Ny, Nz, dg::DIR);
    t.toc();
    std::cout << "Construction took "<<t.diff()<<"s"<<std::endl;
    int ncid;
    file::NC_Error_Handle err;
    err = nc_create( "test.nc", NC_NETCDF4|NC_CLOBBER, &ncid);
    int dim3d[3];
    err = file::define_dimensions(  ncid, dim3d, g.grid());
    int coordsID[2], onesID;
    err = nc_def_var( ncid, "r_xy", NC_DOUBLE, 3, dim3d, &coordsID[0]);
    err = nc_def_var( ncid, "z_xy", NC_DOUBLE, 3, dim3d, &coordsID[1]);
    err = nc_def_var( ncid, "psi", NC_DOUBLE, 3, dim3d, &onesID);

    thrust::host_vector<double> ones = dg::pullback( psip, g);
    g.grid().display();
    err = nc_put_var_double( ncid, onesID, ones.data());
    err = nc_put_var_double( ncid, coordsID[0], g.r().data());
    err = nc_put_var_double( ncid, coordsID[1], g.z().data());
    err = nc_close( ncid);

    std::cout << "Construction successful!\n";

    //compute error in volume element
    dg::HVec temp0( g.grid().size()), temp1(temp0);
    dg::HVec w3d = dg::create::weights( g.grid());
    dg::blas1::pointwiseDot( g.g_xx(), g.g_yy(), temp0);
    dg::blas1::pointwiseDot( g.g_xy(), g.g_xy(), temp1);
    dg::blas1::axpby( 1., temp0, -1., temp1, temp0);
    //dg::blas1::transform( temp0, temp0, dg::SQRT<double>());
    dg::blas1::pointwiseDot( g.g_xx(), g.g_xx(), temp1);
    dg::blas1::axpby( 1., temp1, -1., temp0, temp0);
    std::cout<< "Rel Error in Determinant is "<<sqrt( dg::blas2::dot( temp0, w3d, temp0)/dg::blas2::dot( temp1, w3d, temp1))<<"\n";

    dg::blas1::pointwiseDot( g.g_xx(), g.g_yy(), temp0);
    dg::blas1::pointwiseDot( g.g_xy(), g.g_xy(), temp1);
    dg::blas1::axpby( 1., temp0, -1., temp1, temp0);
    std::cout << "magnitude "<<(dg::blas1::dot( w3d, temp0))<<"\n";
    dg::blas1::pointwiseDot( temp0, g.g_pp(), temp0);
    std::cout << "magnitude g_pp "<<(dg::blas1::dot( w3d, temp0))<<"\n";
    dg::blas1::transform( temp0, temp0, dg::SQRT<double>());
    std::cout << "magnitude sqrt "<<(dg::blas1::dot( w3d, temp0))<<"\n";
    dg::blas1::pointwiseDivide( ones, temp0, temp0);
    std::cout << "magnitude g_xx "<<(dg::blas1::dot( w3d, g.g_xx()))<<"\n";
    std::cout << "magnitude g_xy "<<(dg::blas1::dot( w3d, g.g_xy()))<<"\n";
    std::cout << "magnitude g_yy "<<(dg::blas1::dot( w3d, g.g_yy()))<<"\n";
    std::cout << "magnitude      "<<(dg::blas1::dot( w3d, temp0))<<"\n";
    dg::blas1::axpby( 1., temp0, -1., g.vol(), temp0);
    std::cout << "magnitude "<<(dg::blas1::dot(  w3d, g.vol()))<<"\n";
    std::cout << "Rel Consistency  of volume is "<<sqrt(dg::blas2::dot( temp0, w3d, temp0)/dg::blas2::dot( g.vol(), w3d, g.vol()))<<"\n";

    dg::blas1::pointwiseDivide( g.r(), g.g_xx(), temp0);
    dg::blas1::axpby( 1., temp0, -1., g.vol(), temp0);
    std::cout << "Rel Error of volume form is "<<sqrt(dg::blas2::dot( temp0, w3d, temp0))/sqrt( dg::blas2::dot(g.vol(), w3d, g.vol()))<<"\n";

    solovev::FieldY fieldY(gp);
    thrust::host_vector<double> by = dg::pullback( fieldY, g);
    for( unsigned k=0; k<Nz; k++)
        for( unsigned i=0; i<n*Ny; i++)
            for( unsigned j=0; j<n*Nx; j++)
                by[k*n*n*Nx*Ny + i*n*Nx + j] *= g.f_x()[j]*g.f_x()[j];
    dg::blas1::scal( by, 1./gp.R_0);
    dg::blas1::pointwiseDivide( g.g_xx(), g.r(), temp0);
    dg::blas1::axpby( 1., temp0, -1., by, temp1);
    double error= dg::blas2::dot( temp1, w3d, temp1);
    std::cout << "Rel Error of g.g_xx() is "<<sqrt(error/dg::blas2::dot( by, w3d, by))<<"\n";


    double volume = dg::blas1::dot( g.vol(), w3d);

    std::cout << "TEST VOLUME IS:\n";
    gp.psipmax = psi_1, gp.psipmin = psi_0;
    solovev::Iris iris( gp);
    dg::Grid3d<double> g3d( gp.R_0 -gp.a, gp.R_0 + gp.a, -gp.a, gp.a, 0, 2*M_PI, 3, 2200, 2200, 1, dg::PER, dg::PER, dg::PER, dg::cylindrical);
    dg::HVec vec  = dg::evaluate( iris, g3d);
    dg::HVec g3d_weights = dg::create::weights( g3d);
    double volumeRZP = dg::blas1::dot( vec, g3d_weights);
    std::cout << "volumeXYP is "<< volume<<std::endl;
    std::cout << "volumeRZP is "<< volumeRZP<<std::endl;
    std::cout << "relative difference in volume is "<<fabs(volumeRZP - volume)/volume<<std::endl;


    return 0;
}
