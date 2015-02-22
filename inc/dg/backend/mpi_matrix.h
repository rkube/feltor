#pragma once


#include <cusp/ell_matrix.h>
#include "mpi_vector.h"
#include "mpi_collective.h"


namespace dg
{

template<class Matrix cusp::ell_matrix<int, double, cusp::host_memory> >
class MPI_Matrix
{
    public:
        void construct( const Matrix& matrix_global_idcs, MPI_Comm comm);
        const Matrix& data() const {return matrix_;}
        void gemv( MPIX_Vector& x, MPIX_Vector& y) const;
    private:
        cusp::ell_matrix<int, double, cusp::host_memory> matrix_;
        CollectiveGather coll_;
};
void MPI_Matrix::construct( const Matrix& matrix, MPI_Comm comm)
{
    thrust::host_vector<int> pids( matrix.num_entries);
    //first determine pids of all matrix entries using global column indices and the correspondent local index
    //construct Collective Gather with that
    //map matrix indices to new indices
}

void MPI_Matrix::gemv( MPI_Vector& x, MPI_Vector& y)
{
    thrust::host_vector<double> temp = coll_.gather( x.data());
    cusp::array1d_view< typename Vector::const_iterator> ctemp( temp.cbegin(), temp.cend());
    cusp::array1d_view< typename Vector::iterator> cy( y.data().begin(), y.data().end());
    cusp::multiply( matrix_, ctemp, cy);
}

} //namespace dg
