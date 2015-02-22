#pragma once
#include "mpi_vector_blas.h"
#include "mpi_precon.h"

namespace dg
{
namespace blas2
{
namespace detail
{
template< class Precon, class Vector>
inline typename MatrixTraits<Precon>::value_type doDot( const Vector& x, const Precon& P, const Vector& y, MPIPreconTag, MPIVectorTag)
{
#ifdef DG_DEBUG
    assert( x.data().size() == y.data().size() );
    assert( x.data().size()%P.n == 0 );
#endif //DG_DEBUG
    typename MatrixTraits<Precon>::value_type temp=0, sum=0;
    const unsigned n = P.n;
    for( unsigned m=0; m<P.Nz; m++)
        for( unsigned i=0; i<(P.Ny); i++)
        for( unsigned k=0; k<n; k++)
        {
            if( P.vec.empty() )
                for( unsigned j=0; j<(P.Nx); j++)
                for( unsigned l=0; l<n; l++)
                {
                    temp+=P.norm*P.data[k]*P.data[l]*
                      x.data()[(((m*P.Ny + i)*n + k)*P.Nx + j)*n +l ]*
                      y.data()[(((m*P.Ny + i)*n + k)*P.Nx + j)*n +l ];
                }
            else
                for( unsigned j=0; j<(P.Nx); j++)
                for( unsigned l=0; l<n; l++)
                {
                    temp+=P.norm*P.data[k]*P.data[l]*P.vec[j*n+l]*
                      x.data()[(((m*P.Ny + i)*n + k)*P.Nx + j)*n +l ]*
                      y.data()[(((m*P.Ny + i)*n + k)*P.Nx + j)*n +l ];
                }
        }
    MPI_Allreduce( &temp, &sum, 1, MPI_DOUBLE, MPI_SUM, MPI_COMM_WORLD);
    MPI_Barrier(MPI_COMM_WORLD); 

    return sum;
}
template< class Matrix, class Vector>
inline typename MatrixTraits<Matrix>::value_type doDot( const Matrix& m, const Vector& x, dg::MPIPreconTag, dg::MPIVectorTag)
{
    return doDot( x, m,x, MPIPreconTag(), MPIVectorTag());
}

template< class Precon, class Vector>
inline void doSymv(  
              typename MatrixTraits<Precon>::value_type alpha, 
              const Precon& P,
              const Vector& x, 
              typename MatrixTraits<Precon>::value_type beta, 
              Vector& y, 
              MPIPreconTag,
              MPIVectorTag)
{
#ifdef DG_DEBUG
    assert( x.data().size() == y.data().size() );
#endif //DG_DEBUG
    if( alpha == 0)
    {
        if( beta == 1) 
            return;
        dg::blas1::detail::doAxpby( 0., x, beta, y, dg::MPIVectorTag());
        return;
    }
    const unsigned& size = x.data().size();
#ifdef DG_DEBUG
    assert( P.n >= 1);
    assert( x.data().size() == y.data().size() );
    assert( size%P.n ==0);
#endif //DG_DEBUG
    const unsigned n = P.n;
    for( unsigned m=0; m<P.Nz; m++)
        for( unsigned i=0; i<(P.Ny); i++)
        for( unsigned k=0; k<n; k++)
            if( P.vec.empty())
            {
                for( unsigned j=0; j<(P.Nx); j++)
                for( unsigned l=0; l<n; l++)
                {
                      y.data()[(((m*P.Ny + i)*n + k)*P.Nx + j)*n +l ] = 
                          alpha*
                          P.norm*P.data[k]*P.data[l]*
                          x.data()[(((m*P.Ny + i)*n + k)*P.Nx + j)*n +l ] + 
                          beta*
                          y.data()[(((m*P.Ny + i)*n + k)*P.Nx + j)*n +l ];
                }
            }
            else
            {
                for( unsigned j=0; j<(P.Nx); j++)
                for( unsigned l=0; l<n; l++)
                {
                      y.data()[(((m*P.Ny + i)*n + k)*P.Nx + j)*n +l ] = 
                          alpha*
                          P.norm*P.data[k]*P.data[l]*P.vec[j*n+l]*
                          x.data()[(((m*P.Ny + i)*n + k)*P.Nx + j)*n +l ] + 
                          beta*
                          y.data()[(((m*P.Ny + i)*n + k)*P.Nx + j)*n +l ];
                }
            }
}

template< class Matrix, class Vector>
inline void doSymv( const Matrix& m, const Vector&x, Vector& y, MPIPreconTag, MPIVectorTag, MPIVectorTag  )
{
    doSymv( 1., m, x, 0, y, MPIPreconTag(), MPIVectorTag());
}


} //namespace detail
} //namespace blas2
} //namespace dg
