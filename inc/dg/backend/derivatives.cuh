#ifndef _DG_DERIVATIVES_CUH_
#define _DG_DERIVATIVES_CUH_

#include <cusp/elementwise.h>

#include "grid.h"
#include "creation.cuh"
#include "dx.cuh"
#include "functions.h"
#include "dxx.cuh"
#include "operator_tensor.cuh"
#include "tensor.cuh"

/*! @file 
  
  Convenience functions to create 2D derivatives
  */
namespace dg{


/**
 * @brief Contains functions used for matrix creation
 */
namespace create{
///@cond
namespace detail{

template< class T>
cusp::coo_matrix<int, T, cusp::host_memory> weights( const Grid2d<T>& g)
{
    typedef cusp::coo_matrix<int, T, cusp::host_memory> Matrix;
    Matrix Wx = dg::tensor( g.Nx(), dg::create::weights( g.n())); 
    cusp::blas::scal( Wx.values, g.hx()/2.);
    Matrix Wy = dg::tensor( g.Ny(), dg::create::weights( g.n())); 
    cusp::blas::scal( Wy.values, g.hy()/2.);
    return dg::dgtensor(g.n(), Wy, Wx);
}
template< class T>
cusp::coo_matrix<int, T, cusp::host_memory> weights( const Grid3d<T>& g)
{
    typedef cusp::coo_matrix<int, T, cusp::host_memory> Matrix;
    Matrix Wx = dg::tensor( g.Nx(), dg::create::weights( g.n())); 
    cusp::blas::scal( Wx.values, g.hx()/2.);
    Matrix Wy = dg::tensor( g.Ny(), dg::create::weights( g.n())); 
    cusp::blas::scal( Wy.values, g.hy()/2.);
    Matrix Wz = dg::tensor( g.Nz(), dg::create::weights( g.nz())); 
    cusp::blas::scal( Wz.values, g.hz()/2.);
    Matrix temp = dg::dgtensor<T>( 1, Wy, Wx);
    return dg::dgtensor<T>(1, Wz, temp);
}
template< class T>
cusp::coo_matrix<int, T, cusp::host_memory> precond( const Grid2d<T>& g)
{
    typedef cusp::coo_matrix<int, T, cusp::host_memory> Matrix;
    Matrix W2D = weights( g);
    for(unsigned i=0; i < W2D.values.size(); i++)
        W2D.values[i] = 1./W2D.values[i];
    return W2D;
}

template< class T>
cusp::coo_matrix<int, T, cusp::host_memory> renorm( const cusp::coo_matrix<int, T, cusp::host_memory>& matrix, const Grid2d<T>& g)
{
    typedef cusp::coo_matrix<int, T, cusp::host_memory> Matrix;
    Matrix W2D = detail::weights( g);
    Matrix renormed;
    cusp::multiply( W2D, matrix, renormed);
    return renormed;
}

template< class T>
cusp::coo_matrix<int, T, cusp::host_memory> renorm( const cusp::coo_matrix<int, T, cusp::host_memory>& matrix, const Grid3d<T>& g)
{
    typedef cusp::coo_matrix<int, T, cusp::host_memory> Matrix;
    Matrix W3D = detail::weights( g);
    Matrix renormed;
    cusp::multiply( W3D, matrix, renormed);
    return renormed;
}

}

///@endcond

///@addtogroup highlevel
///@{


/**
 * @brief Create 2d derivative in x-direction
 *
 * @tparam T value-type
 * @param g The grid on which to create dx
 * @param bcx The boundary condition
 * @param no use normed normally
             use not_normed if you know what you're doing
 * @param dir The direction of the first derivative
 *
 * @return A host matrix in coordinate format
 */
template< class T>
cusp::coo_matrix<int, T, cusp::host_memory> dx( const Grid2d<T>& g, bc bcx, norm no = normed, direction dir = centered)
{
    typedef cusp::coo_matrix<int, T, cusp::host_memory> Matrix;
    Matrix deltaY = dg::tensor( g.Ny(), dg::create::delta( g.n())); 
    Matrix dx;
    if( dir == centered)
        dx = create::dx_symm_normed<T>(g.n(), g.Nx(), g.hx(), bcx);
    else if (dir == forward)
        dx = create::dx_plus_normed<T>(g.n(), g.Nx(), g.hx(), bcx);
    else if (dir == backward)
        dx = create::dx_minus_normed<T>(g.n(), g.Nx(), g.hx(), bcx);
    Matrix bdxf = dgtensor( g.n(), deltaY, dx); 
    if( no == not_normed)
        return detail::renorm( bdxf, g);
    return bdxf;
}

/**
 * @brief Create 2d derivative in x-direction
 *
 * @tparam T value-type
 * @param g The grid on which to create dx (boundary condition is taken from here)
 * @param no use normed normally
             use not_normed if you know what you're doing
 * @param dir The direction of the first derivative
 *
 * @return A host matrix in coordinate format
 */
template< class T>
cusp::coo_matrix<int, T, cusp::host_memory> dx( const Grid2d<T>& g, norm no = normed, direction dir = centered) { return dx( g, g.bcx(), no, dir);}

/**
 * @brief Create 2d derivative in y-direction
 *
 * @tparam T value-type
 * @param g The grid on which to create dy
 * @param bcy The boundary condition
 * @param no use normed normally
             use not_normed if you know what you're doing
 * @param dir The direction of the first derivative
 *
 * @return A host matrix in coordinate format
 */
template< class T>
cusp::coo_matrix<int, T, cusp::host_memory> dy( const Grid2d<T>& g, bc bcy, norm no = normed, direction dir = centered)
{
    typedef cusp::coo_matrix<int, T, cusp::host_memory> Matrix;
    Matrix deltaX = dg::tensor( g.Nx(), dg::create::delta( g.n())); 
    Matrix dy;
    if( dir == centered)
        dy = create::dx_symm_normed<T>(g.n(), g.Ny(), g.hy(), bcy);
    else if (dir == forward)
        dy = create::dx_plus_normed<T>(g.n(), g.Ny(), g.hy(), bcy);
    else if (dir == backward)
        dy = create::dx_minus_normed<T>(g.n(), g.Ny(), g.hy(), bcy);
    Matrix bdyf = dgtensor( g.n(), dy, deltaX); 
    if( no == not_normed)
        return detail::renorm( bdyf,g);
    return bdyf;
}

/**
 * @brief Create 2d derivative in y-direction
 *
 * @tparam T value-type
 * @param g The grid on which to create dy (boundary condition is taken from here)
 * @param no use normed normally
             use not_normed if you know what you're doing
 * @param dir The direction of the first derivative
 *
 * @return A host matrix in coordinate format
 */
template< class T>
cusp::coo_matrix<int, T, cusp::host_memory> dy( const Grid2d<T>& g, norm no = normed, direction dir = centered){ return dy( g, g.bcy(), no, dir);}

//the behaviour of CG is completely the same in xspace as in lspace
/**
 * @brief Create 2d negative laplacian
 *
 * \f[ -\Delta = -(\partial_x^2 + \partial_y^2) \f]
 * @tparam T value-type
 * @param g The grid on which to operate
 * @param bcx Boundary condition in x
 * @param bcy Boundary condition in y
 * @param no use normed if you want to compute e.g. diffusive terms,
             use not_normed if you want to solve symmetric matrix equations (T resp. V is missing)
 * @param dir The direction of the first derivative
 *
 * @return A host matrix in coordinate format
 * @deprecated Use Elliptic class instead
 */
template< class T>
cusp::coo_matrix<int, T, cusp::host_memory> laplacianM( const Grid2d<T>& g, bc bcx, bc bcy, norm no = normed, direction dir = forward)
{
    typedef cusp::coo_matrix<int, T, cusp::host_memory> Matrix;

    Grid1d<T> gy( g.y0(), g.y1(), g.n(), g.Ny(), bcy);
    Matrix ly = create::laplace1d( gy, bcy, normed, dir);
    
    Grid1d<T> gx( g.x0(), g.x1(), g.n(), g.Nx(), bcx);
    Matrix lx = create:: laplace1d( gx, bcx, normed, dir);

    Matrix ddyy = dgtensor<double>( g.n(), ly, tensor( g.Nx(), create::delta(g.n())));
    Matrix ddxx = dgtensor<double>( g.n(), tensor(g.Ny(), create::delta(g.n())), lx);
    Matrix laplace;
    cusp::add( ddxx, ddyy, laplace); //cusp add does not sort output!!!!
    laplace.sort_by_row_and_column();
    if( no == not_normed)
        return detail::renorm( laplace, g);
    return laplace;
}

/**
 * @brief Create 2d negative laplacian
 *
 * \f[ -\Delta = -(\partial_x^2 + \partial_y^2) \f]
 * @tparam T value-type
 * @param g The grid on which to operate (boundary conditions are taken from here)
 * @param no use normed if you want to compute e.g. diffusive terms, 
             use not_normed if you want to solve symmetric matrix equations (T resp. V is missing)
 * @param dir The direction of the first derivative
 *
 * @return A host matrix in coordinate format
 * @deprecated Use Elliptic class instead
 */
template< class T>
cusp::coo_matrix<int, T, cusp::host_memory> laplacianM( const Grid2d<T>& g, norm no = normed, direction dir = forward)
{
    return laplacianM( g, g.bcx(), g.bcy(), no, dir);
}

/**
 * @brief Matrix that contains 2d jump terms
 *
 * @tparam T value type
 * @param g grid
 * @param bcx boundary condition in x
 * @param bcy boundary condition in y
 * @param no the norm
 *
 * @return A host matrix in coordinate format
 */
template< class T>
cusp::coo_matrix<int, T, cusp::host_memory> jump2d( const Grid2d<T>& g, bc bcx, bc bcy, norm no)
{
    //without jump cg is unstable
    typedef cusp::coo_matrix<int, T, cusp::host_memory> Matrix;
    Matrix jumpx = create::jump_normed<T>( g.n(), g.Nx(), g.hx(), bcx); 
    Matrix jumpy = create::jump_normed<T>( g.n(), g.Ny(), g.hy(), bcy); 
    Matrix yy = dgtensor<double>( g.n(), jumpy, tensor( g.Nx(), create::delta(g.n())));
    Matrix xx = dgtensor<double>( g.n(), tensor(g.Ny(), create::delta(g.n())), jumpx);
    Matrix jump;
    cusp::add( xx, yy, jump); //cusp add does not sort output!!!!
    jump.sort_by_row_and_column();
    if( no == not_normed)
        return detail::renorm( jump, g);
    return jump;
}

/**
 * @brief Matrix that contains 2d jump terms taking boundary conditions from the grid
 *
 * @tparam T value type
 * @param g grid
 * @param no the norm
 *
 * @return A host matrix in coordinate format
 */
template< class T>
cusp::coo_matrix<int, T, cusp::host_memory> jump2d( const Grid2d<T>& g, norm no)
{
    return jump2d( g, g.bcx(), g.bcy(), no);
}

///////////////////////////////////////////3D VERSIONS//////////////////////
/**
 * @brief Matrix that contains 2d jump terms
 *
 * @tparam T value type
 * @param g grid
 * @param bcx boundary condition in x
 * @param bcy boundary condition in y
 * @param no the norm
 *
 * @return A host matrix in coordinate format
 */
template< class T>
cusp::coo_matrix<int, T, cusp::host_memory> jump2d( const Grid3d<T>& g, bc bcx, bc bcy, norm no)
{
    typedef cusp::coo_matrix<int, T, cusp::host_memory> Matrix;
    Grid2d<T> g2d( g.x0(), g.x1(), g.y0(), g.y1(), g.n(), g.Nx(), g.Ny());
    Matrix jump_ = create::jump2d( g2d, bcx, bcy, normed);
    Matrix jump__ = dgtensor<T>( g.nz(), tensor<T>( g.Nz(), delta(g.nz()) ), jump_);
    if( no == not_normed)
        return detail::renorm( jump__, g);
    return jump__;
}

/**
 * @brief Matrix that contains 2d jump terms taking boundary conditions from the grid
 *
 * @tparam T value type
 * @param g grid
 * @param no the norm
 *
 * @return A host matrix in coordinate format
 */
template< class T>
cusp::coo_matrix<int, T, cusp::host_memory> jump2d( const Grid3d<T>& g, norm no)
{
    return jump( g, g.bcx(), g.bcy(), no);
}

/**
 * @brief Create 3d derivative in x-direction
 *
 * @tparam T value-type
 * @param g The grid on which to create dx
 * @param bcx The boundary condition
 * @param no use normed normally
             use not_normed if you know what you're doing
 * @param dir The direction of the first derivative
 *
 * @return A host matrix in coordinate format
 */
template< class T>
cusp::coo_matrix<int, T, cusp::host_memory> dx( const Grid3d<T>& g, bc bcx, norm no = normed, direction dir = centered)
{
    typedef cusp::coo_matrix<int, T, cusp::host_memory> Matrix;
    Grid2d<T> g2d( g.x0(), g.x1(), g.y0(), g.y1(), g.n(), g.Nx(), g.Ny());
    Matrix dx = create::dx( g2d, bcx, normed, dir);
    Matrix dx_ = dgtensor<T>( 1, tensor<T>( g.Nz(), delta(g.nz()) ), dx);
    if( no == not_normed)
        return detail::renorm( dx_, g);
    return dx_;
}

/**
 * @brief Create 3d derivative in x-direction
 *
 * @tparam T value-type
 * @param g The grid on which to create dx (boundary condition is taken from here)
 * @param no use normed normally
             use not_normed if you know what you're doing
 * @param dir The direction of the first derivative
 *
 * @return A host matrix in coordinate format
 */
template< class T>
cusp::coo_matrix<int, T, cusp::host_memory> dx( const Grid3d<T>& g, norm no = normed, direction dir = centered) { return dx( g, g.bcx(), no, dir);}

/**
 * @brief Create 3d derivative in y-direction
 *
 * @tparam T value-type
 * @param g The grid on which to create dy
 * @param bcy The boundary condition
 * @param no use normed normally
             use not_normed if you know what you're doing
 * @param dir The direction of the first derivative
 *
 * @return A host matrix in coordinate format
 */
template< class T>
cusp::coo_matrix<int, T, cusp::host_memory> dy( const Grid3d<T>& g, bc bcy, norm no = normed, direction dir = centered)
{
    typedef cusp::coo_matrix<int, T, cusp::host_memory> Matrix;
    Grid2d<T> g2d( g.x0(), g.x1(), g.y0(), g.y1(), g.n(), g.Nx(), g.Ny());
    Matrix dy = create::dy( g2d, bcy, normed, dir);
    Matrix dy_ = dgtensor<T>( 1, tensor<T>( g.Nz(), delta(g.nz()) ), dy);
    if( no == not_normed)
        return detail::renorm( dy_, g);
    return dy_;
}

/**
 * @brief Create 3d derivative in y-direction
 *
 * @tparam T value-type
 * @param g The grid on which to create dy (boundary condition is taken from here)
 * @param no use normed normally
             use not_normed if you know what you're doing
 * @param dir The direction of the first derivative
 *
 * @return A host matrix in coordinate format
 */
template< class T>
cusp::coo_matrix<int, T, cusp::host_memory> dy( const Grid3d<T>& g, norm no = normed, direction dir = centered){ return dy( g, g.bcy(),no, dir);}

/**
 * @brief Create 3d derivative in z-direction
 *
 * @tparam T value-type
 * @param g The grid on which to create dz
 * @param bcz The boundary condition
 * @param no use normed normally
             use not_normed if you know what you're doing
 * @param dir The direction of the stencil
 *
 * @return A host matrix in coordinate format
 */
template< class T>
cusp::coo_matrix<int, T, cusp::host_memory> dz( const Grid3d<T>& g, bc bcz, norm no = normed, direction dir = centered)
{
    //dasselbe wie dy in 2D: 
    typedef cusp::coo_matrix<int, T, cusp::host_memory> Matrix;
    Matrix dz; 
    if( dir == forward) 
        dz = create::dx_plus_normed<T>(g.nz(), g.Nz(), g.hz(), bcz);
    else if( dir == backward) 
        dz = create::dx_minus_normed<T>(g.nz(), g.Nz(), g.hz(), bcz);
    else
        dz = create::dx_symm_normed<T>(g.nz(), g.Nz(), g.hz(), bcz);
    Matrix deltaXY = dg::tensor<T>( g.Nx()*g.Ny(), dg::create::delta( g.n()*g.n() )); 
    Matrix temp =  dgtensor<T>( 1, dz, deltaXY); 
    if( no == not_normed)
        return  detail::renorm( temp, g);
    return temp;

}

/**
 * @brief Create 3d derivative in z-direction
 *
 * @tparam T value-type
 * @param g The grid on which to create dy (boundary condition is taken from here)
 * @param no use normed normally
             use not_normed if you know what you're doing
 * @param dir The direction of the stencil
 *
 * @return A host matrix in coordinate format
 */
template< class T>
cusp::coo_matrix<int, T, cusp::host_memory> dz( const Grid3d<T>& g, norm no = normed, direction dir = centered){ return dz( g, g.bcz(), no, dir);}
/**
 * @brief Matrix that contains 2d jump terms
 *
 * @tparam T value type
 * @param g grid
 * @param bcx boundary condition in x
 * @param bcy boundary condition in y
 * @param no the norm
 *
 * @return A host matrix in coordinate format
 */
template< class T>
cusp::coo_matrix<int, T, cusp::host_memory> jump3d( const Grid3d<T>& g, bc bcx, bc bcy, bc bcz, norm no)
{
    //without jump cg is unstable
    typedef cusp::coo_matrix<int, T, cusp::host_memory> Matrix;
    Matrix jump2 = create::jump2d( g, bcx, bcy, normed);
    Matrix jump_z = create::jump_normed<T>( g.nz(), g.Nz(), g.hz(), bcz); 
    Matrix deltaXY = dg::tensor<T>( g.Nx()*g.Ny(), dg::create::delta( g.n()*g.n() )); 
    Matrix zz =  dgtensor<T>( 1, jump_z, deltaXY); 
    Matrix jump; 
    cusp::add( jump2, zz, jump);
    jump.sort_by_row_and_column();
    if( no == not_normed)
        return detail::renorm( jump, g);
    return jump;
}

/**
 * @brief Matrix that contains 2d jump terms taking boundary conditions from the grid
 *
 * @tparam T value type
 * @param g grid
 * @param no the norm
 *
 * @return A host matrix in coordinate format
 */
template< class T>
cusp::coo_matrix<int, T, cusp::host_memory> jump3d( const Grid3d<T>& g, norm no)
{
    return jump3d( g, g.bcx(), g.bcy(), g.bcz(), no);
}

/**
 * @brief Create 3d negative laplacian_perp
 *
 * \f[ -\Delta = -(\partial_x^2 + \partial_y^2) \f]
 * @tparam T value-type
 * @param g The grid on which to operate
 * @param bcx Boundary condition in x
 * @param bcy Boundary condition in y
 * @param no use normed if you want to compute e.g. diffusive terms,
             use not_normed if you want to solve symmetric matrix equations (T resp. V is missing)
 * @param dir The direction of the first derivative
 *
 * @return A host matrix in coordinate format
 * @deprecated use Elliptic class instead
 */
template< class T>
cusp::coo_matrix<int, T, cusp::host_memory> laplacianM_perp( const Grid3d<T>& g, bc bcx, bc bcy, norm no = normed, direction dir = forward)
{
    typedef cusp::coo_matrix<int, T, cusp::host_memory> Matrix;
    Grid2d<T> g2d( g.x0(), g.x1(), g.y0(), g.y1(), g.n(), g.Nx(), g.Ny());
    Matrix laplace2d = create::laplacianM( g2d, bcx, bcy, no, dir);
    if( no == normed)
        return dgtensor<T>( 1, tensor<T>( g.Nz(), delta(1) ), laplace2d );
    else 
        return dgtensor<T>( 1, tensor<T>( g.Nz(), g.hz()*delta(1)), laplace2d); //w*hz/2 = hz

}

/**
 * @brief Create 3d negative perpendicular laplacian
 *
 * \f[ -\Delta = -(\partial_x^2 + \partial_y^2) \f]
 * @tparam T value-type
 * @param g The grid on which to operate (boundary conditions are taken from here)
 * @param no use normed if you want to compute e.g. diffusive terms, 
             use not_normed if you want to solve symmetric matrix equations (T resp. V is missing)
 * @param dir The direction of the first derivative
 *
 * @return A host matrix in coordinate format
 * @deprecated Use Elliptic class instead
 */
template< class T>
cusp::coo_matrix<int, T, cusp::host_memory> laplacianM_perp( const Grid3d<T>& g, norm no = normed, direction dir = forward)
{
    return laplacianM_perp( g, g.bcx(), g.bcy(), no, dir);
}

/**
 * @brief Create normed 3d negative parallel laplacian in XSPACE
 *
 * \f[ -\Delta = -\partial_z^2  \f]
 * @tparam T value-type
 * @param g The grid on which to operate 
 * @param bcz boundary condition
 * @param dir The direction of the first derivative
 *
 * @return A host matrix in coordinate format
 */
template< class T>
cusp::coo_matrix<int, T, cusp::host_memory> laplacianM_parallel( const Grid3d<T>& g, bc bcz, direction dir = forward)
{
    typedef cusp::coo_matrix<int, T, cusp::host_memory> Matrix;
    Grid1d<T> g1d( g.z0(), g.z1(), 1, g.Nz(), bcz);
    Matrix lz = create::laplace1d( g1d, bcz, normed, dir);

    return dgtensor<T>( 1, lz, tensor<T>( g.Nx()*g.Ny(), delta(g.n()*g.n())));

}
///@}

} //namespace create

} //namespace dg
#endif//_DG_DERIVATIVES_CUH_
