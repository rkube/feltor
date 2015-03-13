#include <iostream>
#include <cmath>

#include <thrust/host_vector.h>
#include <thrust/device_vector.h>

#include "evaluation.cuh"
#include "weights.cuh"

#include "blas.h"

double function( double x)
{
    return exp(x);
}

double function( double x, double y)
{
        return exp(x)*exp(y);
}
double function( double x, double y, double z)
{
        return exp(x)*exp(y)*exp(z);
}

const double lx = 2;
const double ly = 2;
const double lz = 2;

typedef thrust::device_vector< double>   DVec;
typedef thrust::host_vector< double>     HVec;

int main()
{
    //This file tests not only the evaluation functions but also the weights
    unsigned n;
    std::cout << "Type # of polynomial coefficients ( 1, 2,...,20)!\n";
    std::cin >> n;
    unsigned Nx, Ny, Nz;
    std::cout << "# of polynomial coefficients is: "<< n<<std::endl;
    std::cout << "Type # of grid cells Nx, Ny and Nz!\n";
    std::cin >> Nx >> Ny >> Nz;
    std::cout << "# grid cells are: "<< Nx<<" x "<<Ny<<" x "<<Nz<<"\n";

    dg::Grid1d<double> g1d( 0, lx, n, Nx);
    dg::Grid2d<double> g2d( 0, lx,0, ly,n, Nx, Ny);
    dg::Grid3d<double> g3d( 0, lx,0, ly,0, lz, n, Nx, Ny, Nz,dg::PER,dg::PER,dg::PER,dg::cylindrical, false);

    //test evaluation functions
    HVec h_x = dg::evaluate( function, g1d);
    HVec h_n = dg::evaluate( function, g2d);
    HVec h_z = dg::evaluate( function, g3d);
    HVec w3d = dg::create::weights( g3d);

    //test preconditioners
    double normX = dg::blas2::dot( h_x, dg::create::weights(g1d), h_x);
    double norm2X = dg::blas2::dot( dg::create::weights(g2d), h_n);
    double norm3X = dg::blas2::dot( h_z, w3d, h_z);

    std::cout << "Square normalized 1DXnorm "<< normX <<"\n";
    double solution = (exp(4.) -exp(0))/2.;
    std::cout << "Correct square norm is    "<<solution<<std::endl;
    std::cout << "Square normalized 2DXnorm "<< norm2X<<"\n";
    double solution2 = (exp(4.)-exp(0))/2.*(exp(4.) -exp(0))/2.;
    std::cout << "Correct square norm is    "<<solution2<<std::endl;

    std::cout << "Square normalized 3DXnorm   "<< norm3X<<"\n";
    if( g3d.system() == dg::cylindrical)
        solution = (3*exp(4.)+1.)/4.;
    double solution3 = solution2*solution;
    std::cout << "Correct square norm is      "<<solution3<<std::endl;
    std::cout << "Relative 3d error is        "<<(norm3X-solution3)/solution3<<"\n";
    return 0;
} 
