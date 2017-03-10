#pragma once

#include "dg/algorithm.h"
#include "dg/poisson.h"
#include "parameters.h"
#include <cusp/multiply.h>
#ifdef DG_BENCHMARK
#include "dg/backend/timer.cuh"
#endif //DG_BENCHMARK
/*!@file

  Contains the solvers 
  */

namespace eule
{
///@addtogroup solver
///@{
/**
 * @brief Diffusive terms for Feltor solver
 *
\f[
    \begin{align}
     -\nu_\perp\Delta_\perp^2 N \\
     -\nu_\perp\Delta_\perp^2 P   
    \end{align}
\f]
 * @tparam Matrix The Matrix class
 * @tparam container The Vector class 
 */

template<class Geometry, class Matrix, class container>
struct Rolkar
{
    Rolkar( const Geometry& g,eule::Parameters p):
        p(p),
        temp( dg::evaluate(dg::zero, g)),
        LaplacianM_perp ( g,g.bcx(),g.bcy(), dg::normed, dg::centered)
    {
    }
    void operator()( std::vector<container>& x, std::vector<container>& y)
    {
        /* x[0] := n_e - (bgamp+profamp)
           x[1] := N_i - (bgamp+profamp)
           x[2] := P_e - (bgamp+profamp)^2
           x[3] := P_i - (bgamp+profamp)^2

        */
        dg::blas1::axpby( 0., x, 0, y);
        for( unsigned i=0; i<4; i++)
        {
            //not linear any more (cannot be written as y = Ax)
            dg::blas2::gemv( LaplacianM_perp, x[i], y[i]);
            dg::blas1::scal( y[i], -p.nu_perp);  //  nu_perp lapl_RZ (lapl_RZ N) 
        }


    }
    dg::Elliptic<Geometry, Matrix, container>& laplacianM() {return LaplacianM_perp;}
    const container& weights(){return LaplacianM_perp.weights();}
    const container& precond(){return LaplacianM_perp.precond();}
  private:
    const eule::Parameters p;
    container temp;    
    dg::Elliptic<Geometry, Matrix, container> LaplacianM_perp;

};

template< class Geometry, class Matrix, class container>
struct Feltor
{
    //typedef std::vector<container> Vector;
    typedef typename dg::VectorTraits<container>::value_type value_type;
    //typedef typename thrust::iterator_system<typename container::iterator>::type MemorySpace;
    //typedef cusp::ell_matrix<int, value_type, MemorySpace> Matrix;
    //typedef dg::DMatrix Matrix; //fastest device Matrix (does this conflict with 

    Feltor( const Geometry& g, eule::Parameters p);

    /**
     * @brief Returns phi and psi that belong to the last y in operator()
     *
     * In a multistep scheme this belongs to the point HEAD-1
     * @return phi[0] is the electron and phi[1] the generalized ion potential
     */
    const std::vector<container>& potential( ) const { return phi;}
    const std::vector<container>& temptilde( ) const { return tetilde;}
    

    /**
     * @brief Given N_i-1 and Ti initialize n_e -1 such that phi=0
     *
     * @param y N_i -1 
     * @param helper T_i 
     * @param target N_e -1
     */
    void initializene( const container& y, const container& helper, container& target);
    /**
     * @brief Given P_i-1 and Ti initialize p_i -1 such that phi=0
     *
     * @param y P_i -1 
     * @param helper T_i 
     * @param target p_i
     */
    void initializepi( const container& y, const container& helper, container& target);

    void operator()( std::vector<container>& y, std::vector<container>& yp);

    double mass( ) {return mass_;}
    double mass_diffusion( ) {return diff_;}
    double energy( ) {return energy_;}
    std::vector<double> energy_vector( ) {return evec;}
    double energy_diffusion( ){ return ediff_;}

  private:
    //extrapolates and solves for phi[1], then adds square velocity ( omega)
    container& compute_psi(const container& helper, container& potential);
    container& compute_chii(const container& helper, container& potential);
    container& polarisation( const std::vector<container>& y); //solves polarisation equation

    container chi, omega, lambda, iota; //!!Attention: chi and omega are helper variables and may be changed at any time and by any method!!
    container chii,uE2; //dont use them as helper
    const container binv;
    const container one;
    container B2;
    const container w2d, v2d;
    std::vector<container> phi; // =(phi,psi_i), (0,chi_i)
    std::vector<container> n, logn,pr, logpr,te, logte,tetilde;  

    //matrices and solvers
    dg::Poisson< Geometry, Matrix, container> poisson; 

    dg::Elliptic<   Geometry, Matrix, container> pol,lapperpM; 
    dg::Helmholtz<  Geometry, Matrix, container> invgamma1;    
    dg::Helmholtz2< Geometry, Matrix, container> invgamma2;
    dg::Invert<container> invert_pol,invert_invgammadag,invert_invgamma,invert_invgamma2;
    const eule::Parameters p;

