#pragma once

#include <cassert>
#include <thrust/host_vector.h>
#include "vector_traits.h"

namespace dg
{

struct MPI_Vector
{
    thrust::host_vector<double>& data() {return data_;}
    const thrust::host_vector<double>& data() const {return data_;}
    MPI_Comm communicator() const {return comm_;}
    MPI_Comm& communicator() {return comm_;}
    private:
    thrust::host_vector<double> data_; //!< thrust host vector as data type
    MPI_Comm comm_;
};

typedef MPI_Vector XVec;
template<> 
struct VectorTraits<MPI_Vector> {
    typedef double value_type;
    typedef MPIVectorTag vector_category;
};

template<> 
struct VectorTraits<const MPI_Vector> {
    typedef double value_type;
    typedef MPIVectorTag vector_category;
};

}//namespace dg
