#ifndef _DG_MATRIX_CATEGORIES_
#define _DG_MATRIX_CATEGORIES_

namespace dg{

struct AnyMatrixTag{};

struct StdMatrixTag{}; //DEPRECATED

//normal matrices
struct CuspMatrixTag: public AnyMatrixTag {};

struct SelfMadeMatrixTag {}; //A selfmade matrix can with any Vector

struct MPIMatrixTag: public AnyMatrixTag {};

//preconditioners
struct ThrustMatrixTag: public AnyMatrixTag {};

struct MPIPreconTag: public AnyMatrixTag {};

}//namespace dg

#endif //_DG_MATRIX_CATEGORIES_