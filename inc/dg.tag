<?xml version='1.0' encoding='UTF-8' standalone='yes' ?>
<tagfile>
  <compound kind="file">
    <name>algorithm.h</name>
    <path>/home/matthias/Projekte/feltor/inc/dg/</path>
    <filename>algorithm_8h</filename>
    <includes id="blas_8h" name="blas.h" local="yes" imported="no">blas.h</includes>
    <includes id="arakawa_8h" name="arakawa.h" local="yes" imported="no">arakawa.h</includes>
    <includes id="helmholtz_8h" name="helmholtz.h" local="yes" imported="no">helmholtz.h</includes>
    <includes id="cg_8h" name="cg.h" local="yes" imported="no">cg.h</includes>
    <includes id="exceptions_8h" name="exceptions.h" local="yes" imported="no">exceptions.h</includes>
    <includes id="functors_8h" name="functors.h" local="yes" imported="no">functors.h</includes>
    <includes id="multistep_8h" name="multistep.h" local="yes" imported="no">multistep.h</includes>
    <includes id="elliptic_8h" name="elliptic.h" local="yes" imported="no">elliptic.h</includes>
    <includes id="runge__kutta_8h" name="runge_kutta.h" local="yes" imported="no">runge_kutta.h</includes>
    <includes id="dz_8h" name="dz.h" local="yes" imported="no">dz.h</includes>
  </compound>
  <compound kind="file">
    <name>arakawa.h</name>
    <path>/home/matthias/Projekte/feltor/inc/dg/</path>
    <filename>arakawa_8h</filename>
    <includes id="blas_8h" name="blas.h" local="yes" imported="no">blas.h</includes>
    <includes id="enums_8h" name="enums.h" local="yes" imported="no">enums.h</includes>
    <class kind="struct">dg::ArakawaX</class>
    <namespace>dg</namespace>
  </compound>
  <compound kind="file">
    <name>blas.h</name>
    <path>/home/matthias/Projekte/feltor/inc/dg/</path>
    <filename>blas_8h</filename>
    <includes id="blas1_8h" name="blas1.h" local="yes" imported="no">blas1.h</includes>
    <includes id="blas2_8h" name="blas2.h" local="yes" imported="no">blas2.h</includes>
  </compound>
  <compound kind="file">
    <name>blas1.h</name>
    <path>/home/matthias/Projekte/feltor/inc/dg/</path>
    <filename>blas1_8h</filename>
    <namespace>dg</namespace>
    <namespace>dg::blas1</namespace>
    <member kind="function">
      <type>VectorTraits&lt; Vector &gt;::value_type</type>
      <name>dot</name>
      <anchorfile>group__blas1.html</anchorfile>
      <anchor>gade540580ce83e615dcb8e2210689bb32</anchor>
      <arglist>(const Vector &amp;x, const Vector &amp;y)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>axpby</name>
      <anchorfile>group__blas1.html</anchorfile>
      <anchor>ga6ee5b940147ba6b71e1fe1fc538e9459</anchor>
      <arglist>(typename VectorTraits&lt; Vector &gt;::value_type alpha, const Vector &amp;x, typename VectorTraits&lt; Vector &gt;::value_type beta, Vector &amp;y)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>axpby</name>
      <anchorfile>group__blas1.html</anchorfile>
      <anchor>ga24d1c58804538649f88ebafd65c2845b</anchor>
      <arglist>(typename VectorTraits&lt; Vector &gt;::value_type alpha, const Vector &amp;x, typename VectorTraits&lt; Vector &gt;::value_type beta, const Vector &amp;y, Vector &amp;result)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>transform</name>
      <anchorfile>group__blas1.html</anchorfile>
      <anchor>gace34b2c8e27a5173cb25db0542089c2c</anchor>
      <arglist>(const Vector &amp;x, Vector &amp;y, UnaryOp op)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>scal</name>
      <anchorfile>group__blas1.html</anchorfile>
      <anchor>ga9287f21c8d97b7d4d77b0353cf5b56b2</anchor>
      <arglist>(Vector &amp;x, typename VectorTraits&lt; Vector &gt;::value_type alpha)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>pointwiseDot</name>
      <anchorfile>group__blas1.html</anchorfile>
      <anchor>ga2939c008737a653c8ea3aa972cac136b</anchor>
      <arglist>(const Vector &amp;x1, const Vector &amp;x2, Vector &amp;y)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>pointwiseDivide</name>
      <anchorfile>group__blas1.html</anchorfile>
      <anchor>ga451523cc2d3740676888ce0b14cb8509</anchor>
      <arglist>(const Vector &amp;x1, const Vector &amp;x2, Vector &amp;y)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>blas2.h</name>
    <path>/home/matthias/Projekte/feltor/inc/dg/</path>
    <filename>blas2_8h</filename>
    <namespace>dg</namespace>
    <namespace>dg::blas2</namespace>
    <member kind="function">
      <type>MatrixTraits&lt; Matrix &gt;::value_type</type>
      <name>dot</name>
      <anchorfile>group__blas2.html</anchorfile>
      <anchor>gaeb8a93cac85646f2173160afd2a79d53</anchor>
      <arglist>(const Vector &amp;x, const Matrix &amp;m, const Vector &amp;y)</arglist>
    </member>
    <member kind="function">
      <type>MatrixTraits&lt; Matrix &gt;::value_type</type>
      <name>dot</name>
      <anchorfile>group__blas2.html</anchorfile>
      <anchor>gac72ec781ca79b3b983099ea172f896ab</anchor>
      <arglist>(const Matrix &amp;m, const Vector &amp;x)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>symv</name>
      <anchorfile>group__blas2.html</anchorfile>
      <anchor>ga7f66ae102c9c093cdc0877a989fd82b3</anchor>
      <arglist>(typename MatrixTraits&lt; Precon &gt;::value_type alpha, const Precon &amp;P, const Vector &amp;x, typename MatrixTraits&lt; Precon &gt;::value_type beta, Vector &amp;y)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>symv</name>
      <anchorfile>group__blas2.html</anchorfile>
      <anchor>ga268c50e488c18db3dc5be1d1934eb7b2</anchor>
      <arglist>(Matrix &amp;m, Vector1 &amp;x, Vector2 &amp;y)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>gemv</name>
      <anchorfile>group__blas2.html</anchorfile>
      <anchor>gadda8a3d0278c095d51becf208760d49b</anchor>
      <arglist>(Matrix &amp;m, Vector1 &amp;x, Vector2 &amp;y)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>cg.h</name>
    <path>/home/matthias/Projekte/feltor/inc/dg/</path>
    <filename>cg_8h</filename>
    <includes id="blas_8h" name="blas.h" local="yes" imported="no">blas.h</includes>
    <class kind="class">dg::CG</class>
    <class kind="struct">dg::Invert</class>
    <namespace>dg</namespace>
    <member kind="function">
      <type>unsigned</type>
      <name>cg</name>
      <anchorfile>group__algorithms.html</anchorfile>
      <anchor>ga61caca7351ed278357a3923adb6ab655</anchor>
      <arglist>(Matrix &amp;A, Vector &amp;x, const Vector &amp;b, const Preconditioner &amp;P, typename VectorTraits&lt; Vector &gt;::value_type eps, unsigned max_iter)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>dz.h</name>
    <path>/home/matthias/Projekte/feltor/inc/dg/</path>
    <filename>dz_8h</filename>
  </compound>
  <compound kind="file">
    <name>elliptic.h</name>
    <path>/home/matthias/Projekte/feltor/inc/dg/</path>
    <filename>elliptic_8h</filename>
    <includes id="blas_8h" name="blas.h" local="yes" imported="no">blas.h</includes>
    <includes id="enums_8h" name="enums.h" local="yes" imported="no">enums.h</includes>
    <class kind="class">dg::Elliptic</class>
    <class kind="struct">dg::GeneralElliptic</class>
    <namespace>dg</namespace>
  </compound>
  <compound kind="file">
    <name>enums.h</name>
    <path>/home/matthias/Projekte/feltor/inc/dg/</path>
    <filename>enums_8h</filename>
    <namespace>dg</namespace>
    <member kind="enumeration">
      <type></type>
      <name>bc</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>ga59440bdf436f2874b49aa52b670ed364</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>PER</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>gga59440bdf436f2874b49aa52b670ed364a948704f60491461974ce4fe6339778b3</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>DIR</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>gga59440bdf436f2874b49aa52b670ed364adece0b7644d85f490823799a3b97f7e6</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>DIR_NEU</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>gga59440bdf436f2874b49aa52b670ed364ae1ff2b85fda37868973c8059e3ca3a79</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>NEU_DIR</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>gga59440bdf436f2874b49aa52b670ed364a5832830f6fb508b8932dbafad3d1b57c</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>NEU</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>gga59440bdf436f2874b49aa52b670ed364ad8a2f69a62e7fdafe1665ae7162e8e10</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>norm</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>ga9945b71a335bc97f78dc7425911c7287</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>normed</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>gga9945b71a335bc97f78dc7425911c7287a3f222a3e51d054ebe21228c62569e123</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>not_normed</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>gga9945b71a335bc97f78dc7425911c7287a07217e3dd9be28b4da85d46fef38f066</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>direction</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>gabf9ea3df33484cbb5886e257c3899e48</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>forward</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>ggabf9ea3df33484cbb5886e257c3899e48a573a4a72e7f55df92b88c254a13762f2</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>backward</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>ggabf9ea3df33484cbb5886e257c3899e48a3e10d2598f5b58a930631b12774e05cb</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>centered</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>ggabf9ea3df33484cbb5886e257c3899e48a6281b4fc609cb723a615662b5adac9df</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>system</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>ga75789d2c36dff2caed4b3bb80191b346</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>cartesian</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>gga75789d2c36dff2caed4b3bb80191b346a49a654c38e355ec847e55f927511019d</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>cylindrical</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>gga75789d2c36dff2caed4b3bb80191b346a6962eb4bbef38ebabc41458844991bfd</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>exceptions.h</name>
    <path>/home/matthias/Projekte/feltor/inc/dg/</path>
    <filename>exceptions_8h</filename>
    <class kind="struct">dg::Fail</class>
    <namespace>dg</namespace>
  </compound>
  <compound kind="file">
    <name>functors.h</name>
    <path>/home/matthias/Projekte/feltor/inc/dg/</path>
    <filename>functors_8h</filename>
    <includes id="blas1_8h" name="blas1.h" local="yes" imported="no">blas1.h</includes>
    <class kind="struct">dg::AbsMax</class>
    <class kind="struct">dg::AbsMin</class>
    <class kind="struct">dg::Gaussian</class>
    <class kind="struct">dg::Gaussian3d</class>
    <class kind="struct">dg::GaussianX</class>
    <class kind="struct">dg::GaussianY</class>
    <class kind="struct">dg::GaussianZ</class>
    <class kind="struct">dg::SinProfX</class>
    <class kind="struct">dg::ExpProfX</class>
    <class kind="struct">dg::LinearX</class>
    <class kind="struct">dg::LinearY</class>
    <class kind="struct">dg::LHalf</class>
    <class kind="struct">dg::RHalf</class>
    <class kind="struct">dg::Lamb</class>
    <class kind="struct">dg::Vortex</class>
    <class kind="struct">dg::BathRZ</class>
    <class kind="struct">dg::EXP</class>
    <class kind="struct">dg::LN</class>
    <class kind="struct">dg::SQRT</class>
    <class kind="struct">dg::MinMod</class>
    <class kind="struct">dg::PLUS</class>
    <class kind="struct">dg::MOD</class>
    <class kind="struct">dg::ABS</class>
    <class kind="struct">dg::CONSTANT</class>
    <class kind="struct">dg::Histogram</class>
    <class kind="struct">dg::Histogram2D</class>
    <namespace>dg</namespace>
    <member kind="function">
      <type>double</type>
      <name>bessj1</name>
      <anchorfile>group__functions.html</anchorfile>
      <anchor>ga31e93254b91f287daf4ca4756fb32385</anchor>
      <arglist>(double x)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>bessi1</name>
      <anchorfile>group__functions.html</anchorfile>
      <anchor>ga8f29ee46cf5603af9cabd93163cf98cc</anchor>
      <arglist>(double x)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>bessk1</name>
      <anchorfile>group__functions.html</anchorfile>
      <anchor>ga43e254f13fa144c646b2e509bcd5d1d1</anchor>
      <arglist>(double x)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>helmholtz.h</name>
    <path>/home/matthias/Projekte/feltor/inc/dg/</path>
    <filename>helmholtz_8h</filename>
    <includes id="blas_8h" name="blas.h" local="yes" imported="no">blas.h</includes>
    <includes id="elliptic_8h" name="elliptic.h" local="yes" imported="no">elliptic.h</includes>
    <class kind="struct">dg::Helmholtz</class>
    <namespace>dg</namespace>
  </compound>
  <compound kind="file">
    <name>multistep.h</name>
    <path>/home/matthias/Projekte/feltor/inc/dg/</path>
    <filename>multistep_8h</filename>
    <includes id="cg_8h" name="cg.h" local="yes" imported="no">cg.h</includes>
    <class kind="struct">dg::AB</class>
    <class kind="struct">dg::Karniadakis</class>
    <class kind="struct">dg::SIRK</class>
    <namespace>dg</namespace>
  </compound>
  <compound kind="file">
    <name>nullstelle.h</name>
    <path>/home/matthias/Projekte/feltor/inc/dg/</path>
    <filename>nullstelle_8h</filename>
    <class kind="struct">dg::Ooops</class>
    <class kind="class">dg::KeineNST_1D</class>
    <namespace>dg</namespace>
    <member kind="function">
      <type>int</type>
      <name>bisection1d</name>
      <anchorfile>group__utilities.html</anchorfile>
      <anchor>gaa269808db678039605044e14fc849675</anchor>
      <arglist>(UnaryOp &amp;funktion, double &amp;x_min, double &amp;x_max, const double aufloesung)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>poisson.h</name>
    <path>/home/matthias/Projekte/feltor/inc/dg/</path>
    <filename>poisson_8h</filename>
    <includes id="blas_8h" name="blas.h" local="yes" imported="no">blas.h</includes>
    <includes id="enums_8h" name="enums.h" local="yes" imported="no">enums.h</includes>
    <class kind="struct">dg::Poisson</class>
    <namespace>dg</namespace>
  </compound>
  <compound kind="file">
    <name>runge_kutta.h</name>
    <path>/home/matthias/Projekte/feltor/inc/dg/</path>
    <filename>runge__kutta_8h</filename>
    <includes id="exceptions_8h" name="exceptions.h" local="yes" imported="no">exceptions.h</includes>
    <includes id="blas1_8h" name="blas1.h" local="yes" imported="no">blas1.h</includes>
    <class kind="struct">dg::rk_coeff</class>
    <class kind="struct">dg::RK</class>
    <class kind="struct">dg::NotANumber</class>
    <namespace>dg</namespace>
    <member kind="function">
      <type>void</type>
      <name>integrateRK4</name>
      <anchorfile>group__algorithms.html</anchorfile>
      <anchor>ga098434b3580fe8186441a1fd178214ef</anchor>
      <arglist>(RHS &amp;rhs, const Vector &amp;begin, Vector &amp;end, double T_max, double eps_abs)</arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>DG</name>
    <title>The Discontinuous Galerkin library</title>
    <filename>group___d_g.html</filename>
    <subgroup>grid</subgroup>
    <subgroup>evaluation</subgroup>
    <subgroup>functions</subgroup>
    <subgroup>creation</subgroup>
    <subgroup>blas</subgroup>
    <subgroup>algorithms</subgroup>
    <subgroup>utilities</subgroup>
    <subgroup>mpi_structures</subgroup>
  </compound>
  <compound kind="group">
    <name>grid</name>
    <title>Grid objects</title>
    <filename>group__grid.html</filename>
  </compound>
  <compound kind="group">
    <name>evaluation</name>
    <title>Function discretization</title>
    <filename>group__evaluation.html</filename>
  </compound>
  <compound kind="group">
    <name>functions</name>
    <title>Functions and Functors</title>
    <filename>group__functions.html</filename>
    <class kind="struct">dg::AbsMax</class>
    <class kind="struct">dg::AbsMin</class>
    <class kind="struct">dg::Gaussian</class>
    <class kind="struct">dg::Gaussian3d</class>
    <class kind="struct">dg::GaussianX</class>
    <class kind="struct">dg::GaussianY</class>
    <class kind="struct">dg::GaussianZ</class>
    <class kind="struct">dg::SinProfX</class>
    <class kind="struct">dg::ExpProfX</class>
    <class kind="struct">dg::LinearX</class>
    <class kind="struct">dg::LinearY</class>
    <class kind="struct">dg::LHalf</class>
    <class kind="struct">dg::RHalf</class>
    <class kind="struct">dg::Lamb</class>
    <class kind="struct">dg::Vortex</class>
    <class kind="struct">dg::BathRZ</class>
    <class kind="struct">dg::EXP</class>
    <class kind="struct">dg::LN</class>
    <class kind="struct">dg::SQRT</class>
    <class kind="struct">dg::MinMod</class>
    <class kind="struct">dg::PLUS</class>
    <class kind="struct">dg::MOD</class>
    <class kind="struct">dg::ABS</class>
    <class kind="struct">dg::CONSTANT</class>
    <class kind="struct">dg::Histogram</class>
    <class kind="struct">dg::Histogram2D</class>
    <member kind="function">
      <type>double</type>
      <name>bessj1</name>
      <anchorfile>group__functions.html</anchorfile>
      <anchor>ga31e93254b91f287daf4ca4756fb32385</anchor>
      <arglist>(double x)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>bessi1</name>
      <anchorfile>group__functions.html</anchorfile>
      <anchor>ga8f29ee46cf5603af9cabd93163cf98cc</anchor>
      <arglist>(double x)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>bessk1</name>
      <anchorfile>group__functions.html</anchorfile>
      <anchor>ga43e254f13fa144c646b2e509bcd5d1d1</anchor>
      <arglist>(double x)</arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>creation</name>
    <title>Discrete derivatives</title>
    <filename>group__creation.html</filename>
    <subgroup>lowlevel</subgroup>
    <subgroup>highlevel</subgroup>
    <subgroup>arakawa</subgroup>
    <subgroup>matrixoperators</subgroup>
    <member kind="enumeration">
      <type></type>
      <name>bc</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>ga59440bdf436f2874b49aa52b670ed364</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>PER</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>gga59440bdf436f2874b49aa52b670ed364a948704f60491461974ce4fe6339778b3</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>DIR</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>gga59440bdf436f2874b49aa52b670ed364adece0b7644d85f490823799a3b97f7e6</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>DIR_NEU</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>gga59440bdf436f2874b49aa52b670ed364ae1ff2b85fda37868973c8059e3ca3a79</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>NEU_DIR</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>gga59440bdf436f2874b49aa52b670ed364a5832830f6fb508b8932dbafad3d1b57c</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>NEU</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>gga59440bdf436f2874b49aa52b670ed364ad8a2f69a62e7fdafe1665ae7162e8e10</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>norm</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>ga9945b71a335bc97f78dc7425911c7287</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>normed</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>gga9945b71a335bc97f78dc7425911c7287a3f222a3e51d054ebe21228c62569e123</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>not_normed</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>gga9945b71a335bc97f78dc7425911c7287a07217e3dd9be28b4da85d46fef38f066</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>direction</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>gabf9ea3df33484cbb5886e257c3899e48</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>forward</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>ggabf9ea3df33484cbb5886e257c3899e48a573a4a72e7f55df92b88c254a13762f2</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>backward</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>ggabf9ea3df33484cbb5886e257c3899e48a3e10d2598f5b58a930631b12774e05cb</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>centered</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>ggabf9ea3df33484cbb5886e257c3899e48a6281b4fc609cb723a615662b5adac9df</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>system</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>ga75789d2c36dff2caed4b3bb80191b346</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>cartesian</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>gga75789d2c36dff2caed4b3bb80191b346a49a654c38e355ec847e55f927511019d</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>cylindrical</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>gga75789d2c36dff2caed4b3bb80191b346a6962eb4bbef38ebabc41458844991bfd</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>lowlevel</name>
    <title>Lowlevel helper functions and classes</title>
    <filename>group__lowlevel.html</filename>
  </compound>
  <compound kind="group">
    <name>highlevel</name>
    <title>Matrix creation functions and classes</title>
    <filename>group__highlevel.html</filename>
  </compound>
  <compound kind="group">
    <name>arakawa</name>
    <title>Arakawas scheme</title>
    <filename>group__arakawa.html</filename>
    <class kind="struct">dg::ArakawaX</class>
    <class kind="struct">dg::Poisson</class>
  </compound>
  <compound kind="group">
    <name>matrixoperators</name>
    <title>Classes that act as matrices in blas2 routines</title>
    <filename>group__matrixoperators.html</filename>
    <class kind="class">dg::Elliptic</class>
    <class kind="struct">dg::GeneralElliptic</class>
    <class kind="struct">dg::Helmholtz</class>
    <member kind="function">
      <type></type>
      <name>Helmholtz</name>
      <anchorfile>group__matrixoperators.html</anchorfile>
      <anchor>ga76ec5eaa2cc3dd1ef9b0c90f8a85fd6c</anchor>
      <arglist>(const Grid &amp;g, double alpha=1., direction dir=dg::forward)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Helmholtz</name>
      <anchorfile>group__matrixoperators.html</anchorfile>
      <anchor>ga5a2fc2f7c83288c951b5a938d8cacd85</anchor>
      <arglist>(const Grid &amp;g, bc bcx, bc bcy, double alpha=1., direction dir=dg::forward)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>symv</name>
      <anchorfile>group__matrixoperators.html</anchorfile>
      <anchor>ga3f5c52b98883ecc88056b3f82030f548</anchor>
      <arglist>(Vector &amp;x, Vector &amp;y)</arglist>
    </member>
    <member kind="function">
      <type>const Preconditioner &amp;</type>
      <name>weights</name>
      <anchorfile>group__matrixoperators.html</anchorfile>
      <anchor>gaa999c6af019581113bde43dd67cacc44</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>const Preconditioner &amp;</type>
      <name>precond</name>
      <anchorfile>group__matrixoperators.html</anchorfile>
      <anchor>ga42af8edcfc2def422a545c6fe950dbfc</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>double &amp;</type>
      <name>alpha</name>
      <anchorfile>group__matrixoperators.html</anchorfile>
      <anchor>ga7fceb7f2dbaf51df5941643f33f1f8a6</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>alpha</name>
      <anchorfile>group__matrixoperators.html</anchorfile>
      <anchor>ga59320b5e0dd00f8e5a7c49c880912d60</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_chi</name>
      <anchorfile>group__matrixoperators.html</anchorfile>
      <anchor>gac95fce512bf66491a2235d589148a64a</anchor>
      <arglist>(const Vector &amp;chi)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>reset_chi</name>
      <anchorfile>group__matrixoperators.html</anchorfile>
      <anchor>gaf76f445d7887289a03f0e48ed42c2a3d</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const Vector &amp;</type>
      <name>chi</name>
      <anchorfile>group__matrixoperators.html</anchorfile>
      <anchor>gaf8330683e97b34392b998695d33f13ba</anchor>
      <arglist>()</arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>blas</name>
    <title>Basic Linear Algebra Subprograms</title>
    <filename>group__blas.html</filename>
    <subgroup>blas1</subgroup>
    <subgroup>blas2</subgroup>
  </compound>
  <compound kind="group">
    <name>blas1</name>
    <title>BLAS level 1 routines</title>
    <filename>group__blas1.html</filename>
    <namespace>dg::blas1</namespace>
    <member kind="function">
      <type>VectorTraits&lt; Vector &gt;::value_type</type>
      <name>dot</name>
      <anchorfile>group__blas1.html</anchorfile>
      <anchor>gade540580ce83e615dcb8e2210689bb32</anchor>
      <arglist>(const Vector &amp;x, const Vector &amp;y)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>axpby</name>
      <anchorfile>group__blas1.html</anchorfile>
      <anchor>ga6ee5b940147ba6b71e1fe1fc538e9459</anchor>
      <arglist>(typename VectorTraits&lt; Vector &gt;::value_type alpha, const Vector &amp;x, typename VectorTraits&lt; Vector &gt;::value_type beta, Vector &amp;y)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>axpby</name>
      <anchorfile>group__blas1.html</anchorfile>
      <anchor>ga24d1c58804538649f88ebafd65c2845b</anchor>
      <arglist>(typename VectorTraits&lt; Vector &gt;::value_type alpha, const Vector &amp;x, typename VectorTraits&lt; Vector &gt;::value_type beta, const Vector &amp;y, Vector &amp;result)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>transform</name>
      <anchorfile>group__blas1.html</anchorfile>
      <anchor>gace34b2c8e27a5173cb25db0542089c2c</anchor>
      <arglist>(const Vector &amp;x, Vector &amp;y, UnaryOp op)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>scal</name>
      <anchorfile>group__blas1.html</anchorfile>
      <anchor>ga9287f21c8d97b7d4d77b0353cf5b56b2</anchor>
      <arglist>(Vector &amp;x, typename VectorTraits&lt; Vector &gt;::value_type alpha)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>pointwiseDot</name>
      <anchorfile>group__blas1.html</anchorfile>
      <anchor>ga2939c008737a653c8ea3aa972cac136b</anchor>
      <arglist>(const Vector &amp;x1, const Vector &amp;x2, Vector &amp;y)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>pointwiseDivide</name>
      <anchorfile>group__blas1.html</anchorfile>
      <anchor>ga451523cc2d3740676888ce0b14cb8509</anchor>
      <arglist>(const Vector &amp;x1, const Vector &amp;x2, Vector &amp;y)</arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>blas2</name>
    <title>BLAS level 2 routines</title>
    <filename>group__blas2.html</filename>
    <namespace>dg::blas2</namespace>
    <member kind="function">
      <type>MatrixTraits&lt; Matrix &gt;::value_type</type>
      <name>dot</name>
      <anchorfile>group__blas2.html</anchorfile>
      <anchor>gaeb8a93cac85646f2173160afd2a79d53</anchor>
      <arglist>(const Vector &amp;x, const Matrix &amp;m, const Vector &amp;y)</arglist>
    </member>
    <member kind="function">
      <type>MatrixTraits&lt; Matrix &gt;::value_type</type>
      <name>dot</name>
      <anchorfile>group__blas2.html</anchorfile>
      <anchor>gac72ec781ca79b3b983099ea172f896ab</anchor>
      <arglist>(const Matrix &amp;m, const Vector &amp;x)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>symv</name>
      <anchorfile>group__blas2.html</anchorfile>
      <anchor>ga7f66ae102c9c093cdc0877a989fd82b3</anchor>
      <arglist>(typename MatrixTraits&lt; Precon &gt;::value_type alpha, const Precon &amp;P, const Vector &amp;x, typename MatrixTraits&lt; Precon &gt;::value_type beta, Vector &amp;y)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>symv</name>
      <anchorfile>group__blas2.html</anchorfile>
      <anchor>ga268c50e488c18db3dc5be1d1934eb7b2</anchor>
      <arglist>(Matrix &amp;m, Vector1 &amp;x, Vector2 &amp;y)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>gemv</name>
      <anchorfile>group__blas2.html</anchorfile>
      <anchor>gadda8a3d0278c095d51becf208760d49b</anchor>
      <arglist>(Matrix &amp;m, Vector1 &amp;x, Vector2 &amp;y)</arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>algorithms</name>
    <title>Numerical schemes</title>
    <filename>group__algorithms.html</filename>
    <class kind="class">dg::CG</class>
    <class kind="struct">dg::Invert</class>
    <class kind="struct">dg::AB</class>
    <class kind="struct">dg::Karniadakis</class>
    <class kind="struct">dg::SIRK</class>
    <class kind="struct">dg::RK</class>
    <member kind="function">
      <type>unsigned</type>
      <name>cg</name>
      <anchorfile>group__algorithms.html</anchorfile>
      <anchor>ga61caca7351ed278357a3923adb6ab655</anchor>
      <arglist>(Matrix &amp;A, Vector &amp;x, const Vector &amp;b, const Preconditioner &amp;P, typename VectorTraits&lt; Vector &gt;::value_type eps, unsigned max_iter)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>integrateRK4</name>
      <anchorfile>group__algorithms.html</anchorfile>
      <anchor>ga098434b3580fe8186441a1fd178214ef</anchor>
      <arglist>(RHS &amp;rhs, const Vector &amp;begin, Vector &amp;end, double T_max, double eps_abs)</arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>utilities</name>
    <title>Utilities</title>
    <filename>group__utilities.html</filename>
    <subgroup>scatter</subgroup>
    <subgroup>polarization</subgroup>
    <class kind="struct">dg::Fail</class>
    <class kind="struct">dg::Ooops</class>
    <class kind="class">dg::KeineNST_1D</class>
    <member kind="function">
      <type>int</type>
      <name>bisection1d</name>
      <anchorfile>group__utilities.html</anchorfile>
      <anchor>gaa269808db678039605044e14fc849675</anchor>
      <arglist>(UnaryOp &amp;funktion, double &amp;x_min, double &amp;x_max, const double aufloesung)</arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>scatter</name>
    <title>Utility functions for reorder operations on DG-formatted vectors</title>
    <filename>group__scatter.html</filename>
  </compound>
  <compound kind="group">
    <name>polarization</name>
    <title>Utility functions for C-style bindings of polarization solver</title>
    <filename>group__polarization.html</filename>
  </compound>
  <compound kind="group">
    <name>mpi_structures</name>
    <title>MPI backend funcionality</title>
    <filename>group__mpi__structures.html</filename>
  </compound>
  <compound kind="namespace">
    <name>dg</name>
    <filename>namespacedg.html</filename>
    <namespace>dg::blas1</namespace>
    <namespace>dg::blas2</namespace>
    <class kind="struct">dg::ArakawaX</class>
    <class kind="class">dg::CG</class>
    <class kind="struct">dg::Invert</class>
    <class kind="class">dg::Elliptic</class>
    <class kind="struct">dg::GeneralElliptic</class>
    <class kind="struct">dg::Fail</class>
    <class kind="struct">dg::AbsMax</class>
    <class kind="struct">dg::AbsMin</class>
    <class kind="struct">dg::Gaussian</class>
    <class kind="struct">dg::Gaussian3d</class>
    <class kind="struct">dg::GaussianX</class>
    <class kind="struct">dg::GaussianY</class>
    <class kind="struct">dg::GaussianZ</class>
    <class kind="struct">dg::SinProfX</class>
    <class kind="struct">dg::ExpProfX</class>
    <class kind="struct">dg::LinearX</class>
    <class kind="struct">dg::LinearY</class>
    <class kind="struct">dg::LHalf</class>
    <class kind="struct">dg::RHalf</class>
    <class kind="struct">dg::Lamb</class>
    <class kind="struct">dg::Vortex</class>
    <class kind="struct">dg::BathRZ</class>
    <class kind="struct">dg::EXP</class>
    <class kind="struct">dg::LN</class>
    <class kind="struct">dg::SQRT</class>
    <class kind="struct">dg::MinMod</class>
    <class kind="struct">dg::PLUS</class>
    <class kind="struct">dg::MOD</class>
    <class kind="struct">dg::ABS</class>
    <class kind="struct">dg::CONSTANT</class>
    <class kind="struct">dg::Histogram</class>
    <class kind="struct">dg::Histogram2D</class>
    <class kind="struct">dg::Helmholtz</class>
    <class kind="struct">dg::AB</class>
    <class kind="struct">dg::Karniadakis</class>
    <class kind="struct">dg::SIRK</class>
    <class kind="struct">dg::Ooops</class>
    <class kind="class">dg::KeineNST_1D</class>
    <class kind="struct">dg::Poisson</class>
    <class kind="struct">dg::rk_coeff</class>
    <class kind="struct">dg::RK</class>
    <class kind="struct">dg::NotANumber</class>
    <member kind="enumeration">
      <type></type>
      <name>bc</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>ga59440bdf436f2874b49aa52b670ed364</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>PER</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>gga59440bdf436f2874b49aa52b670ed364a948704f60491461974ce4fe6339778b3</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>DIR</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>gga59440bdf436f2874b49aa52b670ed364adece0b7644d85f490823799a3b97f7e6</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>DIR_NEU</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>gga59440bdf436f2874b49aa52b670ed364ae1ff2b85fda37868973c8059e3ca3a79</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>NEU_DIR</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>gga59440bdf436f2874b49aa52b670ed364a5832830f6fb508b8932dbafad3d1b57c</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>NEU</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>gga59440bdf436f2874b49aa52b670ed364ad8a2f69a62e7fdafe1665ae7162e8e10</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>norm</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>ga9945b71a335bc97f78dc7425911c7287</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>normed</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>gga9945b71a335bc97f78dc7425911c7287a3f222a3e51d054ebe21228c62569e123</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>not_normed</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>gga9945b71a335bc97f78dc7425911c7287a07217e3dd9be28b4da85d46fef38f066</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>direction</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>gabf9ea3df33484cbb5886e257c3899e48</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>forward</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>ggabf9ea3df33484cbb5886e257c3899e48a573a4a72e7f55df92b88c254a13762f2</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>backward</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>ggabf9ea3df33484cbb5886e257c3899e48a3e10d2598f5b58a930631b12774e05cb</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>centered</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>ggabf9ea3df33484cbb5886e257c3899e48a6281b4fc609cb723a615662b5adac9df</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>system</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>ga75789d2c36dff2caed4b3bb80191b346</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>cartesian</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>gga75789d2c36dff2caed4b3bb80191b346a49a654c38e355ec847e55f927511019d</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>cylindrical</name>
      <anchorfile>group__creation.html</anchorfile>
      <anchor>gga75789d2c36dff2caed4b3bb80191b346a6962eb4bbef38ebabc41458844991bfd</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>unsigned</type>
      <name>cg</name>
      <anchorfile>group__algorithms.html</anchorfile>
      <anchor>ga61caca7351ed278357a3923adb6ab655</anchor>
      <arglist>(Matrix &amp;A, Vector &amp;x, const Vector &amp;b, const Preconditioner &amp;P, typename VectorTraits&lt; Vector &gt;::value_type eps, unsigned max_iter)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>bessj1</name>
      <anchorfile>group__functions.html</anchorfile>
      <anchor>ga31e93254b91f287daf4ca4756fb32385</anchor>
      <arglist>(double x)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>bessi1</name>
      <anchorfile>group__functions.html</anchorfile>
      <anchor>ga8f29ee46cf5603af9cabd93163cf98cc</anchor>
      <arglist>(double x)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>bessk1</name>
      <anchorfile>group__functions.html</anchorfile>
      <anchor>ga43e254f13fa144c646b2e509bcd5d1d1</anchor>
      <arglist>(double x)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>bisection1d</name>
      <anchorfile>group__utilities.html</anchorfile>
      <anchor>gaa269808db678039605044e14fc849675</anchor>
      <arglist>(UnaryOp &amp;funktion, double &amp;x_min, double &amp;x_max, const double aufloesung)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>integrateRK4</name>
      <anchorfile>group__algorithms.html</anchorfile>
      <anchor>ga098434b3580fe8186441a1fd178214ef</anchor>
      <arglist>(RHS &amp;rhs, const Vector &amp;begin, Vector &amp;end, double T_max, double eps_abs)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::ArakawaX</name>
    <filename>structdg_1_1_arakawa_x.html</filename>
    <templarg></templarg>
    <templarg></templarg>
    <member kind="function">
      <type></type>
      <name>ArakawaX</name>
      <anchorfile>structdg_1_1_arakawa_x.html</anchorfile>
      <anchor>ac33d39046b6c27ffaad030e18b3910e2</anchor>
      <arglist>(const Grid &amp;g)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>ArakawaX</name>
      <anchorfile>structdg_1_1_arakawa_x.html</anchorfile>
      <anchor>ac00da03bc63b7d9ea863fc9af928f66d</anchor>
      <arglist>(const Grid &amp;g, bc bcx, bc bcy)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1_arakawa_x.html</anchorfile>
      <anchor>aff193379f05d069f0ab355a77d655054</anchor>
      <arglist>(container &amp;lhs, container &amp;rhs, container &amp;result)</arglist>
    </member>
    <member kind="function">
      <type>const Matrix &amp;</type>
      <name>dx</name>
      <anchorfile>structdg_1_1_arakawa_x.html</anchorfile>
      <anchor>a1ac5172551370a5283513d65f353b653</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const Matrix &amp;</type>
      <name>dy</name>
      <anchorfile>structdg_1_1_arakawa_x.html</anchorfile>
      <anchor>a07c34c8983fad0d4345313ca9b61873b</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>variation</name>
      <anchorfile>structdg_1_1_arakawa_x.html</anchorfile>
      <anchor>a94b98d5a2711eea2d690aa2cac907b32</anchor>
      <arglist>(container &amp;phi, container &amp;varphi)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>bracketS</name>
      <anchorfile>structdg_1_1_arakawa_x.html</anchorfile>
      <anchor>a4bca8c8355aa0d33f5913edf77fe96db</anchor>
      <arglist>(container &amp;lhs, container &amp;rhs, container &amp;result)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>dg::CG</name>
    <filename>classdg_1_1_c_g.html</filename>
    <templarg>Vector</templarg>
    <member kind="typedef">
      <type>VectorTraits&lt; Vector &gt;::value_type</type>
      <name>value_type</name>
      <anchorfile>classdg_1_1_c_g.html</anchorfile>
      <anchor>a1ef5a42ac2f35b465a9b5e5d2293d572</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>CG</name>
      <anchorfile>classdg_1_1_c_g.html</anchorfile>
      <anchor>a2c8ea3ee27e6a0081f2694a69d5ef78b</anchor>
      <arglist>(const Vector &amp;copy, unsigned max_iter)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_max</name>
      <anchorfile>classdg_1_1_c_g.html</anchorfile>
      <anchor>a5b59194ed8198858e1eb969059559a4e</anchor>
      <arglist>(unsigned new_max)</arglist>
    </member>
    <member kind="function">
      <type>unsigned</type>
      <name>get_max</name>
      <anchorfile>classdg_1_1_c_g.html</anchorfile>
      <anchor>a6c6ddea9c0e7b7f2149722ef25cc9dd8</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>unsigned</type>
      <name>operator()</name>
      <anchorfile>classdg_1_1_c_g.html</anchorfile>
      <anchor>a8dc452436c95a758207bc35cec53909f</anchor>
      <arglist>(Matrix &amp;A, Vector &amp;x, const Vector &amp;b, Preconditioner &amp;P, value_type eps=1e-12, value_type nrmb_correction=1)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::Invert</name>
    <filename>structdg_1_1_invert.html</filename>
    <templarg></templarg>
    <member kind="function">
      <type></type>
      <name>Invert</name>
      <anchorfile>structdg_1_1_invert.html</anchorfile>
      <anchor>a36911150e0779cce30ef7e7d002ef0ac</anchor>
      <arglist>(const container &amp;copyable, unsigned max_iter, double eps, double nrmb_correction=1)</arglist>
    </member>
    <member kind="function">
      <type>unsigned</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1_invert.html</anchorfile>
      <anchor>aba7447f25ad0b970efe0df955c1da484</anchor>
      <arglist>(SymmetricOp &amp;op, container &amp;phi, const container &amp;rho)</arglist>
    </member>
    <member kind="function">
      <type>unsigned</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1_invert.html</anchorfile>
      <anchor>a04af60e082a2c5a2058fae930338001b</anchor>
      <arglist>(SymmetricOp &amp;op, container &amp;phi, const container &amp;rho, Weights &amp;w, Preconditioner &amp;p)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_max</name>
      <anchorfile>structdg_1_1_invert.html</anchorfile>
      <anchor>ab1c32f7fdd5c123eab428283df6cf83c</anchor>
      <arglist>(unsigned new_max)</arglist>
    </member>
    <member kind="function">
      <type>unsigned</type>
      <name>get_max</name>
      <anchorfile>structdg_1_1_invert.html</anchorfile>
      <anchor>a9bf8b8325e4b96dc859103b09a3112a7</anchor>
      <arglist>() const </arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>dg::Elliptic</name>
    <filename>classdg_1_1_elliptic.html</filename>
    <templarg></templarg>
    <templarg></templarg>
    <templarg></templarg>
    <member kind="function">
      <type></type>
      <name>Elliptic</name>
      <anchorfile>classdg_1_1_elliptic.html</anchorfile>
      <anchor>a1d3ae63afd0ab6205e5c595ee55d49af</anchor>
      <arglist>(const Grid &amp;g, norm no=not_normed, direction dir=forward)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Elliptic</name>
      <anchorfile>classdg_1_1_elliptic.html</anchorfile>
      <anchor>a94f66ac064c8657132d378a39b30e70f</anchor>
      <arglist>(const Grid &amp;g, bc bcx, bc bcy, norm no=not_normed, direction dir=forward)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_chi</name>
      <anchorfile>classdg_1_1_elliptic.html</anchorfile>
      <anchor>abfd10f349d672d814cd9f564f48b7b83</anchor>
      <arglist>(const Vector &amp;chi)</arglist>
    </member>
    <member kind="function">
      <type>const Preconditioner &amp;</type>
      <name>weights</name>
      <anchorfile>classdg_1_1_elliptic.html</anchorfile>
      <anchor>a93d09db13361df006183edf7e1f8584e</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>const Preconditioner &amp;</type>
      <name>precond</name>
      <anchorfile>classdg_1_1_elliptic.html</anchorfile>
      <anchor>aeec5ccc24b417b0af51f153dee76238d</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>symv</name>
      <anchorfile>classdg_1_1_elliptic.html</anchorfile>
      <anchor>aaa875850f691e28b53de7560367bc950</anchor>
      <arglist>(Vector &amp;x, Vector &amp;y)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::GeneralElliptic</name>
    <filename>structdg_1_1_general_elliptic.html</filename>
    <templarg></templarg>
    <templarg></templarg>
    <templarg></templarg>
    <member kind="function">
      <type></type>
      <name>GeneralElliptic</name>
      <anchorfile>structdg_1_1_general_elliptic.html</anchorfile>
      <anchor>a951d4bf81105a15efac024fbcfb029d2</anchor>
      <arglist>(const Grid &amp;g, norm no=not_normed, direction dir=forward)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_x</name>
      <anchorfile>structdg_1_1_general_elliptic.html</anchorfile>
      <anchor>accb1bdb9a161cac01407144b9bad5467</anchor>
      <arglist>(const Vector &amp;chi)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_y</name>
      <anchorfile>structdg_1_1_general_elliptic.html</anchorfile>
      <anchor>af120d0e5f7fd06e44c51fa70ba8567e3</anchor>
      <arglist>(const Vector &amp;chi)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_z</name>
      <anchorfile>structdg_1_1_general_elliptic.html</anchorfile>
      <anchor>ab006a9fe9ea8f84d7903a91e04667851</anchor>
      <arglist>(const Vector &amp;chi)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set</name>
      <anchorfile>structdg_1_1_general_elliptic.html</anchorfile>
      <anchor>ae178fdd7989f8c673d405cb8dd3918d0</anchor>
      <arglist>(const std::vector&lt; Vector &gt; &amp;chi)</arglist>
    </member>
    <member kind="function">
      <type>const Preconditioner &amp;</type>
      <name>weights</name>
      <anchorfile>structdg_1_1_general_elliptic.html</anchorfile>
      <anchor>a5dfe8dd7fa1b47a6e4e581db2fbf12a9</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>const Preconditioner &amp;</type>
      <name>precond</name>
      <anchorfile>structdg_1_1_general_elliptic.html</anchorfile>
      <anchor>a4394a6de837ce9557cb76a6c8df4d457</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>symv</name>
      <anchorfile>structdg_1_1_general_elliptic.html</anchorfile>
      <anchor>afdfe8713b14d6c197b92672bc2e2186b</anchor>
      <arglist>(Vector &amp;x, Vector &amp;y)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::Fail</name>
    <filename>structdg_1_1_fail.html</filename>
    <member kind="function">
      <type></type>
      <name>Fail</name>
      <anchorfile>structdg_1_1_fail.html</anchorfile>
      <anchor>acbccb1ec26460accff6fe8ae47fb9cef</anchor>
      <arglist>(double eps)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>epsilon</name>
      <anchorfile>structdg_1_1_fail.html</anchorfile>
      <anchor>a526158d66c83dbee6a33f72d5b780486</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>char const *</type>
      <name>what</name>
      <anchorfile>structdg_1_1_fail.html</anchorfile>
      <anchor>ad3d7c1cd0eb04c8526c2c00cf9de6a77</anchor>
      <arglist>() const </arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::AbsMax</name>
    <filename>structdg_1_1_abs_max.html</filename>
    <templarg></templarg>
    <member kind="function">
      <type>T</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1_abs_max.html</anchorfile>
      <anchor>aa714656703ea5cb3d7714faabe9d7629</anchor>
      <arglist>(const T &amp;x, const T &amp;y)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::AbsMin</name>
    <filename>structdg_1_1_abs_min.html</filename>
    <templarg></templarg>
    <member kind="function">
      <type>T</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1_abs_min.html</anchorfile>
      <anchor>a916191cf7cf149afc3bdb36c9fd24435</anchor>
      <arglist>(const T &amp;x, const T &amp;y)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::Gaussian</name>
    <filename>structdg_1_1_gaussian.html</filename>
    <member kind="function">
      <type></type>
      <name>Gaussian</name>
      <anchorfile>structdg_1_1_gaussian.html</anchorfile>
      <anchor>aba2df3bbc671faf0a429ab001db27055</anchor>
      <arglist>(double x0, double y0, double sigma_x, double sigma_y, double amp, double kz=1.)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1_gaussian.html</anchorfile>
      <anchor>a1fb4fe2bf3ba2ca34bc583d1ae458442</anchor>
      <arglist>(double x, double y)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1_gaussian.html</anchorfile>
      <anchor>a7e4ebb4c3e7dc16bf2dcdbb70631bd2e</anchor>
      <arglist>(double x, double y, double z)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::Gaussian3d</name>
    <filename>structdg_1_1_gaussian3d.html</filename>
    <member kind="function">
      <type></type>
      <name>Gaussian3d</name>
      <anchorfile>structdg_1_1_gaussian3d.html</anchorfile>
      <anchor>acd75cd8bfa2dac659a308c1a17219f1e</anchor>
      <arglist>(double x0, double y0, double z0, double sigma_x, double sigma_y, double sigma_z, double amp)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1_gaussian3d.html</anchorfile>
      <anchor>a043038f3e18a1d88f149ae63bc2c2f4c</anchor>
      <arglist>(double x, double y)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1_gaussian3d.html</anchorfile>
      <anchor>a93f5460d74f6fdb230df5a863352ae63</anchor>
      <arglist>(double x, double y, double z)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::GaussianX</name>
    <filename>structdg_1_1_gaussian_x.html</filename>
    <member kind="function">
      <type></type>
      <name>GaussianX</name>
      <anchorfile>structdg_1_1_gaussian_x.html</anchorfile>
      <anchor>a8126f14bde2aec2566da04d2697d0964</anchor>
      <arglist>(double x0, double sigma_x, double amp)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1_gaussian_x.html</anchorfile>
      <anchor>a427dfa07582fd4df296d6d881818d6f8</anchor>
      <arglist>(double x, double y)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::GaussianY</name>
    <filename>structdg_1_1_gaussian_y.html</filename>
    <member kind="function">
      <type></type>
      <name>GaussianY</name>
      <anchorfile>structdg_1_1_gaussian_y.html</anchorfile>
      <anchor>a02d66ca7623f6132e0290fd33568af1f</anchor>
      <arglist>(double y0, double sigma_y, double amp)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1_gaussian_y.html</anchorfile>
      <anchor>a621c68858e91c3acc2f4d51b76071d9d</anchor>
      <arglist>(double x, double y)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::GaussianZ</name>
    <filename>structdg_1_1_gaussian_z.html</filename>
    <member kind="function">
      <type></type>
      <name>GaussianZ</name>
      <anchorfile>structdg_1_1_gaussian_z.html</anchorfile>
      <anchor>aa1915517625deebecb730e2b37a3e888</anchor>
      <arglist>(double z0, double sigma_z, double amp)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1_gaussian_z.html</anchorfile>
      <anchor>a5b7a771e993ddef418aead8300f3aa21</anchor>
      <arglist>(double z)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1_gaussian_z.html</anchorfile>
      <anchor>af22c467eda3bf17e49b09ff8b720a581</anchor>
      <arglist>(double x, double y, double z)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::SinProfX</name>
    <filename>structdg_1_1_sin_prof_x.html</filename>
    <member kind="function">
      <type></type>
      <name>SinProfX</name>
      <anchorfile>structdg_1_1_sin_prof_x.html</anchorfile>
      <anchor>a1d8a1a06b4c66cf68b532ddaa47e3e4e</anchor>
      <arglist>(double amp, double bamp, double kx)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1_sin_prof_x.html</anchorfile>
      <anchor>a25ac8f8bc25258d40bb322c7a210d752</anchor>
      <arglist>(double x, double y)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::ExpProfX</name>
    <filename>structdg_1_1_exp_prof_x.html</filename>
    <member kind="function">
      <type></type>
      <name>ExpProfX</name>
      <anchorfile>structdg_1_1_exp_prof_x.html</anchorfile>
      <anchor>acf9e0f6bda55e047dc46c397830505b3</anchor>
      <arglist>(double amp, double bamp, double ln)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1_exp_prof_x.html</anchorfile>
      <anchor>a219e9af5a1e50c076b401fded938e731</anchor>
      <arglist>(double x, double y)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::LinearX</name>
    <filename>structdg_1_1_linear_x.html</filename>
    <member kind="function">
      <type></type>
      <name>LinearX</name>
      <anchorfile>structdg_1_1_linear_x.html</anchorfile>
      <anchor>a2721b98ac435a39e4864b42657e7c07c</anchor>
      <arglist>(double a, double b)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1_linear_x.html</anchorfile>
      <anchor>afb11c904cbdcde60dba138fc133629a6</anchor>
      <arglist>(double x, double y)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::LinearY</name>
    <filename>structdg_1_1_linear_y.html</filename>
    <member kind="function">
      <type></type>
      <name>LinearY</name>
      <anchorfile>structdg_1_1_linear_y.html</anchorfile>
      <anchor>a141df376a562eb957ae6c05ce76c78d8</anchor>
      <arglist>(double a, double b)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1_linear_y.html</anchorfile>
      <anchor>af249cdd8fb6ae1b7dd8fabfc0e854827</anchor>
      <arglist>(double x, double y)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::LHalf</name>
    <filename>structdg_1_1_l_half.html</filename>
    <member kind="function">
      <type></type>
      <name>LHalf</name>
      <anchorfile>structdg_1_1_l_half.html</anchorfile>
      <anchor>a73a6c6de949ca50467a3cd8c9371bddf</anchor>
      <arglist>(double xb)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1_l_half.html</anchorfile>
      <anchor>aaaf6fbf27136e0a443e42be3d41152e7</anchor>
      <arglist>(double x, double y)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::RHalf</name>
    <filename>structdg_1_1_r_half.html</filename>
    <member kind="function">
      <type></type>
      <name>RHalf</name>
      <anchorfile>structdg_1_1_r_half.html</anchorfile>
      <anchor>a683a4e23fef2cf4afe953006342c19f9</anchor>
      <arglist>(double xb)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1_r_half.html</anchorfile>
      <anchor>a128cce7a2daa7e1078608845f526ac47</anchor>
      <arglist>(double x, double y)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::Lamb</name>
    <filename>structdg_1_1_lamb.html</filename>
    <member kind="function">
      <type></type>
      <name>Lamb</name>
      <anchorfile>structdg_1_1_lamb.html</anchorfile>
      <anchor>a8bbe13dcd12f398e0426f1c92388ecdd</anchor>
      <arglist>(double x0, double y0, double R, double U)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1_lamb.html</anchorfile>
      <anchor>a32e2eea9f78ae4e647eaadd7a1adc267</anchor>
      <arglist>(double x, double y)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>enstrophy</name>
      <anchorfile>structdg_1_1_lamb.html</anchorfile>
      <anchor>a9116ad77bc494ee87b0e7b8d76fada71</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>energy</name>
      <anchorfile>structdg_1_1_lamb.html</anchorfile>
      <anchor>a58b2ef1b7f2b2e8d4f049ab82a6f9d93</anchor>
      <arglist>()</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::Vortex</name>
    <filename>structdg_1_1_vortex.html</filename>
    <member kind="function">
      <type></type>
      <name>Vortex</name>
      <anchorfile>structdg_1_1_vortex.html</anchorfile>
      <anchor>a3cb30fdf2c8da900f2b6f3366dbaf237</anchor>
      <arglist>(double x0, double y0, unsigned state, double R, double u_dipole, double kz=0)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1_vortex.html</anchorfile>
      <anchor>a5ed882464931c6ff21123b39fb2aeedc</anchor>
      <arglist>(double x, double y)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1_vortex.html</anchorfile>
      <anchor>ab9c5cf940de3ddc21b35d62614dda592</anchor>
      <arglist>(double x, double y, double z)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::BathRZ</name>
    <filename>structdg_1_1_bath_r_z.html</filename>
    <member kind="function">
      <type></type>
      <name>BathRZ</name>
      <anchorfile>structdg_1_1_bath_r_z.html</anchorfile>
      <anchor>ad3957e162dc4759b89df68e9696cb81d</anchor>
      <arglist>(unsigned Rm, unsigned Zm, unsigned Nz, double R_min, double Z_min, double gamma, double eddysize, double amp)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1_bath_r_z.html</anchorfile>
      <anchor>a48cdc5fb70d63a515f4c1d0d19c095e9</anchor>
      <arglist>(double R, double Z)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1_bath_r_z.html</anchorfile>
      <anchor>af2ccb27b317a8e3b4a76f3db9bcb8a7b</anchor>
      <arglist>(double R, double Z, double phi)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::EXP</name>
    <filename>structdg_1_1_e_x_p.html</filename>
    <templarg></templarg>
    <member kind="function">
      <type></type>
      <name>EXP</name>
      <anchorfile>structdg_1_1_e_x_p.html</anchorfile>
      <anchor>af085981be864a6ab4c5f1a75ea8757b7</anchor>
      <arglist>(double amp=1., double lambda=1.)</arglist>
    </member>
    <member kind="function">
      <type>T</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1_e_x_p.html</anchorfile>
      <anchor>a5a8ae6a0f36fa060e7fe97a632c2f978</anchor>
      <arglist>(const T &amp;x)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::LN</name>
    <filename>structdg_1_1_l_n.html</filename>
    <templarg></templarg>
    <member kind="function">
      <type>T</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1_l_n.html</anchorfile>
      <anchor>aaa9d64f99df571d4f164eefada35797b</anchor>
      <arglist>(const T &amp;x)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::SQRT</name>
    <filename>structdg_1_1_s_q_r_t.html</filename>
    <templarg></templarg>
    <member kind="function">
      <type>T</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1_s_q_r_t.html</anchorfile>
      <anchor>a262a9118b42b69858043cb66b97aa7d2</anchor>
      <arglist>(const T &amp;x)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::MinMod</name>
    <filename>structdg_1_1_min_mod.html</filename>
    <templarg></templarg>
    <member kind="function">
      <type>T</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1_min_mod.html</anchorfile>
      <anchor>a88d5901b10cea0b447e7758de1807b20</anchor>
      <arglist>(T a1, T a2, T a3)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::PLUS</name>
    <filename>structdg_1_1_p_l_u_s.html</filename>
    <templarg></templarg>
    <member kind="function">
      <type></type>
      <name>PLUS</name>
      <anchorfile>structdg_1_1_p_l_u_s.html</anchorfile>
      <anchor>a6046659f109429be9e83c4a344c14064</anchor>
      <arglist>(T value)</arglist>
    </member>
    <member kind="function">
      <type>T</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1_p_l_u_s.html</anchorfile>
      <anchor>adce602b7c450f6b06c9954283e828dee</anchor>
      <arglist>(const T &amp;x)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::MOD</name>
    <filename>structdg_1_1_m_o_d.html</filename>
    <templarg></templarg>
    <member kind="function">
      <type></type>
      <name>MOD</name>
      <anchorfile>structdg_1_1_m_o_d.html</anchorfile>
      <anchor>a1661e093118805e4334b61089134bf6f</anchor>
      <arglist>(T m)</arglist>
    </member>
    <member kind="function">
      <type>T</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1_m_o_d.html</anchorfile>
      <anchor>aa66c4ae9784689450e8d94ec6bf90fe8</anchor>
      <arglist>(const T &amp;x)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::ABS</name>
    <filename>structdg_1_1_a_b_s.html</filename>
    <templarg></templarg>
    <member kind="function">
      <type>T</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1_a_b_s.html</anchorfile>
      <anchor>ae877fcbbc5d06b6ca15c21bbeb74040c</anchor>
      <arglist>(const T &amp;x)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::CONSTANT</name>
    <filename>structdg_1_1_c_o_n_s_t_a_n_t.html</filename>
    <member kind="function">
      <type></type>
      <name>CONSTANT</name>
      <anchorfile>structdg_1_1_c_o_n_s_t_a_n_t.html</anchorfile>
      <anchor>ae8096ed918793f4de9c56cb7d39baa98</anchor>
      <arglist>(double cte)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1_c_o_n_s_t_a_n_t.html</anchorfile>
      <anchor>ac7883c7de7daa091b4ebe20c8fdad508</anchor>
      <arglist>(double x)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1_c_o_n_s_t_a_n_t.html</anchorfile>
      <anchor>ad08e5a0ee5593660f0b47b11a217e1ff</anchor>
      <arglist>(double x, double y)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1_c_o_n_s_t_a_n_t.html</anchorfile>
      <anchor>ab0b682a0acc252ce3b7d7f934cdfee5a</anchor>
      <arglist>(double x, double y, double z)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::Histogram</name>
    <filename>structdg_1_1_histogram.html</filename>
    <templarg></templarg>
    <member kind="function">
      <type></type>
      <name>Histogram</name>
      <anchorfile>structdg_1_1_histogram.html</anchorfile>
      <anchor>ac5111e3519dc62ea32ff68e1de7eaebf</anchor>
      <arglist>(const dg::Grid1d&lt; double &gt; &amp;g1d, const std::vector&lt; double &gt; &amp;in)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>binwidth</name>
      <anchorfile>structdg_1_1_histogram.html</anchorfile>
      <anchor>a41da837ab831cd709ccb49390163b407</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1_histogram.html</anchorfile>
      <anchor>ae34a37fd52249593abbf0482b583d7c5</anchor>
      <arglist>(double x)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::Histogram2D</name>
    <filename>structdg_1_1_histogram2_d.html</filename>
    <templarg></templarg>
    <member kind="function">
      <type></type>
      <name>Histogram2D</name>
      <anchorfile>structdg_1_1_histogram2_d.html</anchorfile>
      <anchor>ad80ad774890b779e339151e6c79574e2</anchor>
      <arglist>(const dg::Grid2d&lt; double &gt; &amp;g2d, const std::vector&lt; double &gt; &amp;inx, const std::vector&lt; double &gt; &amp;iny)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1_histogram2_d.html</anchorfile>
      <anchor>ae442645862b8112c7cc34bd3c2bfc047</anchor>
      <arglist>(double x, double y)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::Helmholtz</name>
    <filename>structdg_1_1_helmholtz.html</filename>
    <templarg></templarg>
    <templarg></templarg>
    <templarg></templarg>
    <member kind="function">
      <type></type>
      <name>Helmholtz</name>
      <anchorfile>group__matrixoperators.html</anchorfile>
      <anchor>ga76ec5eaa2cc3dd1ef9b0c90f8a85fd6c</anchor>
      <arglist>(const Grid &amp;g, double alpha=1., direction dir=dg::forward)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Helmholtz</name>
      <anchorfile>group__matrixoperators.html</anchorfile>
      <anchor>ga5a2fc2f7c83288c951b5a938d8cacd85</anchor>
      <arglist>(const Grid &amp;g, bc bcx, bc bcy, double alpha=1., direction dir=dg::forward)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>symv</name>
      <anchorfile>group__matrixoperators.html</anchorfile>
      <anchor>ga3f5c52b98883ecc88056b3f82030f548</anchor>
      <arglist>(Vector &amp;x, Vector &amp;y)</arglist>
    </member>
    <member kind="function">
      <type>const Preconditioner &amp;</type>
      <name>weights</name>
      <anchorfile>group__matrixoperators.html</anchorfile>
      <anchor>gaa999c6af019581113bde43dd67cacc44</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>const Preconditioner &amp;</type>
      <name>precond</name>
      <anchorfile>group__matrixoperators.html</anchorfile>
      <anchor>ga42af8edcfc2def422a545c6fe950dbfc</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>double &amp;</type>
      <name>alpha</name>
      <anchorfile>group__matrixoperators.html</anchorfile>
      <anchor>ga7fceb7f2dbaf51df5941643f33f1f8a6</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>alpha</name>
      <anchorfile>group__matrixoperators.html</anchorfile>
      <anchor>ga59320b5e0dd00f8e5a7c49c880912d60</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_chi</name>
      <anchorfile>group__matrixoperators.html</anchorfile>
      <anchor>gac95fce512bf66491a2235d589148a64a</anchor>
      <arglist>(const Vector &amp;chi)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>reset_chi</name>
      <anchorfile>group__matrixoperators.html</anchorfile>
      <anchor>gaf76f445d7887289a03f0e48ed42c2a3d</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const Vector &amp;</type>
      <name>chi</name>
      <anchorfile>group__matrixoperators.html</anchorfile>
      <anchor>gaf8330683e97b34392b998695d33f13ba</anchor>
      <arglist>()</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::AB</name>
    <filename>structdg_1_1_a_b.html</filename>
    <templarg>k</templarg>
    <templarg></templarg>
    <member kind="function">
      <type></type>
      <name>AB</name>
      <anchorfile>structdg_1_1_a_b.html</anchorfile>
      <anchor>a7334cb5aa3f4b596ecb54148264f2569</anchor>
      <arglist>(const Vector &amp;copyable)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>init</name>
      <anchorfile>structdg_1_1_a_b.html</anchorfile>
      <anchor>a2d1c81ab60c6528f4c71852ea383f707</anchor>
      <arglist>(Functor &amp;f, const Vector &amp;u0, double dt)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1_a_b.html</anchorfile>
      <anchor>a7cb49f139538a4620df7f689815a485d</anchor>
      <arglist>(Functor &amp;f, Vector &amp;u)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::Karniadakis</name>
    <filename>structdg_1_1_karniadakis.html</filename>
    <templarg></templarg>
    <member kind="function">
      <type></type>
      <name>Karniadakis</name>
      <anchorfile>structdg_1_1_karniadakis.html</anchorfile>
      <anchor>ae8a8dbf53c366e472ef172de06b12f83</anchor>
      <arglist>(const Vector &amp;copyable, unsigned max_iter, double eps)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>init</name>
      <anchorfile>structdg_1_1_karniadakis.html</anchorfile>
      <anchor>a3ca17d71a6074b2f7ca8f6e4f48f99e9</anchor>
      <arglist>(Functor &amp;f, LinearOp &amp;diff, const Vector &amp;u0, double dt)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1_karniadakis.html</anchorfile>
      <anchor>a84f10f1572bc1319b97315a3d710ab0b</anchor>
      <arglist>(Functor &amp;f, LinearOp &amp;diff, Vector &amp;u)</arglist>
    </member>
    <member kind="function">
      <type>const Vector &amp;</type>
      <name>head</name>
      <anchorfile>structdg_1_1_karniadakis.html</anchorfile>
      <anchor>adfce7b22810fa973c4baa31525278770</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>const Vector &amp;</type>
      <name>last</name>
      <anchorfile>structdg_1_1_karniadakis.html</anchorfile>
      <anchor>abc9068a1ad218f7dcc9d0663555af55b</anchor>
      <arglist>() const </arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::SIRK</name>
    <filename>structdg_1_1_s_i_r_k.html</filename>
    <templarg></templarg>
    <member kind="function">
      <type></type>
      <name>SIRK</name>
      <anchorfile>structdg_1_1_s_i_r_k.html</anchorfile>
      <anchor>a49a92efeaf2cd379a821e0642d73db9b</anchor>
      <arglist>(const Vector &amp;copyable, unsigned max_iter, double eps)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1_s_i_r_k.html</anchorfile>
      <anchor>a8a88353bfe5754bee28b02748dc63bb4</anchor>
      <arglist>(Explicit &amp;f, Imp &amp;g, const Vector &amp;u0, Vector &amp;u1, double dt)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>adaptive_step</name>
      <anchorfile>structdg_1_1_s_i_r_k.html</anchorfile>
      <anchor>a01757c756e22e533e871286f91672a5a</anchor>
      <arglist>(Explicit &amp;f, Imp &amp;g, const Vector &amp;u0, Vector &amp;u1, double &amp;dt, double tolerance)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::Ooops</name>
    <filename>structdg_1_1_ooops.html</filename>
    <member kind="function">
      <type></type>
      <name>Ooops</name>
      <anchorfile>structdg_1_1_ooops.html</anchorfile>
      <anchor>a4fba660ab313026fb5dbb826385874dc</anchor>
      <arglist>(const char *c)</arglist>
    </member>
    <member kind="function">
      <type>char const *</type>
      <name>what</name>
      <anchorfile>structdg_1_1_ooops.html</anchorfile>
      <anchor>a64c09cc1f58ed6407c98122dcb3dd567</anchor>
      <arglist>() const </arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>dg::KeineNST_1D</name>
    <filename>classdg_1_1_keine_n_s_t__1_d.html</filename>
    <member kind="function">
      <type></type>
      <name>KeineNST_1D</name>
      <anchorfile>classdg_1_1_keine_n_s_t__1_d.html</anchorfile>
      <anchor>a1cb65bbd2b61ad62a656f1e1fc569600</anchor>
      <arglist>(double x_min, double x_max)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>anzeigen</name>
      <anchorfile>classdg_1_1_keine_n_s_t__1_d.html</anchorfile>
      <anchor>ab9089e775ecb1a2a2d13aab1e5e47b20</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>char const *</type>
      <name>what</name>
      <anchorfile>classdg_1_1_keine_n_s_t__1_d.html</anchorfile>
      <anchor>a8a73e92fc1cc11af08cb2da266ccdcaf</anchor>
      <arglist>() const </arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::Poisson</name>
    <filename>structdg_1_1_poisson.html</filename>
    <templarg></templarg>
    <templarg></templarg>
    <member kind="function">
      <type></type>
      <name>Poisson</name>
      <anchorfile>structdg_1_1_poisson.html</anchorfile>
      <anchor>a9d05425969806b3e32ced184efb07209</anchor>
      <arglist>(const Grid &amp;g)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Poisson</name>
      <anchorfile>structdg_1_1_poisson.html</anchorfile>
      <anchor>abad7fc6e4aa73ad7004e6895821395f8</anchor>
      <arglist>(const Grid &amp;g, bc bcx, bc bcy)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Poisson</name>
      <anchorfile>structdg_1_1_poisson.html</anchorfile>
      <anchor>a5a06c1b0627b5691634667f3913ec04f</anchor>
      <arglist>(const Grid &amp;g, bc bcxlhs, bc bcylhs, bc bcxrhs, bc bcyrhs)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1_poisson.html</anchorfile>
      <anchor>a436cea4bbf782e872e31db7fd922ff3d</anchor>
      <arglist>(container &amp;lhs, container &amp;rhs, container &amp;result)</arglist>
    </member>
    <member kind="function">
      <type>const Matrix &amp;</type>
      <name>dxlhs</name>
      <anchorfile>structdg_1_1_poisson.html</anchorfile>
      <anchor>a82faeacbd8a78bec7d51542481c0e994</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const Matrix &amp;</type>
      <name>dylhs</name>
      <anchorfile>structdg_1_1_poisson.html</anchorfile>
      <anchor>a58b4e644b217e1fac0c1d6411ca02312</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const Matrix &amp;</type>
      <name>dxrhs</name>
      <anchorfile>structdg_1_1_poisson.html</anchorfile>
      <anchor>a92cfd99de07a6b82956e7ee7d0c685b5</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const Matrix &amp;</type>
      <name>dyrhs</name>
      <anchorfile>structdg_1_1_poisson.html</anchorfile>
      <anchor>af712507150681dd8a78eb91676be705b</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>variationRHS</name>
      <anchorfile>structdg_1_1_poisson.html</anchorfile>
      <anchor>adf321b9c9e29d3a110d95ef382b771bd</anchor>
      <arglist>(container &amp;phi, container &amp;varphi)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>bracketS</name>
      <anchorfile>structdg_1_1_poisson.html</anchorfile>
      <anchor>a80fee7f21e899ac8893837a750a274b0</anchor>
      <arglist>(container &amp;lhs, container &amp;rhs, container &amp;result)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::rk_coeff</name>
    <filename>structdg_1_1rk__coeff.html</filename>
    <templarg>k</templarg>
    <member kind="variable" static="yes">
      <type>static const double</type>
      <name>alpha</name>
      <anchorfile>structdg_1_1rk__coeff.html</anchorfile>
      <anchor>a23c2aa1eeb057a2cccd29d586d787afa</anchor>
      <arglist>[k][k]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const double</type>
      <name>beta</name>
      <anchorfile>structdg_1_1rk__coeff.html</anchorfile>
      <anchor>ab4f695515e6baecffd138cbe457f7fa0</anchor>
      <arglist>[k]</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::RK</name>
    <filename>structdg_1_1_r_k.html</filename>
    <templarg>k</templarg>
    <templarg>Vector</templarg>
    <member kind="function">
      <type></type>
      <name>RK</name>
      <anchorfile>structdg_1_1_r_k.html</anchorfile>
      <anchor>a6c429247370a3e14d0b818dc9c486b6b</anchor>
      <arglist>(const Vector &amp;copyable)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1_r_k.html</anchorfile>
      <anchor>a1e4a116d7fb767a76e725a6dfe4b98c1</anchor>
      <arglist>(Functor &amp;f, const Vector &amp;u0, Vector &amp;u1, double dt)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::NotANumber</name>
    <filename>structdg_1_1_not_a_number.html</filename>
    <member kind="function">
      <type></type>
      <name>NotANumber</name>
      <anchorfile>structdg_1_1_not_a_number.html</anchorfile>
      <anchor>a7d030a378e263935212063aed1bfec1a</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>char const *</type>
      <name>what</name>
      <anchorfile>structdg_1_1_not_a_number.html</anchorfile>
      <anchor>ae267515bfe4129ea36ea4ebb561c3cf3</anchor>
      <arglist>() const </arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>dg::blas1</name>
    <filename>namespacedg_1_1blas1.html</filename>
    <member kind="function">
      <type>VectorTraits&lt; Vector &gt;::value_type</type>
      <name>dot</name>
      <anchorfile>group__blas1.html</anchorfile>
      <anchor>gade540580ce83e615dcb8e2210689bb32</anchor>
      <arglist>(const Vector &amp;x, const Vector &amp;y)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>axpby</name>
      <anchorfile>group__blas1.html</anchorfile>
      <anchor>ga6ee5b940147ba6b71e1fe1fc538e9459</anchor>
      <arglist>(typename VectorTraits&lt; Vector &gt;::value_type alpha, const Vector &amp;x, typename VectorTraits&lt; Vector &gt;::value_type beta, Vector &amp;y)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>axpby</name>
      <anchorfile>group__blas1.html</anchorfile>
      <anchor>ga24d1c58804538649f88ebafd65c2845b</anchor>
      <arglist>(typename VectorTraits&lt; Vector &gt;::value_type alpha, const Vector &amp;x, typename VectorTraits&lt; Vector &gt;::value_type beta, const Vector &amp;y, Vector &amp;result)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>transform</name>
      <anchorfile>group__blas1.html</anchorfile>
      <anchor>gace34b2c8e27a5173cb25db0542089c2c</anchor>
      <arglist>(const Vector &amp;x, Vector &amp;y, UnaryOp op)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>scal</name>
      <anchorfile>group__blas1.html</anchorfile>
      <anchor>ga9287f21c8d97b7d4d77b0353cf5b56b2</anchor>
      <arglist>(Vector &amp;x, typename VectorTraits&lt; Vector &gt;::value_type alpha)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>pointwiseDot</name>
      <anchorfile>group__blas1.html</anchorfile>
      <anchor>ga2939c008737a653c8ea3aa972cac136b</anchor>
      <arglist>(const Vector &amp;x1, const Vector &amp;x2, Vector &amp;y)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>pointwiseDivide</name>
      <anchorfile>group__blas1.html</anchorfile>
      <anchor>ga451523cc2d3740676888ce0b14cb8509</anchor>
      <arglist>(const Vector &amp;x1, const Vector &amp;x2, Vector &amp;y)</arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>dg::blas2</name>
    <filename>namespacedg_1_1blas2.html</filename>
    <member kind="function">
      <type>MatrixTraits&lt; Matrix &gt;::value_type</type>
      <name>dot</name>
      <anchorfile>group__blas2.html</anchorfile>
      <anchor>gaeb8a93cac85646f2173160afd2a79d53</anchor>
      <arglist>(const Vector &amp;x, const Matrix &amp;m, const Vector &amp;y)</arglist>
    </member>
    <member kind="function">
      <type>MatrixTraits&lt; Matrix &gt;::value_type</type>
      <name>dot</name>
      <anchorfile>group__blas2.html</anchorfile>
      <anchor>gac72ec781ca79b3b983099ea172f896ab</anchor>
      <arglist>(const Matrix &amp;m, const Vector &amp;x)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>symv</name>
      <anchorfile>group__blas2.html</anchorfile>
      <anchor>ga7f66ae102c9c093cdc0877a989fd82b3</anchor>
      <arglist>(typename MatrixTraits&lt; Precon &gt;::value_type alpha, const Precon &amp;P, const Vector &amp;x, typename MatrixTraits&lt; Precon &gt;::value_type beta, Vector &amp;y)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>symv</name>
      <anchorfile>group__blas2.html</anchorfile>
      <anchor>ga268c50e488c18db3dc5be1d1934eb7b2</anchor>
      <arglist>(Matrix &amp;m, Vector1 &amp;x, Vector2 &amp;y)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>gemv</name>
      <anchorfile>group__blas2.html</anchorfile>
      <anchor>gadda8a3d0278c095d51becf208760d49b</anchor>
      <arglist>(Matrix &amp;m, Vector1 &amp;x, Vector2 &amp;y)</arglist>
    </member>
  </compound>
  <compound kind="dir">
    <name>/home/matthias/Projekte/feltor/inc/dg</name>
    <path>/home/matthias/Projekte/feltor/inc/dg/</path>
    <filename>dir_cba352cc187f01702d3926d435723909.html</filename>
    <file>algorithm.h</file>
    <file>arakawa.h</file>
    <file>blas.h</file>
    <file>blas1.h</file>
    <file>blas2.h</file>
    <file>cg.h</file>
    <file>dg_doc.h</file>
    <file>dz.h</file>
    <file>elliptic.h</file>
    <file>enums.h</file>
    <file>exceptions.h</file>
    <file>functors.h</file>
    <file>helmholtz.h</file>
    <file>multistep.h</file>
    <file>nullstelle.h</file>
    <file>poisson.h</file>
    <file>runge_kutta.h</file>
    <file>test.cuh</file>
    <file>toefl.cuh</file>
  </compound>
  <compound kind="dir">
    <name>/home/matthias/Projekte/feltor/inc</name>
    <path>/home/matthias/Projekte/feltor/inc/</path>
    <filename>dir_bfccd401955b95cf8c75461437045ac0.html</filename>
    <dir>/home/matthias/Projekte/feltor/inc/dg</dir>
  </compound>
  <compound kind="page">
    <name>index</name>
    <title></title>
    <filename>index</filename>
  </compound>
</tagfile>