    double mass_, energy_, diff_, ediff_;
    std::vector<double> evec;
};     

template<class Grid, class Matrix, class container>
Feltor<Grid, Matrix, container>::Feltor( const Grid& g, eule::Parameters p): 
    chi( dg::evaluate( dg::zero, g)), omega(chi),  lambda(chi), iota(chi), 
    binv( dg::evaluate( dg::LinearX( p.mcv, 1.-p.mcv*p.posX*p.lx), g) ),
    one( dg::evaluate( dg::one, g)),    
    B2( dg::evaluate( dg::one, g)),    
    w2d( dg::create::weights(g)), v2d( dg::create::inv_weights(g)), 
    phi( 2, chi),chii(chi),uE2(chi),// (phi,psi), (chi_i), u_ExB
    n(2,chi), logn(n), pr(n), logpr(n), te(n), logte(n), tetilde(n),
    poisson(g, g.bcx(), g.bcy(), g.bcx(), g.bcy()), //first  N,P then phi BC
    pol(    g, g.bcx(), g.bcy(), dg::not_normed,          dg::centered), 
    lapperpM ( g,g.bcx(), g.bcy(),     dg::normed,         dg::centered),
    invgamma1( g,g.bcx(), g.bcy(), -0.5*p.tau[1]*p.mu[1],dg::centered),
    invgamma2( g,g.bcx(), g.bcy(), -0.5*p.tau[1]*p.mu[1],dg::centered) ,
    invert_pol(         omega, p.Nx*p.Ny*p.n*p.n, p.eps_pol),
    invert_invgammadag( omega, p.Nx*p.Ny*p.n*p.n, p.eps_gamma),
    invert_invgamma(    omega, p.Nx*p.Ny*p.n*p.n, p.eps_gamma),
    invert_invgamma2(   omega, p.Nx*p.Ny*p.n*p.n, p.eps_gamma),
    p(p),
    evec(3)
{
    dg::blas1::pointwiseDivide(one,binv,B2);
    dg::blas1::pointwiseDivide(B2,binv,B2);
}

template<class G, class Matrix, class container>
container& Feltor<G, Matrix, container>::polarisation( const std::vector<container>& y)
{
    dg::blas1::axpby( p.mu[1], y[1], 0, chi);      //chi =  \mu_i (n_i-(bgamp+profamp)) 
    dg::blas1::transform( chi, chi, dg::PLUS<>( p.mu[1]*(p.bgprofamp + p.nprofileamp))); //mu_i n_i
    dg::blas1::pointwiseDot( chi, binv, chi);
    dg::blas1::pointwiseDot( chi, binv, chi);       //(\mu_i n_i ) /B^2
    pol.set_chi( chi);                              //set chi of polarisation: nabla_perp (chi nabla_perp )

    if (p.flrmode == 1) {
        dg::blas1::pointwiseDivide(B2,te[1],lambda); //B^2/T_i
        invgamma1.set_chi(lambda);                //(B^2/T - 0.5*tau_i nabla_perp^2)
        
        dg::blas1::pointwiseDivide(tetilde[1],B2,chi); //chi=t_i_tilde/b^2    
        dg::blas2::gemv(lapperpM,chi,omega);
        dg::blas1::axpby(1.0,y[1],-(p.bgprofamp + p.nprofileamp)*0.5*p.tau[1],omega,omega);    
        dg::blas1::axpby(1.0,omega,(p.bgprofamp + p.nprofileamp)*(p.bgprofamp + p.nprofileamp)*p.mcv*p.mcv*p.tau[1],one,omega);        
        invert_invgammadag(invgamma1,chi,omega); //chi= Gamma (Ni-(bgamp+profamp))    
        dg::blas1::pointwiseDot(chi,lambda,chi);   //chi = B^2/T_i chi Gamma (Ni-(bgamp+profamp))   
    }
    if (p.flrmode == 0) {
        invgamma1.set_chi(one); ////(1 - 0.5*tau_i nabla_perp^2)
        dg::blas1::axpby(1.0,y[1],0.0,omega,omega);
        invert_invgammadag(invgamma1,chi,omega); //chi= Gamma (Ni-(bgamp+profamp))    
    }  

    dg::blas1::axpby( -1., y[0], 1.,chi,chi);  //chi= Gamma1^dagger (n_i-(bgamp+profamp)) -(n_e-(bgamp+profamp))

    unsigned number = invert_pol( pol, phi[0], chi);   //Gamma1^dagger( N_i) -ne = -nabla ( chi nabla phi)
    if(  number == invert_pol.get_max())
     throw dg::Fail( p.eps_pol);
    return phi[0];
}

template<class G, class Matrix, class container>
container& Feltor<G, Matrix,container>::compute_psi(const container& ti,container& potential)
{
    if (p.flrmode == 1)
    {   
        dg::blas1::pointwiseDivide(B2,ti,lambda); //B^2/T
        invgamma1.set_chi(lambda);//invgamma1bar = (B^2/T - 0.5*tau_i nabla_perp^2)
        dg::blas1::pointwiseDot(lambda,potential,lambda); //lambda= B^2/T phi
        invert_invgamma(invgamma1,chi,lambda);    //(B^2/T - 0.5*tau_i nabla_perp^2) chi  =  B^2/T phi
    }
    if (p.flrmode == 0)
    {
        invgamma1.set_chi(one);//invgamma1bar = (1 - 0.5*tau_i nabla_perp^2)
        invert_invgamma(invgamma1,chi,potential);    //(B^2/T - 0.5*tau_i nabla_perp^2) chi  =  B^2/T phi
    }
    poisson.variationRHS(potential, omega); // (nabla_perp phi)^2
    dg::blas1::pointwiseDot( binv, omega, omega);
    dg::blas1::pointwiseDot( binv, omega, uE2);// (nabla_perp phi)^2/B^2
    dg::blas1::axpby( 1., chi, -0.5, uE2,phi[1]);             //psi  Gamma phi - 0.5 u_E^2
    return phi[1];    
}

template< class G, class Matrix, class container>
container& Feltor<G, Matrix,container>::compute_chii(const container& ti,container& potential)
{    
    if (p.flrmode==1)
    {
    //  setup rhs
        dg::blas1::pointwiseDivide(B2,ti,lambda); //B^2/T
        invgamma2.set_chi(lambda); //(B^2/T - tau_i nabla_perp^2 +  0.25*tau_i^2 nabla_perp^2 T/B^2  nabla_perp^2)
    //  set up the lhs
        dg::blas2::gemv(lapperpM,potential,lambda); //lambda = - nabla_perp^2 phi
        dg::blas1::scal(lambda,-0.5*p.tau[1]*p.mu[1]); // lambda = 0.5*tau_i*nabla_perp^2 phi 
        invert_invgamma2(invgamma2,chii,lambda);
    }
    return chii;
}
template<class G, class Matrix, class container>
void Feltor<G, Matrix, container>::initializene( const container& src, const container& ti,container& target)
{   
    if (p.flrmode == 1)
    {
        dg::blas1::pointwiseDivide(B2,ti,lambda); //B^2/T    
        invgamma1.set_chi(lambda);
        
        dg::blas1::transform( ti, chi, dg::PLUS<>( -1.0*(p.bgprofamp + p.nprofileamp))); //t_i_tilde
        dg::blas1::pointwiseDivide(chi,B2,chi); //chi=t_i_tilde/b^2    
        dg::blas2::gemv(lapperpM,chi,omega); //- lap t_i_tilde/b^2    
        dg::blas1::axpby(1.0,src ,-(p.bgprofamp + p.nprofileamp)*0.5*p.tau[1],omega,omega);  //omega = Ni_tilde +a tau/2 lap t_i_tilde/b^2    
        dg::blas1::axpby(1.0,omega,(p.bgprofamp + p.nprofileamp)*(p.bgprofamp + p.nprofileamp)*p.mcv*p.mcv*p.tau[1],one,omega);   
        invert_invgammadag(invgamma1,target,omega); //=ne-1 = bar(Gamma)_dagger (ni-1)    
        dg::blas1::pointwiseDot(target,lambda,target);
    }
    if (p.flrmode == 0)
    {
        invgamma1.set_chi(one);
        invert_invgammadag(invgamma1,target,src); //=ne-1 = bar(Gamma)_dagger (ni-1)    
//         dg::blas1::axpby(2.,src,-1.,target,target); //=ne-1 = 2 (Ni - 1 ) - bar(Gamma)_dagger (ni-1)  
    }
}

template<class G, class Matrix, class container>
void Feltor<G, Matrix, container>::initializepi( const container& src, const container& ti,container& target)
{   
    //src =Pi-bg^2 = (N_i-bg)*(T_i-bg) + bg(N_i-bg) + bg(T_i-bg)
    //target =pi-bg^2 =  (n_i-bg)*(t_i-bg) + bg(n_i-bg) + bg(t_i-bg)
    if (p.init==0)        
    {
        if (p.flrmode == 1)
        {
            dg::blas1::pointwiseDivide(B2,ti,lambda); //B^2/Ti
            invgamma2.set_chi(lambda); //(B^2/Ti - tau_i nabla_perp^2 +  0.25*tau_i^2 nabla_perp^2 Ti/B^2  nabla_perp^2)  
            dg::blas1::transform( ti, chi, dg::PLUS<>( -1.0*(p.bgprofamp + p.nprofileamp))); //t_i_tilde
            
            
            //RHS + "correction terms":
            dg::blas1::pointwiseDivide(chi,B2,chi); //chi=t_i_tilde/b^2    
            dg::blas2::gemv(lapperpM,chi,omega); //-lap T_i_tilde/B^2
            // chi= Pi_tilde + 2*a^3 tau*mcv^2        
            dg::blas1::axpby(1.0, src,   (p.bgprofamp + p.nprofileamp)*(p.bgprofamp + p.nprofileamp)*(p.bgprofamp + p.nprofileamp)*p.tau[1]*2.*p.mcv*p.mcv,one, chi); 
            // chi += a^2 tau lap ( T_i_tilde/B^2)
            dg::blas1::axpby(1.0, chi, -(p.bgprofamp + p.nprofileamp)*(p.bgprofamp + p.nprofileamp)*p.tau[1],omega, chi); 
            dg::blas2::gemv(lapperpM,omega,target);//+ lap (lap T_i_tilde/B)
            // chi+= - a^2 tau^2*mcv^2 *0.5* lap^2 (T_i_tilde/B)
            dg::blas1::axpby(1.0, chi, -(p.bgprofamp + p.nprofileamp)*(p.bgprofamp + p.nprofileamp)*p.tau[1]*p.tau[1]*p.mcv*p.mcv*0.5,target, chi);            
            dg::blas1::pointwiseDivide(omega,lambda,omega); //-Ti/B^2 lap T_i_tilde/B^2
            dg::blas2::gemv(lapperpM,omega,target);//+ lap (Ti/B^2 lap T_i_tilde/B)
            // chi+= - a^2 tau^2/4 lap (Ti/B^2 lap T_i_tilde/B)
            dg::blas1::axpby(1.0, chi, -(p.bgprofamp + p.nprofileamp)*(p.bgprofamp + p.nprofileamp)*p.tau[1]*p.tau[1]*0.25,target, chi);    

            unsigned number = invert_invgamma2(invgamma2,target,chi); //=(p_i_tilde) = bar(Gamma)_dagger { P_i_tilde + a^2 tau_i lap T_i_tilde/B^2  - a^2 tau^2 /4 lap (Ti/B^2 lap T_i_tilde/B^2)   }
            if(  number == invert_invgamma2.get_max())
                throw dg::Fail( p.eps_gamma); 
            dg::blas1::pointwiseDot(target,lambda,target); //target = B^2/Ti target
        }
        if (p.flrmode == 0)
        {     
            invgamma1.set_chi(one);
            unsigned number = invert_invgammadag(invgamma1,target,src); //=(p_i_tilde) = bar(Gamma)_dagger { P_i_tilde + a^2 tau_i lap T_i_tilde/B^2  - a^2 tau^2 /4 lap (Ti/B^2 lap T_i_tilde/B^2)}
            if(  number == invert_invgammadag.get_max())
                throw dg::Fail( p.eps_gamma); 
        }
    }    

    
    if (p.init==1)
    {
        if (p.flrmode==1)
        {
            //solve polarisation for phi with Ti=Ni=ne
            dg::blas1::pointwiseDot( ti, binv, chi);        //chi = (T_i ) /B
            dg::blas1::pointwiseDot( chi, binv, chi);       //chi = (T_i ) /B^2
            pol.set_chi( chi);                              //set chi of polarisation: nabla_perp (chi nabla_perp )

            dg::blas1::pointwiseDivide(B2,ti,lambda); //B^2/Ti
            invgamma1.set_chi(lambda);                //(B^2/Ti - 0.5*tau_i nabla_perp^2)
            dg::blas1::transform( ti, chi, dg::PLUS<>( -1.0*(p.bgprofamp + p.nprofileamp))); //chi = T_i_tilde
            dg::blas1::pointwiseDivide(chi,B2,chi); //chi=T_i_tilde/B^2    
            dg::blas2::gemv(lapperpM,chi,omega);    //omega = -lap T_i_tilde/B^2    
            dg::blas1::transform( ti, chi, dg::PLUS<>( -1.0*(p.bgprofamp + p.nprofileamp))); //chi = T_i_tilde
            dg::blas1::axpby(1.0,chi,-(p.bgprofamp + p.nprofileamp)*0.5*p.tau[1],omega,omega); //omega = T_i_tilde + a^2 tau*0.5* lap T_i_tilde/B^2   
            dg::blas1::axpby(1.0,omega,(p.bgprofamp + p.nprofileamp)*(p.bgprofamp + p.nprofileamp)*p.mcv*p.mcv*p.tau[1],one,omega);  //omega = T_i_tilde + a^2 tau*0.5* lap T_i_tilde/B^2 + a^2 mcv^2 tau      
            invert_invgammadag(invgamma1,chi,omega); // chi = Gamma^-1 omega
            dg::blas1::pointwiseDot(chi,lambda,chi);   //chi = B^2/T_i chi Gamma^-1 omega 

            dg::blas1::transform( ti, lambda, dg::PLUS<>( -1.0*(p.bgprofamp + p.nprofileamp))); //T_i_tilde
            dg::blas1::axpby( -1., lambda, 1.,chi,chi);  //chi= Gamma1^dagger (Ti-(bgamp+profamp)) -(Ti-(bgamp+profamp))

            
            unsigned number = invert_pol( pol, omega, chi);   //(Gamma1^dagger -1) T_i = -nabla ( chi nabla phi)
            if(  number == invert_pol.get_max())
                throw dg::Fail( p.eps_pol); 
            
            //set up polarisation term of pressure equation
            dg::blas1::pointwiseDot( ti, ti, chi); //Pi=ti^2
            dg::blas1::pointwiseDot( chi, binv, chi);
            dg::blas1::pointwiseDot( chi, binv, chi);       //t_i^2 /B^2
            lapperpM.set_chi(chi);
            dg::blas2::symv(lapperpM,omega,iota); //- nabla( P/B^2 nabla phi) with omega=phi
            lapperpM.set_chi(one);
            
            
            
            //solve gamma terms of pressure equation
            dg::blas1::pointwiseDivide(B2,ti,lambda); //B^2/Ti
            invgamma2.set_chi(lambda); //(B^2/Ti_0 - tau_i nabla_perp^2 +  0.25*tau_i^2 nabla_perp^2 Ti_0/B^2  nabla_perp^2)  
            dg::blas1::transform( ti, chi, dg::PLUS<>( -1.0*(p.bgprofamp + p.nprofileamp))); //t_i_tilde            
            
            //RHS + "correction terms":
            dg::blas1::pointwiseDivide(chi,B2,chi); //chi=t_i_tilde/b^2    
            dg::blas2::gemv(lapperpM,chi,omega); //-lap T_i_tilde/B^2
            // chi= Pi_tilde + 2*a^3 tau*mcv^2        
            dg::blas1::axpby(1.0, src,   (p.bgprofamp + p.nprofileamp)*(p.bgprofamp + p.nprofileamp)*(p.bgprofamp + p.nprofileamp)*p.tau[1]*2.*p.mcv*p.mcv,one, chi); 
            // chi += a^2 tau lap ( T_i_tilde/B^2)
            dg::blas1::axpby(1.0, chi, -(p.bgprofamp + p.nprofileamp)*(p.bgprofamp + p.nprofileamp)*p.tau[1],omega, chi); 
            dg::blas2::gemv(lapperpM,omega,target);//+ lap (lap T_i_tilde/B)
            // chi+= - a^2 tau^2*mcv^2 *0.5* lap^2 (T_i_tilde/B)
            dg::blas1::axpby(1.0, chi, -(p.bgprofamp + p.nprofileamp)*(p.bgprofamp + p.nprofileamp)*p.tau[1]*p.tau[1]*p.mcv*p.mcv*0.5,target, chi);            
            dg::blas1::pointwiseDivide(omega,lambda,omega); //-Ti/B^2 lap T_i_tilde/B^2
            dg::blas2::gemv(lapperpM,omega,target);//+ lap (Ti/B^2 lap T_i_tilde/B)
            // chi+= - a^2 tau^2/4 lap (Ti/B^2 lap T_i_tilde/B)
            dg::blas1::axpby(1.0, chi, -(p.bgprofamp + p.nprofileamp)*(p.bgprofamp + p.nprofileamp)*p.tau[1]*p.tau[1]*0.25,target, chi);     

            number = invert_invgamma2(invgamma2,target,chi); //=(p_i_tilde) = bar(Gamma)_dagger { P_i_tilde + a^2 tau_i lap T_i_tilde/B^2  - a^2 tau^2 /4 lap (Ti/B^2 lap T_i_tilde/B^2)   }
            if(  number == invert_invgamma2.get_max())
                throw dg::Fail( p.eps_gamma); 
            dg::blas1::pointwiseDot(target,lambda,target); //target = B^2/Ti target
            
            dg::blas1::axpby(-2.0,iota,1.0,target,target); //target+=  +2 nabla( P/B^2 nabla phi)
        }
        if (p.flrmode==0)
        {
            //solve polarisation for phi with Ti=Ni=ne
            dg::blas1::pointwiseDot( ti, binv, chi);        //chi = (T_i ) /B = n_e/B^2
            dg::blas1::pointwiseDot( chi, binv, chi);       //chi = (T_i ) /B^2 = n_e/B^2
            pol.set_chi( chi);                              //set chi of polarisation: nabla_perp (chi nabla_perp )

            invgamma1.set_chi(one);                //(1 - 0.5*tau_i nabla_perp^2)
            dg::blas1::transform( ti, omega, dg::PLUS<>( -1.0*(p.bgprofamp + p.nprofileamp))); //chi = T_i_tilde = ne_tilde
            invert_invgammadag(invgamma1,chi,omega); // chi = Gamma^-1 omega

            dg::blas1::axpby( -1., omega, 1.,chi,chi);  //chi= Gamma1^dagger (Ti-(bgamp+profamp)) -(Ti-(bgamp+profamp))

            unsigned number = invert_pol( pol, omega, chi);   //(Gamma1^dagger -1) T_i = -nabla ( chi nabla phi)
            if(  number == invert_pol.get_max())
                throw dg::Fail( p.eps_pol); 
            
            dg::blas1::pointwiseDot( ti, ti, chi); //Pi=ti^2
            dg::blas1::pointwiseDot( chi, binv, chi);
            dg::blas1::pointwiseDot( chi, binv, chi);       //t_i^2 /B^2
            lapperpM.set_chi(chi);
            dg::blas2::symv(lapperpM,omega,iota); //- nabla( P/B^2 nabla phi)
            lapperpM.set_chi(one);
            //omega=phi
            
            //solve gamma_1 Pi
            invgamma1.set_chi(one);
            number = invert_invgammadag(invgamma1,target,src); //=(p_i_tilde) = bar(Gamma)_dagger { P_i_tilde + a^2 tau_i lap T_i_tilde/B^2  - a^2 tau^2 /4 lap (Ti/B^2 lap T_i_tilde/B^2)}
            if(  number == invert_invgammadag.get_max())
                throw dg::Fail( p.eps_gamma); 
            
            dg::blas1::axpby(-2.0,iota,1.0,target,target); //target+=  +2 nabla( P/B^2 nabla phi)
        }
    }
    
}

template<class G, class Matrix, class container>
void Feltor<G, Matrix, container>::operator()( std::vector<container>& y, std::vector<container>& yp)
{
   /* y[0] := N_e - (p.bgprofamp + p.nprofileamp)
       y[1] := N_i - (p.bgprofamp + p.nprofileamp)
       y[2] := P_e - (p.bgprofamp + p.nprofileamp)^2
       y[3] := P_i - (p.bgprofamp + p.nprofileamp)^2
    */
    dg::Timer t;
    t.tic();
    assert( y.size() == 4);
    assert( y.size() == yp.size());
    
    if (p.iso == 1)    {
        dg::blas1::axpby((p.bgprofamp + p.nprofileamp),y[0],0., y[2],y[2] );
        dg::blas1::axpby((p.bgprofamp + p.nprofileamp),y[1],0., y[3],y[3] ); 
    }
    
    for(unsigned i=0; i<2; i++)
    {
        dg::blas1::transform( y[i], n[i], dg::PLUS<>(+(p.bgprofamp + p.nprofileamp))); //N = N_tilde +(p.bgprofamp + p.nprofileamp)
        dg::blas1::transform(n[i], logn[i], dg::LN<value_type>()); //log(ype)
        dg::blas1::transform(y[i+2], pr[i], dg::PLUS<>(+(p.bgprofamp + p.nprofileamp)*(p.bgprofamp + p.nprofileamp))); //P = P_tilde +(p.bgprofamp + p.nprofileamp)^2
        dg::blas1::transform(pr[i], logpr[i], dg::LN<value_type>()); //log(ype)
        dg::blas1::pointwiseDivide(pr[i], n[i], te[i]);
        dg::blas1::transform(te[i], logte[i], dg::LN<value_type>()); //log(ype)
        dg::blas1::transform(te[i],tetilde[i], dg::PLUS<>(-(p.bgprofamp + p.nprofileamp)));
    }
    //compute phi via polarisation
    phi[0] = polarisation( y);  
    //compute psi
    phi[1] = compute_psi(te[1], phi[0]); 
    //compute chii
    if (p.iso == 0)    {
        chii   = compute_chii(te[1], phi[0]);  
    }
    if (p.iso == 1 || p.flrmode==0)    {
        dg::blas1::scal(chii, 0.0);
    }

    
    //Compute energies
    double z[2]    = {-1.0,1.0};
    double S[2]    = {0.0, 0.0};
    double Dperp[4] = {0.0, 0.0,0.0, 0.0};
    //transform compute n and logn and energies
    for(unsigned i=0; i<2; i++)
    {
        if (p.iso == 1) S[i] = z[i]*p.tau[i]*dg::blas2::dot( logn[i], w2d, n[i]);
        if (p.iso == 0) S[i] = z[i]*p.tau[i]*dg::blas2::dot( one, w2d, pr[i]); // N T
    }
    mass_ = dg::blas2::dot( one, w2d, n[0] ); //take real ion density which is electron density!!
    double Tperp = 0.5*p.mu[1]*dg::blas2::dot( n[1], w2d, uE2);   //= 0.5 mu_i N_i u_E^2

    energy_ = S[0] + S[1]  + Tperp; 
    evec[0] = S[0], evec[1] = S[1], evec[2] = Tperp;
    for(unsigned i=0; i<2; i++)
    {
        if (p.iso == 1) {
            dg::blas1::axpby(1.,one,1., logn[i] ,chi); //chi = (1+lnN_e)
            dg::blas1::axpby(1.,phi[i],p.tau[i], chi); //chi = (tau_e(1+lnN_e)+phi)
        }
        if (p.iso == 0) dg::blas1::axpby(1., phi[i],0., chi,chi); //chi = (psi)
        dg::blas2::gemv( lapperpM, y[i], omega);//-nabla_RZ^2 N
        Dperp[i] = -z[i]* p.nu_perp*dg::blas2::dot(chi, w2d, omega);  // ( psi) nabla_RZ^2 N    
        
        dg::blas2::gemv( lapperpM, y[i+2], omega);//-nabla_RZ^2 P
        Dperp[i+2] = -z[i]*p.tau[i]*p.nu_perp*dg::blas2::dot(one, w2d, omega);  // nabla_RZ^2 P
    }    
    dg::blas2::gemv( lapperpM, y[1], omega);
    Dperp[1] -= -z[1]*p.nu_perp*dg::blas2::dot(chii, w2d, omega);  //+ nu*Z( chii) nabla_RZ^2 N_i 
    
    dg::blas1::pointwiseDivide(chii,te[1],chi); //chi = chii/Ti
    dg::blas2::gemv( lapperpM, y[3], omega);
    Dperp[3] += -p.nu_perp*dg::blas2::dot(chi, w2d, omega);  //- nu*( chii/ T) nabla_RZ^2 P_i 
    ediff_= Dperp[0]+Dperp[1]+ Dperp[2]+Dperp[3];   
    
    for(unsigned i=0; i<2; i++)
    {
        //ExB dynamics
        poisson( y[i], phi[i], yp[i]);  //[N-a,psi]_xy
        poisson( y[i+2], phi[i], yp[i+2]);  //[P-a^2,psi]_xy
        dg::blas1::pointwiseDot( yp[i], binv, yp[i]);  //dt N = 1/B [N-a,psi]_xy
        dg::blas1::pointwiseDot( yp[i+2], binv, yp[i+2]);  //dt (P-a^2) = 1/B [P-a^2,psi]_xy
        
        //curvature dynamics
        //N*K(psi) and 2 P*K(psi)  terms
        dg::blas2::gemv( poisson.dyrhs(), phi[i], lambda); //lambda = dy psi
        dg::blas1::pointwiseDot(lambda,n[i],omega); //omega =  n dy psi
        dg::blas1::axpby(p.mcv,omega,1.0,yp[i]);   // dtN +=  mcv* N dy psi
        dg::blas1::pointwiseDot(lambda,pr[i],omega); // P dy psi
        dg::blas1::axpby(2.*p.mcv,omega,1.0,yp[i+2]);   // dtP += 2* mcv* P dy psi        
        // K(T N) terms
/*        dg::blas2::gemv( poisson.dyrhs(), y[i], lambda); //lambda = dy (N-a)
        dg::blas1::pointwiseDot(lambda,te[i],omega); //omega =  T dy (N-a)
        dg::blas1::axpby(p.tau[i]*p.mcv,omega,1.0,yp[i]); //dt N += tau*mcv*T dy (N-a)
        dg::blas2::gemv( poisson.dyrhs(), tetilde[i], lambda); //lambda = dy (T-a)
        dg::blas1::pointwiseDot(lambda,n[i],omega); // omega = N dy (T-a)
        dg::blas1::axpby(p.tau[i]*p.mcv,omega,1.0,yp[i]);  //dt N += tau*mcv*N dy (T-a)     */   
        // K(T N) terms
        dg::blas2::gemv( poisson.dyrhs(), y[i+2], omega); //lambda = dy (P-a^2)
        dg::blas1::axpby(p.tau[i]*p.mcv,omega,1.0,yp[i]); //dt N += tau*mcv*dy (P-a^2)
 
        // K(T P) terms
        dg::blas2::gemv( poisson.dyrhs(), y[i+2], lambda); //lambda = dy (P-a^2)
        dg::blas1::pointwiseDot(lambda,te[i],omega); //omega =  T dy (P-a^2)
        dg::blas1::axpby(2.*p.tau[i]*p.mcv,omega,1.0,yp[i+2]); //dt P += 2 tau*mcv*T dy (P-a^2)
        dg::blas2::gemv( poisson.dyrhs(),tetilde[i], lambda); //lambda = dy (T-a)
        dg::blas1::pointwiseDot(lambda,pr[i],omega); // omega = P dy (T-a)
        dg::blas1::axpby(2.*p.tau[i]*p.mcv,omega,1.0,yp[i+2]);  //dt P += 2 tau*mcv*P dy (T-a)    
    }
    //add 2nd order FLR terms to ExB dynamics 
    //[ chi,Pi] terms 
    poisson( y[3], chii, omega);  //omega = [P_i-a^2,chi_i]_xy
    dg::blas1::pointwiseDot(omega, binv, omega); //omega = 1/B [P_i-a^2,chii]_xy
    dg::blas1::axpby(1.,omega,1.0,yp[3]); //dt (P_i-a^2) += 1/B [P_i-a^2,  chii]_xy
    
    //Moment mixing terms
    //[lnTi,Ni chii] term 
//     poisson( logte[1], chii, omega);  //omega = [ln(Ti),chii]_xy
//     dg::blas1::pointwiseDot(omega, binv, omega); //omega = 1/B [ln(Ti),chii]_xy
//     dg::blas1::pointwiseDot(omega, n[1], omega); //omega = Ni/B [ln(Ti),chii]_xy
//     dg::blas1::axpby(1.,omega,1.0,yp[1]); //dt N_i += Ni/B [ln(Ti),chii]_xy
//     poisson( logte[1],  y[1], omega);  //omega = [ln(Ti),Ni]_xy
//     dg::blas1::pointwiseDot(omega, binv, omega); //omega = 1/B [ln(Ti),Ni]_xy
//     dg::blas1::pointwiseDot(omega, chii, omega); //omega = chii/B [ln(Ti),Ni]_xy
//     dg::blas1::axpby(1.,omega,1.0,yp[1]); //dt N_i += chii/B [ln(Ti),Ni]_xy
    dg::blas1::pointwiseDot(n[1],chii,chi);
    poisson( logte[1], chi, omega);  //omega = [ln(Ti),Ni chii]_xy
    dg::blas1::pointwiseDot(omega, binv, omega); //omega = 1/B [ln(Ti),Ni chii]_xy
    dg::blas1::axpby(1.,omega,1.0,yp[1]); //dt N_i += 1/B [ln(Ti),Ni chii]_xy
    //[lnTi,Pi chii] term 
//     poisson( logte[1], chii, omega);  //omega = [ln(Ti),chii]_xy
//     dg::blas1::pointwiseDot(omega, binv, omega); //omega = 1/B [ln(Ti),chii]_xy
//     dg::blas1::pointwiseDot(omega, pr[1], omega); //omega = Pi/B [ln(Ti),chii]_xy
//     dg::blas1::axpby(2.,omega,1.0,yp[3]); //dt (P_i) += Pi/B [ln(Ti),chii]_xy
//     poisson( logte[1],  y[3], omega);  //omega = [ln(Ti),Pi]_xy
//     dg::blas1::pointwiseDot(omega, binv, omega); //omega = 1/B [ln(Ti),Pi]_xy
//     dg::blas1::pointwiseDot(omega, chii, omega); //omega = chii/B [ln(Ti),Pi]_xy
//     dg::blas1::axpby(2.,omega,1.0,yp[3]); //dt(P_i) += chii/B [ln(Ti),Pi]_xy
//     dg::blas1::pointwiseDot(pr[1],chii,chi);
    dg::blas1::pointwiseDot(n[1],chii,chi);
    poisson( te[1], chi, omega);  //omega = [ln(Ti),Pi chii]_xy = [Ti, Ni chii]_xy
    dg::blas1::pointwiseDot(omega, binv, omega); //omega = 1/B [ln(Ti),Pi chii]_xy
    dg::blas1::axpby(2.,omega,1.0,yp[3]); //dt (P_i) += 1/B [ln(Ti),chii Pi]_xy

    //add FLR correction to curvature dynamics
    //Ni K(chii) and Pi K(4 chii) term
    dg::blas2::gemv( poisson.dyrhs(), chii, lambda); //lambda = dy chii
    dg::blas1::pointwiseDot(lambda,n[1],omega); //omega = Ni dy chii
    dg::blas1::axpby(p.mcv,omega,1.0,yp[1]);   // dtNi +=  mcv* Ni dy chii
    dg::blas1::pointwiseDot(lambda,pr[1],omega); // omega = Pi dy chii
    dg::blas1::axpby(4.*p.mcv,omega,1.0,yp[3]);   // dtPi += 4.* mcv* Pi dy chii    
    //Ni chii K(lnTi - lnNi) term
    dg::blas1::axpby(1.,logn[1],-1.0,logte[1],omega); //omega = -ln(Ti)+ln(Ni)
    dg::blas2::gemv( poisson.dyrhs(), omega, lambda); //lambda = dy(-ln(Ti)+ln(Ni))
    dg::blas1::pointwiseDot(lambda,n[1],omega); // omega = Ni dy(-ln(Ti)+ln(Ni))
    dg::blas1::pointwiseDot(omega,chii,omega); //omega =  Ni  chii dy(-ln(Ti)+ln(Ni))
    dg::blas1::axpby(p.mcv,omega,1.0,yp[1]);   // dtNi +=  mcv* Ni  chii dy(-ln(Ti)+ln(Ni)) 
    //Pi chii K(2 lnTi - lnPi) term
    dg::blas1::axpby(1.,logpr[1],-2.0,logte[1],omega); //omega = -2 ln(Ti)+ln(Pi)
    dg::blas2::gemv( poisson.dyrhs(), omega, lambda); //lambda = dy(-2 ln(Ti)+ln(Pi))
    dg::blas1::pointwiseDot(lambda,pr[1],omega); // omega = Pi dy(-2 ln(Ti)+ln(Pi))
    dg::blas1::pointwiseDot(omega,chii,omega); //omega =  Pi  chii dy(-2 ln(Ti)+ln(Pi))
    dg::blas1::axpby(2.*p.mcv,omega,1.0,yp[3]);   // dtPi += 2.* mcv* Pi  chii dy(-2 ln(Ti)+ln(Pi))  
    t.toc();
#ifdef MPI_VERSION
    int rank;
    MPI_Comm_rank( MPI_COMM_WORLD, &rank);
    if(rank==0)
#endif 
    std::cout << "One rhs took "<<t.diff()<<"s\n";

}

///@}

} //namespace eule

