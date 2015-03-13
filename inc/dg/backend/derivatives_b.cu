#include <iostream>

#include "blas.h"
#include "derivatives.cuh"
#include "evaluation.cuh"
#include "typedefs.cuh"

#include "timer.cuh"

const double lx = 2*M_PI;
/*
double function( double x, double y, double z) { return sin(3./4.*z);}
double derivative( double x, double y, double z) { return 3./4.*cos(3./4.*z);}
dg::bc bcz = dg::DIR_NEU;
*/
double function  ( double x, double y, double z) { return sin(z);}
double derivative( double x, double y, double z) { return cos(z);}
double functionX  ( double x, double y, double z) { return sin(x);}
double derivativeX( double x, double y, double z) { return cos(x);}
dg::bc bcx = dg::DIR;

void multiply( dg::Operator<double>& op, const double* x, double* y)
{
    for( unsigned i=0; i<op.size(); i++)
    {
        y[i] = 0;
        for( unsigned j=0; j<op.size(); j++)
            y[i]+= op(i,j)*x[j];
    }
}

int main()
{
    dg::Timer t;
    unsigned n, Nx, Ny, Nz;
    std::cout << "Note the supraconvergence!\n";
    std::cout << "Type in n, Nx, Ny and Nz!\n";
    std::cin >> n >> Nx >> Ny >> Nz;
    std::cout << "# of polynomials    " << n <<"\n";
    std::cout << "on the grid " << Nx <<" x "<<Ny<<" x "<<Nz<<"\n";
    dg::Grid3d<double> g( 0, lx, 0, lx,0, lx, n, Nx, Ny, Nz, dg::PER, dg::PER, dg::PER, dg::cartesian, false);
    dg::DMatrix dx = dg::create::dx( g, bcx, dg::normed);
    dg::DMatrix dz = dg::create::dz( g, bcx, dg::normed);
    //dg::DMatrix lxM = dg::create::laplacianM( g, bcx, dg::PER, dg::normed, dg::centered);
    const dg::DVec hv = dg::evaluate( function, g);
    const dg::DVec hX = dg::evaluate( functionX, g);
    dg::DVec hw = hv;
    dg::DVec w3d = dg::create::weights(g);
    dg::DVec v3d = dg::create::inv_weights(g);
    const dg::DVec hu = dg::evaluate( derivative, g);
    const dg::DVec huX = dg::evaluate( derivativeX, g);
    t.tic();
    dg::blas2::symv( dz, hv, hw);
    //dg::blas1::pointwiseDot( v3d, hw, hw);
    t.toc();
    std::cout << "Evaluation of dx took "<<t.diff()<<"s\n";
    dg::blas1::axpby( 1., hu, -1., hw);
    std::cout << "Distance Z to true solution: "<<sqrt(dg::blas2::dot(hw, w3d, hw))<<"\n";
    dg::blas2::symv( dx, hX, hw);
    dg::blas1::axpby( 1., huX, -1., hw);
    std::cout << "Distance X to true solution: "<<sqrt(dg::blas2::dot(hw, w3d, hw))<<"\n";
    //t.tic();
    //for( unsigned i=0; i<10; i++)
    //    dg::blas2::symv( lxM, hv, hw);
    //t.toc();
    //std::cout << "Evaluation of Lx took "<<t.diff()/10.<<"s\n";
    //dg::blas1::axpby( 1., hv, -1., hw);
    //std::cout << "Distance to true solution: "<<sqrt(dg::blas2::dot(hw, (dg::DVec)dg::create::weights(g), hw))<<"\n";
    //for periodic bc | dirichlet bc
    //n = 1 -> p = 2      2
    //n = 2 -> p = 1      1
    //n = 3 -> p = 3      3
    //n = 4 -> p = 3      3
    //n = 5 -> p = 5      5
    /*
    std::cout << "TEST VARIOUS HOST VERSIONS OF DERIVATIVE!\n";
    dg::Operator<double> forw( g.dlt().forward( ));
    dg::Operator<double> back( g.dlt().forward( ));
    dg::HMatrix DX(dx);
    const dg::HVec v = dg::evaluate( function, g);
    dg::HVec w(v);
    t.tic();
    double temp[n];
    for( unsigned i=0; i<10; i++)
        for( unsigned k=0; k<(Ny-1)*(Nx-1); k++)
        {
            multiply( forw, &v[k*n], &w[k*n]);
            multiply( back, &v[(k+1)*n], temp);
            for( unsigned j=0; j<n; j++)
                w[k*n+j] += temp[j];
        }
    t.toc();
    std::cout << "Evaluation of host derivative took "<<t.diff()/10.<<"s\n";
    t.tic();
    for( unsigned i=0; i<10; i++)
        dg::blas2::symv( DX, v, w);
    t.toc();
    std::cout << "Evaluation of host derivative took "<<t.diff()/10.<<"s\n";
    */

    return 0;
}
