<?xml version='1.0' encoding='UTF-8' standalone='yes' ?>
<tagfile>
  <compound kind="file">
    <name>geom_parameters.h</name>
    <path>/home/matthias/feltor/src/solovev/</path>
    <filename>geom__parameters_8h</filename>
    <class kind="struct">solovev::GeomParameters</class>
    <namespace>solovev</namespace>
  </compound>
  <compound kind="file">
    <name>geometry.h</name>
    <path>/home/matthias/feltor/src/solovev/</path>
    <filename>geometry_8h</filename>
    <includes id="geom__parameters_8h" name="geom_parameters.h" local="yes" imported="no">geom_parameters.h</includes>
    <class kind="struct">solovev::Psip</class>
    <class kind="struct">solovev::PsipR</class>
    <class kind="struct">solovev::PsipRR</class>
    <class kind="struct">solovev::PsipZ</class>
    <class kind="struct">solovev::PsipZZ</class>
    <class kind="struct">solovev::PsipRZ</class>
    <class kind="struct">solovev::Ipol</class>
    <class kind="struct">solovev::InvB</class>
    <class kind="struct">solovev::LnB</class>
    <class kind="struct">solovev::BR</class>
    <class kind="struct">solovev::BZ</class>
    <class kind="struct">solovev::CurvatureR</class>
    <class kind="struct">solovev::CurvatureZ</class>
    <class kind="struct">solovev::GradLnB</class>
    <class kind="struct">solovev::Field</class>
    <class kind="struct">solovev::FieldP</class>
    <class kind="struct">solovev::FieldR</class>
    <class kind="struct">solovev::FieldZ</class>
    <class kind="struct">solovev::BHatR</class>
    <class kind="struct">solovev::BHatZ</class>
    <class kind="struct">solovev::BHatP</class>
    <class kind="struct">solovev::DeltaFunction</class>
    <class kind="struct">solovev::FluxSurfaceAverage</class>
    <class kind="struct">solovev::SafetyFactor</class>
    <class kind="struct">solovev::Alpha</class>
    <namespace>solovev</namespace>
  </compound>
  <compound kind="file">
    <name>init.h</name>
    <path>/home/matthias/feltor/src/solovev/</path>
    <filename>init_8h</filename>
    <includes id="geometry_8h" name="geometry.h" local="yes" imported="no">geometry.h</includes>
    <class kind="struct">solovev::Iris</class>
    <class kind="struct">solovev::Pupil</class>
    <class kind="struct">solovev::PsiPupil</class>
    <class kind="struct">solovev::PsiLimiter</class>
    <class kind="struct">solovev::GaussianDamping</class>
    <class kind="struct">solovev::GaussianProfDamping</class>
    <class kind="struct">solovev::GaussianProfXDamping</class>
    <class kind="struct">solovev::TanhSource</class>
    <class kind="struct">solovev::TestFunction</class>
    <class kind="struct">solovev::DeriTestFunction</class>
    <namespace>solovev</namespace>
  </compound>
  <compound kind="group">
    <name>geom</name>
    <title>The field line geometry</title>
    <filename>group__geom.html</filename>
    <class kind="struct">solovev::GeomParameters</class>
    <class kind="struct">solovev::Psip</class>
    <class kind="struct">solovev::PsipR</class>
    <class kind="struct">solovev::PsipRR</class>
    <class kind="struct">solovev::PsipZ</class>
    <class kind="struct">solovev::PsipZZ</class>
    <class kind="struct">solovev::PsipRZ</class>
    <class kind="struct">solovev::Ipol</class>
    <class kind="struct">solovev::InvB</class>
    <class kind="struct">solovev::LnB</class>
    <class kind="struct">solovev::BR</class>
    <class kind="struct">solovev::BZ</class>
    <class kind="struct">solovev::CurvatureR</class>
    <class kind="struct">solovev::CurvatureZ</class>
    <class kind="struct">solovev::GradLnB</class>
    <class kind="struct">solovev::Field</class>
    <class kind="struct">solovev::FieldP</class>
    <class kind="struct">solovev::FieldR</class>
    <class kind="struct">solovev::FieldZ</class>
    <class kind="struct">solovev::BHatR</class>
    <class kind="struct">solovev::BHatZ</class>
    <class kind="struct">solovev::BHatP</class>
    <class kind="struct">solovev::DeltaFunction</class>
    <class kind="struct">solovev::FluxSurfaceAverage</class>
    <class kind="struct">solovev::SafetyFactor</class>
    <class kind="struct">solovev::Alpha</class>
    <class kind="struct">solovev::Iris</class>
    <class kind="struct">solovev::Pupil</class>
    <class kind="struct">solovev::PsiPupil</class>
    <class kind="struct">solovev::PsiLimiter</class>
    <class kind="struct">solovev::GaussianDamping</class>
    <class kind="struct">solovev::GaussianProfDamping</class>
    <class kind="struct">solovev::GaussianProfXDamping</class>
    <class kind="struct">solovev::TanhSource</class>
    <class kind="struct">solovev::TestFunction</class>
    <class kind="struct">solovev::DeriTestFunction</class>
    <member kind="function">
      <type></type>
      <name>GeomParameters</name>
      <anchorfile>group__geom.html</anchorfile>
      <anchor>ga33f43196e4cf4e85bd9640ba62d9230a</anchor>
      <arglist>(const std::vector&lt; double &gt; &amp;v)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>display</name>
      <anchorfile>group__geom.html</anchorfile>
      <anchor>gac75127cc87f46a3a5b05ef2304a85fdd</anchor>
      <arglist>(std::ostream &amp;os=std::cout) const </arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>solver</name>
    <title>The solver</title>
    <filename>group__solver.html</filename>
  </compound>
  <compound kind="namespace">
    <name>solovev</name>
    <filename>namespacesolovev.html</filename>
    <class kind="struct">solovev::GeomParameters</class>
    <class kind="struct">solovev::Psip</class>
    <class kind="struct">solovev::PsipR</class>
    <class kind="struct">solovev::PsipRR</class>
    <class kind="struct">solovev::PsipZ</class>
    <class kind="struct">solovev::PsipZZ</class>
    <class kind="struct">solovev::PsipRZ</class>
    <class kind="struct">solovev::Ipol</class>
    <class kind="struct">solovev::InvB</class>
    <class kind="struct">solovev::LnB</class>
    <class kind="struct">solovev::BR</class>
    <class kind="struct">solovev::BZ</class>
    <class kind="struct">solovev::CurvatureR</class>
    <class kind="struct">solovev::CurvatureZ</class>
    <class kind="struct">solovev::GradLnB</class>
    <class kind="struct">solovev::Field</class>
    <class kind="struct">solovev::FieldP</class>
    <class kind="struct">solovev::FieldR</class>
    <class kind="struct">solovev::FieldZ</class>
    <class kind="struct">solovev::BHatR</class>
    <class kind="struct">solovev::BHatZ</class>
    <class kind="struct">solovev::BHatP</class>
    <class kind="struct">solovev::DeltaFunction</class>
    <class kind="struct">solovev::FluxSurfaceAverage</class>
    <class kind="struct">solovev::SafetyFactor</class>
    <class kind="struct">solovev::Alpha</class>
    <class kind="struct">solovev::Iris</class>
    <class kind="struct">solovev::Pupil</class>
    <class kind="struct">solovev::PsiPupil</class>
    <class kind="struct">solovev::PsiLimiter</class>
    <class kind="struct">solovev::GaussianDamping</class>
    <class kind="struct">solovev::GaussianProfDamping</class>
    <class kind="struct">solovev::GaussianProfXDamping</class>
    <class kind="struct">solovev::TanhSource</class>
    <class kind="struct">solovev::TestFunction</class>
    <class kind="struct">solovev::DeriTestFunction</class>
  </compound>
  <compound kind="struct">
    <name>solovev::GeomParameters</name>
    <filename>structsolovev_1_1_geom_parameters.html</filename>
    <member kind="function">
      <type></type>
      <name>GeomParameters</name>
      <anchorfile>group__geom.html</anchorfile>
      <anchor>ga33f43196e4cf4e85bd9640ba62d9230a</anchor>
      <arglist>(const std::vector&lt; double &gt; &amp;v)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>display</name>
      <anchorfile>group__geom.html</anchorfile>
      <anchor>gac75127cc87f46a3a5b05ef2304a85fdd</anchor>
      <arglist>(std::ostream &amp;os=std::cout) const </arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>solovev::Psip</name>
    <filename>structsolovev_1_1_psip.html</filename>
    <member kind="function">
      <type>double</type>
      <name>operator()</name>
      <anchorfile>structsolovev_1_1_psip.html</anchorfile>
      <anchor>a6079b6a7c9ea5a5d6bbf4b65dd9d8dde</anchor>
      <arglist>(double R, double Z)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>solovev::PsipR</name>
    <filename>structsolovev_1_1_psip_r.html</filename>
    <member kind="function">
      <type>double</type>
      <name>psipR_alt</name>
      <anchorfile>structsolovev_1_1_psip_r.html</anchorfile>
      <anchor>a3e0c01279dcb1f26013cd8f50903ca2e</anchor>
      <arglist>(double R, double Z)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>solovev::PsipRR</name>
    <filename>structsolovev_1_1_psip_r_r.html</filename>
    <member kind="function">
      <type>double</type>
      <name>operator()</name>
      <anchorfile>structsolovev_1_1_psip_r_r.html</anchorfile>
      <anchor>ade58b2aebe56979d740b1e8e1645b779</anchor>
      <arglist>(double R, double Z)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>solovev::PsipZ</name>
    <filename>structsolovev_1_1_psip_z.html</filename>
    <member kind="function">
      <type>double</type>
      <name>psipZ_alt</name>
      <anchorfile>structsolovev_1_1_psip_z.html</anchorfile>
      <anchor>aff69e7f70ddf400c832f63c7a19b7186</anchor>
      <arglist>(double R, double Z)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>solovev::PsipZZ</name>
    <filename>structsolovev_1_1_psip_z_z.html</filename>
    <member kind="function">
      <type>double</type>
      <name>operator()</name>
      <anchorfile>structsolovev_1_1_psip_z_z.html</anchorfile>
      <anchor>aee49e53656604a30914dc82426d26c47</anchor>
      <arglist>(double R, double Z)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>solovev::PsipRZ</name>
    <filename>structsolovev_1_1_psip_r_z.html</filename>
    <member kind="function">
      <type>double</type>
      <name>operator()</name>
      <anchorfile>structsolovev_1_1_psip_r_z.html</anchorfile>
      <anchor>a93021f5c1d733da732156ccd0437b4ee</anchor>
      <arglist>(double R, double Z)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>solovev::Ipol</name>
    <filename>structsolovev_1_1_ipol.html</filename>
    <member kind="function">
      <type>double</type>
      <name>operator()</name>
      <anchorfile>structsolovev_1_1_ipol.html</anchorfile>
      <anchor>ac7f62f21fe31980c090c758ddb3546be</anchor>
      <arglist>(double R, double Z)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>solovev::InvB</name>
    <filename>structsolovev_1_1_inv_b.html</filename>
    <member kind="function">
      <type>double</type>
      <name>operator()</name>
      <anchorfile>structsolovev_1_1_inv_b.html</anchorfile>
      <anchor>a6a4886f03129ef2d86201ef93cf770cc</anchor>
      <arglist>(double R, double Z)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>solovev::LnB</name>
    <filename>structsolovev_1_1_ln_b.html</filename>
    <member kind="function">
      <type>double</type>
      <name>operator()</name>
      <anchorfile>structsolovev_1_1_ln_b.html</anchorfile>
      <anchor>abb3f660d8d54b1e8137a817b103929fa</anchor>
      <arglist>(double R, double Z)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>solovev::BR</name>
    <filename>structsolovev_1_1_b_r.html</filename>
    <member kind="function">
      <type>double</type>
      <name>operator()</name>
      <anchorfile>structsolovev_1_1_b_r.html</anchorfile>
      <anchor>a2b3d726869082bb8508edff7ad4d6939</anchor>
      <arglist>(double R, double Z)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>solovev::BZ</name>
    <filename>structsolovev_1_1_b_z.html</filename>
    <member kind="function">
      <type>double</type>
      <name>operator()</name>
      <anchorfile>structsolovev_1_1_b_z.html</anchorfile>
      <anchor>af0affe6814923f166fcfb86ee81d169b</anchor>
      <arglist>(double R, double Z)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>solovev::CurvatureR</name>
    <filename>structsolovev_1_1_curvature_r.html</filename>
    <member kind="function">
      <type>double</type>
      <name>operator()</name>
      <anchorfile>structsolovev_1_1_curvature_r.html</anchorfile>
      <anchor>a47ced9a9b5b11240c310f75842b99c1a</anchor>
      <arglist>(double R, double Z)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>solovev::CurvatureZ</name>
    <filename>structsolovev_1_1_curvature_z.html</filename>
    <member kind="function">
      <type>double</type>
      <name>operator()</name>
      <anchorfile>structsolovev_1_1_curvature_z.html</anchorfile>
      <anchor>af3b12dd9d9b4f2ff689fe732075ec5f9</anchor>
      <arglist>(double R, double Z)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>solovev::GradLnB</name>
    <filename>structsolovev_1_1_grad_ln_b.html</filename>
    <member kind="function">
      <type>double</type>
      <name>operator()</name>
      <anchorfile>structsolovev_1_1_grad_ln_b.html</anchorfile>
      <anchor>a8233010d792cc270d54367e81d369a53</anchor>
      <arglist>(double R, double Z)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>solovev::Field</name>
    <filename>structsolovev_1_1_field.html</filename>
    <member kind="function">
      <type>void</type>
      <name>operator()</name>
      <anchorfile>structsolovev_1_1_field.html</anchorfile>
      <anchor>ac597f776e803b07f473bbbca93370eeb</anchor>
      <arglist>(const std::vector&lt; dg::HVec &gt; &amp;y, std::vector&lt; dg::HVec &gt; &amp;yp)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator()</name>
      <anchorfile>structsolovev_1_1_field.html</anchorfile>
      <anchor>a4e57961339228e02bb741c9817aa7f99</anchor>
      <arglist>(const dg::HVec &amp;y, dg::HVec &amp;yp)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>operator()</name>
      <anchorfile>structsolovev_1_1_field.html</anchorfile>
      <anchor>a70180a0878cb37e8843427a2c3e7053a</anchor>
      <arglist>(double R, double Z)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>solovev::FieldP</name>
    <filename>structsolovev_1_1_field_p.html</filename>
  </compound>
  <compound kind="struct">
    <name>solovev::FieldR</name>
    <filename>structsolovev_1_1_field_r.html</filename>
  </compound>
  <compound kind="struct">
    <name>solovev::FieldZ</name>
    <filename>structsolovev_1_1_field_z.html</filename>
  </compound>
  <compound kind="struct">
    <name>solovev::BHatR</name>
    <filename>structsolovev_1_1_b_hat_r.html</filename>
  </compound>
  <compound kind="struct">
    <name>solovev::BHatZ</name>
    <filename>structsolovev_1_1_b_hat_z.html</filename>
  </compound>
  <compound kind="struct">
    <name>solovev::BHatP</name>
    <filename>structsolovev_1_1_b_hat_p.html</filename>
  </compound>
  <compound kind="struct">
    <name>solovev::DeltaFunction</name>
    <filename>structsolovev_1_1_delta_function.html</filename>
  </compound>
  <compound kind="struct">
    <name>solovev::FluxSurfaceAverage</name>
    <filename>structsolovev_1_1_flux_surface_average.html</filename>
    <templarg></templarg>
    <member kind="function">
      <type></type>
      <name>FluxSurfaceAverage</name>
      <anchorfile>structsolovev_1_1_flux_surface_average.html</anchorfile>
      <anchor>a2f79d67265e3dc31851a156d18c41f8d</anchor>
      <arglist>(const dg::Grid2d&lt; double &gt; &amp;g2d, GeomParameters gp, const container &amp;f)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>operator()</name>
      <anchorfile>structsolovev_1_1_flux_surface_average.html</anchorfile>
      <anchor>a4f178d26db3f362b63469442cd9cb4c7</anchor>
      <arglist>(double psip0)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>solovev::SafetyFactor</name>
    <filename>structsolovev_1_1_safety_factor.html</filename>
    <templarg></templarg>
    <member kind="function">
      <type></type>
      <name>SafetyFactor</name>
      <anchorfile>structsolovev_1_1_safety_factor.html</anchorfile>
      <anchor>acb29f8d43f9715abfbc392b22399188f</anchor>
      <arglist>(const dg::Grid2d&lt; double &gt; &amp;g2d, GeomParameters gp, const container &amp;f)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>operator()</name>
      <anchorfile>structsolovev_1_1_safety_factor.html</anchorfile>
      <anchor>ad1f873bfa1e8b3bc0f4ce43912666603</anchor>
      <arglist>(double psip0)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>solovev::Alpha</name>
    <filename>structsolovev_1_1_alpha.html</filename>
  </compound>
  <compound kind="struct">
    <name>solovev::Iris</name>
    <filename>structsolovev_1_1_iris.html</filename>
  </compound>
  <compound kind="struct">
    <name>solovev::Pupil</name>
    <filename>structsolovev_1_1_pupil.html</filename>
  </compound>
  <compound kind="struct">
    <name>solovev::PsiPupil</name>
    <filename>structsolovev_1_1_psi_pupil.html</filename>
  </compound>
  <compound kind="struct">
    <name>solovev::PsiLimiter</name>
    <filename>structsolovev_1_1_psi_limiter.html</filename>
  </compound>
  <compound kind="struct">
    <name>solovev::GaussianDamping</name>
    <filename>structsolovev_1_1_gaussian_damping.html</filename>
  </compound>
  <compound kind="struct">
    <name>solovev::GaussianProfDamping</name>
    <filename>structsolovev_1_1_gaussian_prof_damping.html</filename>
  </compound>
  <compound kind="struct">
    <name>solovev::GaussianProfXDamping</name>
    <filename>structsolovev_1_1_gaussian_prof_x_damping.html</filename>
  </compound>
  <compound kind="struct">
    <name>solovev::TanhSource</name>
    <filename>structsolovev_1_1_tanh_source.html</filename>
  </compound>
  <compound kind="struct">
    <name>solovev::TestFunction</name>
    <filename>structsolovev_1_1_test_function.html</filename>
  </compound>
  <compound kind="struct">
    <name>solovev::DeriTestFunction</name>
    <filename>structsolovev_1_1_deri_test_function.html</filename>
  </compound>
  <compound kind="dir">
    <name>/home/matthias/feltor/src/solovev</name>
    <path>/home/matthias/feltor/src/solovev/</path>
    <filename>dir_8f48a2c0056d49d88bfa9448067ed2ee.html</filename>
    <file>geom_parameters.h</file>
    <file>geometry.h</file>
    <file>init.h</file>
    <file>solovev_doc.h</file>
  </compound>
  <compound kind="dir">
    <name>/home/matthias/feltor/src</name>
    <path>/home/matthias/feltor/src/</path>
    <filename>dir_68267d1309a1af8e8297ef4c3efbcdba.html</filename>
    <dir>/home/matthias/feltor/src/solovev</dir>
  </compound>
  <compound kind="page">
    <name>index</name>
    <title></title>
    <filename>index</filename>
  </compound>
</tagfile>
