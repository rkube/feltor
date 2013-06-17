#ifndef _DG_TOEFLR_CUH
#define _DG_TOEFLR_CUH


#include "xspacelib.cuh"
#include "cg.cuh"
#include "nvcc/gamma.cuh"

#ifdef DG_BENCHMARK
#include "timer.cuh"
#endif
namespace dg
{


    /**
     * @brief Global toefl solver with FLR effects
     *
     jkjkkjkj
     * @tparam T
     * @tparam n
     * @tparam container
     */
template< class T, size_t n, class container=thrust::device_vector<T> >
struct ToeflR
{
    typedef std::vector<container> Vector;
    typedef typename thrust::iterator_space<typename container::iterator>::type MemorySpace;
    typedef cusp::ell_matrix<int, T, MemorySpace> Matrix;

    //toeflR is always global
    ToeflR( const Grid<T,n>& g, double kappa, double nu, double tau, double eps_pol, double eps_gamma, bool global);

    void exp( const std::vector<container>& y, std::vector<container>& target);
    void log( const std::vector<container>& y, std::vector<container>& target);
    const container& polarisation( ) const { return phi[0];}
    const Matrix& laplacianM( ) const { return laplaceM;}
    const Gamma<Matrix, W2D<T,n> >&  gamma() const {return gamma1;}
    void operator()( const std::vector<container>& y, std::vector<container>& yp);
  private:
    const std::vector<container>& polarisation( const std::vector<container>& y);
    container chi, omega;
    container gamma_n, gamma_old;
    const container binv;

    std::vector<container> phi, phi_old, dyphi;
    std::vector<container> expy, dxy, dyy, lapy;

    Matrix A; //contains unnormalized laplacian if local
    Matrix laplaceM; //contains normalized laplacian
    Gamma< Matrix, W2D<T,n> > gamma1;
    ArakawaX<T, n, container> arakawa; 
    Polarisation2dX<T, n, thrust::host_vector<T> > pol; //note the host vector
    CG<container > pcg;

