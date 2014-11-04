#include <iostream>
#include <iomanip>

#include "backend/xspacelib.cuh"
#include "backend/timer.cuh"

#include "elliptic.h"
#include "cg.h"


//NOTE: IF DEVICE=CPU THEN THE POLARISATION ASSEMBLY IS NOT PARALLEL AS IT IS NOW 

//global relative error in L2 norm is O(h^P)
//as a rule of thumb with n=4 the true error is err = 1e-3 * eps as long as eps > 1e3*err

const double lx = M_PI;
const double ly = M_PI;
dg::bc bcx = dg::DIR;
dg::bc bcy = dg::DIR;
//const double eps = 1e-3; //# of pcg iterations increases very much if 
 // eps << relativer Abstand der exakten Lösung zur Diskretisierung vom Sinus

double initial( double x, double y) {return 0.;}
double amp = 1;
//double pol( double x, double y) {return 1. + amp*sin(x)*sin(y); } //must be strictly positive
double pol( double x, double y) {return 1.; }
//double pol( double x, double y) {return 1. + sin(x)*sin(y) + x; } //must be strictly positive

//double rhs( double x, double y) { return 2.*sin(x)*sin(y)*(amp*sin(x)*sin(y)+1)-amp*sin(x)*sin(x)*cos(y)*cos(y)-amp*cos(x)*cos(x)*sin(y)*sin(y);}
double rhs( double x, double y) { return 2.*sin( x)*sin(y);}
//double rhs( double x, double y) { return 2.*sin(x)*sin(y)*(sin(x)*sin(y)+1)-sin(x)*sin(x)*cos(y)*cos(y)-cos(x)*cos(x)*sin(y)*sin(y)+(x*sin(x)-cos(x))*sin(y) + x*sin(x)*sin(y);}
double sol(double x, double y)  { return sin( x)*sin(y);}
double der(double x, double y)  { return cos( x)*sin(y);}


int main()
{
    dg::Timer t;
    unsigned n, Nx, Ny; 
    double eps;
    std::cout << "Type n, Nx and Ny and epsilon! \n";
    std::cin >> n >> Nx >> Ny; //more N means less iterations for same error
    std::cin >> eps;
    std::cout << "Computation on: "<< n <<" x "<<Nx<<" x "<<Ny<<std::endl;
    //std::cout << "# of 2d cells                 "<< Nx*Ny <<std::endl;
    dg::Grid2d<double> grid( 0, lx, 0, ly, n, Nx, Ny, bcx, bcy);
    dg::DVec w2d = dg::create::weights( grid);
    dg::DVec v2d = dg::create::inv_weights( grid);
    //create functions A(chi) x = b
    dg::DVec x =    dg::evaluate( initial, grid);
    dg::DVec b =    dg::evaluate( rhs, grid);
    dg::DVec chi =  dg::evaluate( pol, grid);
    dg::DVec temp = x;


    std::cout << "Create Polarisation object and set chi!\n";
    t.tic();
    {
    dg::Elliptic<dg::DMatrix, dg::DVec, dg::DVec> pol( grid, dg::not_normed, dg::centered);
    pol.set_chi( chi);
    t.toc();
    std::cout << "Creation of polarisation object took: "<<t.diff()<<"s\n";

    dg::Invert<dg::DVec > invert( x, n*n*Nx*Ny, eps);


    std::cout << eps<<" ";
    t.tic();
    std::cout << " "<< invert( pol, x, b);
    t.toc();
    //std::cout << "Took "<<t.diff()<<"s\n";
    }

    //compute error
    const dg::DVec solution = dg::evaluate( sol, grid);
    const dg::DVec derivati = dg::evaluate( der, grid);
    dg::DVec error( solution);

    dg::blas1::axpby( 1.,x,-1., solution, error);
    double err = dg::blas2::dot( w2d, error);
    //std::cout << "L2 Norm2 of Error is                       " << err << std::endl;
    const double norm = dg::blas2::dot( w2d, solution);
    std::cout << " "<<sqrt( err/norm);
    {
    dg::Elliptic<dg::DMatrix, dg::DVec, dg::DVec> pol_forward( grid, dg::not_normed, dg::forward);
    pol_forward.set_chi( chi);
    x = temp;
    dg::Invert<dg::DVec > invert_fw( x, n*n*Nx*Ny, eps);
    std::cout << " "<< invert_fw( pol_forward, x, b);
    dg::blas1::axpby( 1.,x,-1., solution, error);
    err = dg::blas2::dot( w2d, error);
    std::cout << " "<<sqrt( err/norm);
    }

    {
    dg::Elliptic<dg::DMatrix, dg::DVec, dg::DVec> pol_backward( grid, dg::not_normed, dg::backward);
    pol_backward.set_chi( chi);
    x = temp;
    dg::Invert<dg::DVec > invert_bw( x, n*n*Nx*Ny, eps);
    std::cout << " "<< invert_bw( pol_backward, x, b);
    dg::blas1::axpby( 1.,x,-1., solution, error);
    err = dg::blas2::dot( w2d, error);
    std::cout << " "<<sqrt( err/norm)<<std::endl;
    }


    dg::DMatrix DX = dg::create::dx( grid);
    dg::blas2::gemv( DX, x, error);
    dg::blas1::axpby( 1.,derivati,-1., error);
    err = dg::blas2::dot( w2d, error);
    //std::cout << "L2 Norm2 of Error in derivative is         " << err << std::endl;
    const double norm_der = dg::blas2::dot( w2d, derivati);
    std::cout << "L2 Norm of relative error in derivative is "<<sqrt( err/norm_der)<<std::endl;
    //derivative converges with p-1, for p = 1 with 1/2

    return 0;
}