    const W2D<T,n> w2d;
    const V2D<T,n> v2d;
    double eps_pol, eps_gamma; 
    double kappa, nu, tau;
    bool global;

};

template< class T, size_t n, class container>
ToeflR<T, n, container>::ToeflR( const Grid<T,n>& grid, double kappa, double nu, double tau, double eps_pol, double eps_gamma, bool global ): 
    chi( grid.size(), 0.), omega(chi), gamma_n( chi), gamma_old( chi), 
    binv( evaluate( LinearX( kappa, 1.), grid)), 
    phi( 2, chi), phi_old( phi), dyphi( phi),
    expy( phi), dxy( expy), dyy( dxy), lapy( dyy),
    gamma1(  laplaceM, w2d, -0.5*tau),
    arakawa( grid), 
    pol(     grid), 
    pcg( omega, omega.size()), 
    w2d( grid), v2d( grid),
    eps_pol(eps_pol), eps_gamma( eps_gamma), kappa(kappa), nu(nu), tau( tau), global( global)
{
    //create derivatives
    laplaceM = create::laplacianM( grid, normed);
    if( !global)
        A = create::laplacianM( grid, not_normed);

}


//how to set up a computation?
template< class T, size_t n, class container>
const std::vector<container>& ToeflR<T, n, container>::polarisation( const std::vector<container>& y)
{
    //extrapolate phi and gamma_n
    blas1::axpby( 2., phi[0], -1.,  phi_old[0]);
    blas1::axpby( 2., phi[1], -1.,  phi_old[1]);
    blas1::axpby( 2., gamma_n, -1., gamma_old);
    //blas1::axpby( 1., phi[1], 0.,  phi_old[1]);
    //blas1::axpby( 0., gamma_n, 0., gamma_old);
    gamma_n.swap( gamma_old);
    phi.swap( phi_old);

#ifdef DG_BENCHMARK
    Timer t; 
    t.tic();
#endif
    //compute chi and polarisation
    if( global) 
    {
        exp( y, expy);
        //blas1::axpby( 1., expy[1], 0., chi); //\chi = a_i \mu_i n_i
        blas1::pointwiseDot( binv, expy[1], chi); //\chi = n_i
        blas1::pointwiseDot( binv, chi, chi); //\chi *= binv^2
        cudaThreadSynchronize();
        cusp::csr_matrix<int, double, MemorySpace> B = pol.create(chi); //first transfer to device
        A = B; 
        //compute omega
        thrust::transform( expy[0].begin(), expy[0].end(), expy[0].begin(), dg::PLUS<double>(-1)); //n_e -1
        thrust::transform( expy[1].begin(), expy[1].end(), omega.begin(), dg::PLUS<double>(-1)); //n_i -1
    }
    else
    {
        blas1::axpby( 1., y[1], 0., omega); //n_i = omega
    }
    blas2::symv( w2d, omega, omega); 
#ifdef DG_BENCHMARK
    t.toc();
    std::cout<< "Polarisation assembly took "<<t.diff()<<"s\n";
    t.tic();
#endif 
    //Attention!! gamma1 wants Dirichlet BC
    unsigned number = pcg( gamma1, gamma_n, omega, v2d, eps_gamma);
#ifdef DG_BENCHMARK
    std::cout << "Number of pcg iterations0 "<< number <<std::endl;
    t.toc();
    std::cout<< "took "<<t.diff()<<"s\n";
    t.tic();
#endif 
    if( global)
    {
        blas1::axpby( -1., expy[0], 1., gamma_n, omega); //omega = a_i\Gamma n_i - n_e
        blas2::symv( w2d, omega, omega);
    }
    else
    {
        blas1::axpby( -1, y[0], 1., gamma_n, chi); 

        gamma1.alpha() = -tau;
        blas2::symv( gamma1, chi, omega); //apply \Gamma_0^-1 ( gamma_n - n_e)
        gamma1.alpha() = -0.5*tau;
    }
    number = pcg( A, phi[0], omega, v2d, eps_pol);
#ifdef DG_BENCHMARK
    std::cout << "Number of pcg iterations1 "<< number <<std::endl;
    t.toc();
    std::cout<< "took "<<t.diff()<<"s\n";
    t.tic();
#endif //DG_DEBUG
    //compute Gamma phi[0]
    blas2::symv( w2d, phi[0], omega);
    number = pcg( gamma1, phi[1], omega, v2d, eps_gamma);
#ifdef DG_BENCHMARK
    std::cout << "Number of pcg iterations2 "<< number <<std::endl;
    t.toc();
    std::cout<< "took "<<t.diff()<<"s\n";
#endif //DG_DEBUG
    //now add -0.5v_E^2

    blas2::gemv( arakawa.dx(), phi[0], chi);
    blas2::gemv( arakawa.dy(), phi[0], omega);
    blas1::pointwiseDot( binv, chi, chi);
    blas1::pointwiseDot( binv, omega, omega);
    cudaThreadSynchronize();
    blas1::pointwiseDot( chi, chi, chi);
    blas1::pointwiseDot( omega, omega, omega);
    blas1::axpby( 1., chi, 1.,  omega);
    blas1::axpby( 1., phi[1], -0.5,  omega, phi[1]);

    return phi;
}

template< class T, size_t n, class container>
void ToeflR<T, n, container>::operator()( const std::vector<container>& y, std::vector<container>& yp)
{
    assert( y.size() == 2);
    assert( y.size() == yp.size());

    phi = polarisation( y);

    for( unsigned i=0; i<y.size(); i++)
    {
        arakawa( y[i], phi[i], yp[i]);
        blas1::pointwiseDot( binv, yp[i], yp[i]);
    }

    //compute derivatives
    cudaThreadSynchronize();
    for( unsigned i=0; i<y.size(); i++)
    {
        blas2::gemv( arakawa.dx(), y[i], dxy[i]);
        blas2::gemv( arakawa.dy(), y[i], dyy[i]);
        blas2::gemv( arakawa.dy(), phi[i], dyphi[i]);
    }
    // curvature terms
    cudaThreadSynchronize();
    blas1::axpby( kappa, dyphi[0], 1., yp[0]);
    blas1::axpby( kappa, dyphi[1], 1., yp[1]);
    cudaThreadSynchronize();
    blas1::axpby( -1.*kappa, dyy[0], 1., yp[0]);
    blas1::axpby( tau*kappa, dyy[1], 1., yp[1]);

    //add laplacians
    for( unsigned i=0; i<y.size(); i++)
    {
        blas2::gemv( laplaceM, y[i], lapy[i]);
        if( global)
        {
            blas1::pointwiseDot( dxy[i], dxy[i], dxy[i]);
            blas1::pointwiseDot( dyy[i], dyy[i], dyy[i]);
            //now sum all 3 terms up 
            blas1::axpby( -1., dyy[i], 1., lapy[i]); //behold the minus
            blas1::axpby( -1., dxy[i], 1., lapy[i]); //behold the minus
        }
        blas1::axpby( -nu, lapy[i], 1., yp[i]); //rescale 
    }

}

template< class T, size_t n, class container>
void ToeflR<T, n, container>::exp( const std::vector<container>& y, std::vector<container>& target)
{
    for( unsigned i=0; i<y.size(); i++)
        thrust::transform( y[i].begin(), y[i].end(), target[i].begin(), dg::EXP<T>());
}
template< class T, size_t n, class container>
void ToeflR<T, n, container>::log( const std::vector<container>& y, std::vector<container>& target)
{
    for( unsigned i=0; i<y.size(); i++)
        thrust::transform( y[i].begin(), y[i].end(), target[i].begin(), dg::LN<T>());
}

}//namespace dg

#endif //_DG_TOEFLR_CUH