<?xml version='1.0' encoding='UTF-8' standalone='yes' ?>
<tagfile>
  <compound kind="file">
    <name>arakawa.h</name>
    <path>/home/matthias/feltor/inc/toefl/</path>
    <filename>arakawa_8h</filename>
    <includes id="quadmat_8h" name="quadmat.h" local="yes" imported="no">quadmat.h</includes>
    <class kind="class">toefl::Arakawa</class>
    <namespace>toefl</namespace>
    <member kind="function">
      <type>double</type>
      <name>interior</name>
      <anchorfile>namespacetoefl.html</anchorfile>
      <anchor>a530639057348ca226388f927dbe62b24</anchor>
      <arglist>(const size_t i0, const size_t j0, const M &amp;lhs, const M &amp;rhs)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>boundary</name>
      <anchorfile>namespacetoefl.html</anchorfile>
      <anchor>a305a5de24dad48e37df372fd7432afae</anchor>
      <arglist>(const size_t i0, const size_t j0, const M &amp;lhs, const M &amp;rhs)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>fft.h</name>
    <path>/home/matthias/feltor/inc/toefl/</path>
    <filename>fft_8h</filename>
    <includes id="message_8h" name="message.h" local="yes" imported="no">message.h</includes>
    <namespace>toefl</namespace>
    <member kind="function">
      <type>fftw_complex *</type>
      <name>fftw_cast</name>
      <anchorfile>group__fftw.html</anchorfile>
      <anchor>gae4e8f829512f124858cf7d0f9534af1f</anchor>
      <arglist>(double *const ptr)</arglist>
    </member>
    <member kind="function">
      <type>fftw_complex *</type>
      <name>fftw_cast</name>
      <anchorfile>group__fftw.html</anchorfile>
      <anchor>gacc41a17df6da4376093f9ef1d7fb7885</anchor>
      <arglist>(std::complex&lt; double &gt; *const ptr)</arglist>
    </member>
    <member kind="function">
      <type>fftw_r2r_kind</type>
      <name>inverse_kind</name>
      <anchorfile>group__fftw.html</anchorfile>
      <anchor>ga953727532d54b2a5e828427b1560971b</anchor>
      <arglist>(fftw_r2r_kind kind)</arglist>
    </member>
    <member kind="function">
      <type>fftw_plan</type>
      <name>plan_drt_1d</name>
      <anchorfile>group__fftw.html</anchorfile>
      <anchor>ga6cffae397935b18058b704d8e59a459e</anchor>
      <arglist>(const size_t rows, const size_t cols, double *in, double *out, const fftw_r2r_kind kind, const unsigned flags)</arglist>
    </member>
    <member kind="function">
      <type>fftw_plan</type>
      <name>plan_transpose</name>
      <anchorfile>group__fftw.html</anchorfile>
      <anchor>ga0b987de90d25ec636234952be30de6ec</anchor>
      <arglist>(const size_t rows, const size_t cols, double *in, double *out, const unsigned flags)</arglist>
    </member>
    <member kind="function">
      <type>fftw_plan</type>
      <name>plan_transpose</name>
      <anchorfile>group__fftw.html</anchorfile>
      <anchor>gac2de76c9b32737ddf89ca75bacd139bd</anchor>
      <arglist>(const size_t rows, const size_t cols, fftw_complex *in, fftw_complex *out, const unsigned flags)</arglist>
    </member>
    <member kind="function">
      <type>fftw_plan</type>
      <name>plan_dft_1d_r2c</name>
      <anchorfile>group__fftw.html</anchorfile>
      <anchor>gac14e1291ac986588c3ecd23de2a58406</anchor>
      <arglist>(const size_t real_rows, const size_t real_cols, double *in, fftw_complex *out, const unsigned flags)</arglist>
    </member>
    <member kind="function">
      <type>fftw_plan</type>
      <name>plan_dft_1d_c2r</name>
      <anchorfile>group__fftw.html</anchorfile>
      <anchor>gaa2189b45074e1d35b640dcc98767ef8a</anchor>
      <arglist>(const size_t real_rows, const size_t real_cols, fftw_complex *in, double *out, const unsigned flags)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>init.h</name>
    <path>/home/matthias/feltor/inc/toefl/</path>
    <filename>init_8h</filename>
    <class kind="class">toefl::TurbulentBath</class>
    <namespace>toefl</namespace>
    <member kind="function">
      <type>void</type>
      <name>init_gaussian</name>
      <anchorfile>group__utilities.html</anchorfile>
      <anchor>ga0e730c6f07f61a20ea40d7866a5cdb90</anchor>
      <arglist>(M &amp;m, const double x0, const double y0, const double sigma_x, const double sigma_y, const double amplitude)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>init_gaussian_column</name>
      <anchorfile>group__utilities.html</anchorfile>
      <anchor>gaf74f93e3a788741c663d72dc38fa4dd7</anchor>
      <arglist>(M &amp;m, const double x0, const double sigma_x, const double amplitude)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>message.h</name>
    <path>/home/matthias/feltor/inc/toefl/</path>
    <filename>message_8h</filename>
    <class kind="class">toefl::Message</class>
    <namespace>toefl</namespace>
    <member kind="define">
      <type>#define</type>
      <name>_ping_</name>
      <anchorfile>message_8h.html</anchorfile>
      <anchor>a6e389c07f185af0e74ef30554f181593</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>quadmat.h</name>
    <path>/home/matthias/feltor/inc/toefl/</path>
    <filename>quadmat_8h</filename>
    <class kind="class">toefl::QuadMat</class>
    <namespace>toefl</namespace>
    <member kind="function">
      <type>QuadMat&lt; double, n &gt;</type>
      <name>One</name>
      <anchorfile>group__containers.html</anchorfile>
      <anchor>ga6fd3fab40f3226dfd369a330e50f5405</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>QuadMat&lt; double, n &gt;</type>
      <name>Zero</name>
      <anchorfile>group__containers.html</anchorfile>
      <anchor>ga1c8a53ed2642944edfd3f9da59a6f016</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>invert</name>
      <anchorfile>namespacetoefl.html</anchorfile>
      <anchor>ada8d4d0294cb1bcbd6cfd4c46e5f7f4b</anchor>
      <arglist>(const QuadMat&lt; T, 2 &gt; &amp;in, QuadMat&lt; T, 2 &gt; &amp;out)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>invert</name>
      <anchorfile>namespacetoefl.html</anchorfile>
      <anchor>a3e1ac61572f522768b1e9c4bf29d42ef</anchor>
      <arglist>(const QuadMat&lt; T, 3 &gt; &amp;in, QuadMat&lt; T, 3 &gt; &amp;out)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>texture.h</name>
    <path>/home/matthias/feltor/inc/toefl/</path>
    <filename>texture_8h</filename>
    <class kind="struct">toefl::colormap_f</class>
    <class kind="struct">toefl::colormap_ext</class>
    <namespace>toefl</namespace>
    <member kind="typedef">
      <type>struct toefl::colormap_ext</type>
      <name>colormap_ext</name>
      <anchorfile>group__utilities.html</anchorfile>
      <anchor>ga5cbd63c6da2379bd643dc946f43784ed</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>toefl::Matrix&lt; std::array&lt; float, 3 &gt;, toefl::TL_NONE &gt;</type>
      <name>Texture_RGBf</name>
      <anchorfile>group__utilities.html</anchorfile>
      <anchor>ga356c71893774c0fdfb1e26ef1ab9577e</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>colormap_f</type>
      <name>redblue_f</name>
      <anchorfile>group__utilities.html</anchorfile>
      <anchor>gad8d19fbb27bf29fd5131c845ec7ceecb</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>colormap_ext</type>
      <name>redblue_ext</name>
      <anchorfile>group__utilities.html</anchorfile>
      <anchor>ga860335025a878570144953e2dd20adff</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>gentexture_RGBf</name>
      <anchorfile>group__utilities.html</anchorfile>
      <anchor>ga53a0f84e4f5464be844a2dcd08447f48</anchor>
      <arglist>(Texture_RGBf &amp;tex, const M &amp;field, const double maxabs)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>gentexture_RGBf_temp</name>
      <anchorfile>group__utilities.html</anchorfile>
      <anchor>ga78ead2d548e26a1cd8d405aa2764e021</anchor>
      <arglist>(Texture_RGBf &amp;tex, const M &amp;theta, const double ray)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>toefl.h</name>
    <path>/home/matthias/feltor/inc/toefl/</path>
    <filename>toefl_8h</filename>
    <includes id="message_8h" name="message.h" local="yes" imported="no">message.h</includes>
    <includes id="quadmat_8h" name="quadmat.h" local="yes" imported="no">quadmat.h</includes>
    <includes id="arakawa_8h" name="arakawa.h" local="yes" imported="no">arakawa.h</includes>
    <includes id="fft_8h" name="fft.h" local="yes" imported="no">fft.h</includes>
    <includes id="init_8h" name="init.h" local="yes" imported="no">init.h</includes>
    <namespace>toefl</namespace>
    <member kind="function">
      <type>fftw_r2r_kind</type>
      <name>fftw_convert</name>
      <anchorfile>namespacetoefl.html</anchorfile>
      <anchor>a79ed5ffdd8c9fe7aaabda3f8370c0dfd</anchor>
      <arglist>(enum bc bc)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>fftw_normalisation</name>
      <anchorfile>namespacetoefl.html</anchorfile>
      <anchor>aac93b94f880749ff2c5df3eed3140a5a</anchor>
      <arglist>(enum bc bc, unsigned n)</arglist>
    </member>
    <member kind="function">
      <type>fftw_r2r_kind</type>
      <name>fftw_convert</name>
      <anchorfile>namespacetoefl.html</anchorfile>
      <anchor>a79ed5ffdd8c9fe7aaabda3f8370c0dfd</anchor>
      <arglist>(enum bc bc)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>fftw_normalisation</name>
      <anchorfile>namespacetoefl.html</anchorfile>
      <anchor>aac93b94f880749ff2c5df3eed3140a5a</anchor>
      <arglist>(enum bc bc, unsigned n)</arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>TOEFL</name>
    <title>The TOEFL library</title>
    <filename>group___t_o_e_f_l.html</filename>
    <subgroup>containers</subgroup>
    <subgroup>algorithms</subgroup>
    <subgroup>fftw</subgroup>
    <subgroup>utilities</subgroup>
    <subgroup>exceptions</subgroup>
  </compound>
  <compound kind="group">
    <name>containers</name>
    <title>Containers</title>
    <filename>group__containers.html</filename>
    <class kind="class">toefl::GhostMatrix</class>
    <class kind="class">toefl::Matrix</class>
    <class kind="struct">toefl::MatrixArray</class>
    <class kind="class">toefl::QuadMat</class>
    <member kind="enumeration">
      <type></type>
      <name>bc</name>
      <anchorfile>group__containers.html</anchorfile>
      <anchor>ga870c0a2915eead520a3b7b59e26534e3</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>TL_PERIODIC</name>
      <anchorfile>group__containers.html</anchorfile>
      <anchor>gga870c0a2915eead520a3b7b59e26534e3acb6f43c8ecb2e4b6ecb41ea419c98d0c</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>TL_DST00</name>
      <anchorfile>group__containers.html</anchorfile>
      <anchor>gga870c0a2915eead520a3b7b59e26534e3af119d3fbab7b6fefd6071d9ab62ec748</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>TL_DST10</name>
      <anchorfile>group__containers.html</anchorfile>
      <anchor>gga870c0a2915eead520a3b7b59e26534e3af8ef57623f6eb638aaf7dd8ecdeaec1d</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>TL_DST01</name>
      <anchorfile>group__containers.html</anchorfile>
      <anchor>gga870c0a2915eead520a3b7b59e26534e3a30e7049ff2518ef30741b06c6d36a2c8</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>TL_DST11</name>
      <anchorfile>group__containers.html</anchorfile>
      <anchor>gga870c0a2915eead520a3b7b59e26534e3a90df49f6d5d3a38f2cbc67d3cce0da8e</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>Void</name>
      <anchorfile>group__containers.html</anchorfile>
      <anchor>gad5f39f322bf8f232863d5b5eda04749b</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>TL_VOID</name>
      <anchorfile>group__containers.html</anchorfile>
      <anchor>ggad5f39f322bf8f232863d5b5eda04749ba83385206f613ebea4231dd24f821a126</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>Padding</name>
      <anchorfile>group__containers.html</anchorfile>
      <anchor>ga8e7cb091290b8f98cc2a25a7954e0023</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>TL_NONE</name>
      <anchorfile>group__containers.html</anchorfile>
      <anchor>gga8e7cb091290b8f98cc2a25a7954e0023a63f2b99c5fa905c4e5240587b682bacd</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>TL_DFT</name>
      <anchorfile>group__containers.html</anchorfile>
      <anchor>gga8e7cb091290b8f98cc2a25a7954e0023a0b59e46cc6cbf6420f5a069dc01de147</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>TL_DRT_DFT</name>
      <anchorfile>group__containers.html</anchorfile>
      <anchor>gga8e7cb091290b8f98cc2a25a7954e0023ad01ccc5f623ab622a9e1085d490d8ecc</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>QuadMat&lt; double, n &gt;</type>
      <name>One</name>
      <anchorfile>group__containers.html</anchorfile>
      <anchor>ga6fd3fab40f3226dfd369a330e50f5405</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>QuadMat&lt; double, n &gt;</type>
      <name>Zero</name>
      <anchorfile>group__containers.html</anchorfile>
      <anchor>ga1c8a53ed2642944edfd3f9da59a6f016</anchor>
      <arglist>()</arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>algorithms</name>
    <title>Numerical schemes</title>
    <filename>group__algorithms.html</filename>
    <class kind="class">toefl::Arakawa</class>
    <class kind="struct">toefl::Coefficients</class>
    <class kind="class">toefl::Karniadakis</class>
    <member kind="enumeration">
      <type></type>
      <name>stepper</name>
      <anchorfile>group__algorithms.html</anchorfile>
      <anchor>ga81e0bae81de7634620302095a23723d8</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>TL_EULER</name>
      <anchorfile>group__algorithms.html</anchorfile>
      <anchor>gga81e0bae81de7634620302095a23723d8a41b76d0ef62517a0e4cef656dfdc1e0d</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>TL_ORDER2</name>
      <anchorfile>group__algorithms.html</anchorfile>
      <anchor>gga81e0bae81de7634620302095a23723d8aa34795e40a3590c1fccd16e67c98a05c</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>TL_ORDER3</name>
      <anchorfile>group__algorithms.html</anchorfile>
      <anchor>gga81e0bae81de7634620302095a23723d8a1a1e3ff23ca89fa5079dc6115cc8e33e</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>multiply_coeff</name>
      <anchorfile>group__algorithms.html</anchorfile>
      <anchor>ga8bb55d11281bf13e9fd2a5d01bd7c9ea</anchor>
      <arglist>(const Matrix&lt; QuadMat&lt; T1, n &gt;, TL_NONE &gt; &amp;c, const std::array&lt; Matrix&lt; T, TL_NONE &gt;, n &gt; &amp;in, std::array&lt; Matrix&lt; T, TL_NONE &gt;, n &gt; &amp;out)</arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>fftw</name>
    <title>FFTW wrappers</title>
    <filename>group__fftw.html</filename>
    <class kind="class">toefl::DFT_DFT</class>
    <class kind="class">toefl::DFT_DRT</class>
    <class kind="class">toefl::DRT_DFT</class>
    <class kind="class">toefl::DRT_DRT</class>
    <member kind="function">
      <type>fftw_complex *</type>
      <name>fftw_cast</name>
      <anchorfile>group__fftw.html</anchorfile>
      <anchor>gae4e8f829512f124858cf7d0f9534af1f</anchor>
      <arglist>(double *const ptr)</arglist>
    </member>
    <member kind="function">
      <type>fftw_complex *</type>
      <name>fftw_cast</name>
      <anchorfile>group__fftw.html</anchorfile>
      <anchor>gacc41a17df6da4376093f9ef1d7fb7885</anchor>
      <arglist>(std::complex&lt; double &gt; *const ptr)</arglist>
    </member>
    <member kind="function">
      <type>fftw_r2r_kind</type>
      <name>inverse_kind</name>
      <anchorfile>group__fftw.html</anchorfile>
      <anchor>ga953727532d54b2a5e828427b1560971b</anchor>
      <arglist>(fftw_r2r_kind kind)</arglist>
    </member>
    <member kind="function">
      <type>fftw_plan</type>
      <name>plan_drt_1d</name>
      <anchorfile>group__fftw.html</anchorfile>
      <anchor>ga6cffae397935b18058b704d8e59a459e</anchor>
      <arglist>(const size_t rows, const size_t cols, double *in, double *out, const fftw_r2r_kind kind, const unsigned flags)</arglist>
    </member>
    <member kind="function">
      <type>fftw_plan</type>
      <name>plan_transpose</name>
      <anchorfile>group__fftw.html</anchorfile>
      <anchor>ga0b987de90d25ec636234952be30de6ec</anchor>
      <arglist>(const size_t rows, const size_t cols, double *in, double *out, const unsigned flags)</arglist>
    </member>
    <member kind="function">
      <type>fftw_plan</type>
      <name>plan_transpose</name>
      <anchorfile>group__fftw.html</anchorfile>
      <anchor>gac2de76c9b32737ddf89ca75bacd139bd</anchor>
      <arglist>(const size_t rows, const size_t cols, fftw_complex *in, fftw_complex *out, const unsigned flags)</arglist>
    </member>
    <member kind="function">
      <type>fftw_plan</type>
      <name>plan_dft_1d_r2c</name>
      <anchorfile>group__fftw.html</anchorfile>
      <anchor>gac14e1291ac986588c3ecd23de2a58406</anchor>
      <arglist>(const size_t real_rows, const size_t real_cols, double *in, fftw_complex *out, const unsigned flags)</arglist>
    </member>
    <member kind="function">
      <type>fftw_plan</type>
      <name>plan_dft_1d_c2r</name>
      <anchorfile>group__fftw.html</anchorfile>
      <anchor>gaa2189b45074e1d35b640dcc98767ef8a</anchor>
      <arglist>(const size_t real_rows, const size_t real_cols, fftw_complex *in, double *out, const unsigned flags)</arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>utilities</name>
    <title>Utilities</title>
    <filename>group__utilities.html</filename>
    <class kind="class">toefl::TurbulentBath</class>
    <class kind="struct">toefl::colormap_f</class>
    <class kind="struct">toefl::colormap_ext</class>
    <class kind="class">toefl::Timer</class>
    <member kind="typedef">
      <type>struct toefl::colormap_ext</type>
      <name>colormap_ext</name>
      <anchorfile>group__utilities.html</anchorfile>
      <anchor>ga5cbd63c6da2379bd643dc946f43784ed</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>toefl::Matrix&lt; std::array&lt; float, 3 &gt;, toefl::TL_NONE &gt;</type>
      <name>Texture_RGBf</name>
      <anchorfile>group__utilities.html</anchorfile>
      <anchor>ga356c71893774c0fdfb1e26ef1ab9577e</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>init_gaussian</name>
      <anchorfile>group__utilities.html</anchorfile>
      <anchor>ga0e730c6f07f61a20ea40d7866a5cdb90</anchor>
      <arglist>(M &amp;m, const double x0, const double y0, const double sigma_x, const double sigma_y, const double amplitude)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>init_gaussian_column</name>
      <anchorfile>group__utilities.html</anchorfile>
      <anchor>gaf74f93e3a788741c663d72dc38fa4dd7</anchor>
      <arglist>(M &amp;m, const double x0, const double sigma_x, const double amplitude)</arglist>
    </member>
    <member kind="function">
      <type>colormap_f</type>
      <name>redblue_f</name>
      <anchorfile>group__utilities.html</anchorfile>
      <anchor>gad8d19fbb27bf29fd5131c845ec7ceecb</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>colormap_ext</type>
      <name>redblue_ext</name>
      <anchorfile>group__utilities.html</anchorfile>
      <anchor>ga860335025a878570144953e2dd20adff</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>gentexture_RGBf</name>
      <anchorfile>group__utilities.html</anchorfile>
      <anchor>ga53a0f84e4f5464be844a2dcd08447f48</anchor>
      <arglist>(Texture_RGBf &amp;tex, const M &amp;field, const double maxabs)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>gentexture_RGBf_temp</name>
      <anchorfile>group__utilities.html</anchorfile>
      <anchor>ga78ead2d548e26a1cd8d405aa2764e021</anchor>
      <arglist>(Texture_RGBf &amp;tex, const M &amp;theta, const double ray)</arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>exceptions</name>
    <title>Exceptions</title>
    <filename>group__exceptions.html</filename>
    <class kind="class">toefl::AllocationError</class>
    <class kind="class">toefl::BadIndex</class>
    <class kind="class">toefl::Message</class>
  </compound>
  <compound kind="namespace">
    <name>toefl</name>
    <filename>namespacetoefl.html</filename>
    <class kind="class">toefl::Arakawa</class>
    <class kind="class">toefl::DFT_DFT</class>
    <class kind="class">toefl::DFT_DRT</class>
    <class kind="class">toefl::DRT_DFT</class>
    <class kind="class">toefl::DRT_DRT</class>
    <class kind="class">toefl::AllocationError</class>
    <class kind="class">toefl::BadIndex</class>
    <class kind="class">toefl::GhostMatrix</class>
    <class kind="class">toefl::TurbulentBath</class>
    <class kind="struct">toefl::Coefficients</class>
    <class kind="class">toefl::Karniadakis</class>
    <class kind="class">toefl::Matrix</class>
    <class kind="struct">toefl::MatrixArray</class>
    <class kind="class">toefl::Message</class>
    <class kind="class">toefl::QuadMat</class>
    <class kind="struct">toefl::colormap_f</class>
    <class kind="struct">toefl::colormap_ext</class>
    <class kind="class">toefl::Timer</class>
    <member kind="typedef">
      <type>struct toefl::colormap_ext</type>
      <name>colormap_ext</name>
      <anchorfile>group__utilities.html</anchorfile>
      <anchor>ga5cbd63c6da2379bd643dc946f43784ed</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>toefl::Matrix&lt; std::array&lt; float, 3 &gt;, toefl::TL_NONE &gt;</type>
      <name>Texture_RGBf</name>
      <anchorfile>group__utilities.html</anchorfile>
      <anchor>ga356c71893774c0fdfb1e26ef1ab9577e</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>bc</name>
      <anchorfile>group__containers.html</anchorfile>
      <anchor>ga870c0a2915eead520a3b7b59e26534e3</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>TL_PERIODIC</name>
      <anchorfile>group__containers.html</anchorfile>
      <anchor>gga870c0a2915eead520a3b7b59e26534e3acb6f43c8ecb2e4b6ecb41ea419c98d0c</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>TL_DST00</name>
      <anchorfile>group__containers.html</anchorfile>
      <anchor>gga870c0a2915eead520a3b7b59e26534e3af119d3fbab7b6fefd6071d9ab62ec748</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>TL_DST10</name>
      <anchorfile>group__containers.html</anchorfile>
      <anchor>gga870c0a2915eead520a3b7b59e26534e3af8ef57623f6eb638aaf7dd8ecdeaec1d</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>TL_DST01</name>
      <anchorfile>group__containers.html</anchorfile>
      <anchor>gga870c0a2915eead520a3b7b59e26534e3a30e7049ff2518ef30741b06c6d36a2c8</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>TL_DST11</name>
      <anchorfile>group__containers.html</anchorfile>
      <anchor>gga870c0a2915eead520a3b7b59e26534e3a90df49f6d5d3a38f2cbc67d3cce0da8e</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>stepper</name>
      <anchorfile>group__algorithms.html</anchorfile>
      <anchor>ga81e0bae81de7634620302095a23723d8</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>TL_EULER</name>
      <anchorfile>group__algorithms.html</anchorfile>
      <anchor>gga81e0bae81de7634620302095a23723d8a41b76d0ef62517a0e4cef656dfdc1e0d</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>TL_ORDER2</name>
      <anchorfile>group__algorithms.html</anchorfile>
      <anchor>gga81e0bae81de7634620302095a23723d8aa34795e40a3590c1fccd16e67c98a05c</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>TL_ORDER3</name>
      <anchorfile>group__algorithms.html</anchorfile>
      <anchor>gga81e0bae81de7634620302095a23723d8a1a1e3ff23ca89fa5079dc6115cc8e33e</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>Void</name>
      <anchorfile>group__containers.html</anchorfile>
      <anchor>gad5f39f322bf8f232863d5b5eda04749b</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>TL_VOID</name>
      <anchorfile>group__containers.html</anchorfile>
      <anchor>ggad5f39f322bf8f232863d5b5eda04749ba83385206f613ebea4231dd24f821a126</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>Padding</name>
      <anchorfile>group__containers.html</anchorfile>
      <anchor>ga8e7cb091290b8f98cc2a25a7954e0023</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>TL_NONE</name>
      <anchorfile>group__containers.html</anchorfile>
      <anchor>gga8e7cb091290b8f98cc2a25a7954e0023a63f2b99c5fa905c4e5240587b682bacd</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>TL_DFT</name>
      <anchorfile>group__containers.html</anchorfile>
      <anchor>gga8e7cb091290b8f98cc2a25a7954e0023a0b59e46cc6cbf6420f5a069dc01de147</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <type>@</type>
      <name>TL_DRT_DFT</name>
      <anchorfile>group__containers.html</anchorfile>
      <anchor>gga8e7cb091290b8f98cc2a25a7954e0023ad01ccc5f623ab622a9e1085d490d8ecc</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>interior</name>
      <anchorfile>namespacetoefl.html</anchorfile>
      <anchor>a530639057348ca226388f927dbe62b24</anchor>
      <arglist>(const size_t i0, const size_t j0, const M &amp;lhs, const M &amp;rhs)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>boundary</name>
      <anchorfile>namespacetoefl.html</anchorfile>
      <anchor>a305a5de24dad48e37df372fd7432afae</anchor>
      <arglist>(const size_t i0, const size_t j0, const M &amp;lhs, const M &amp;rhs)</arglist>
    </member>
    <member kind="function">
      <type>fftw_complex *</type>
      <name>fftw_cast</name>
      <anchorfile>group__fftw.html</anchorfile>
      <anchor>gae4e8f829512f124858cf7d0f9534af1f</anchor>
      <arglist>(double *const ptr)</arglist>
    </member>
    <member kind="function">
      <type>fftw_complex *</type>
      <name>fftw_cast</name>
      <anchorfile>group__fftw.html</anchorfile>
      <anchor>gacc41a17df6da4376093f9ef1d7fb7885</anchor>
      <arglist>(std::complex&lt; double &gt; *const ptr)</arglist>
    </member>
    <member kind="function">
      <type>fftw_r2r_kind</type>
      <name>inverse_kind</name>
      <anchorfile>group__fftw.html</anchorfile>
      <anchor>ga953727532d54b2a5e828427b1560971b</anchor>
      <arglist>(fftw_r2r_kind kind)</arglist>
    </member>
    <member kind="function">
      <type>fftw_plan</type>
      <name>plan_drt_1d</name>
      <anchorfile>group__fftw.html</anchorfile>
      <anchor>ga6cffae397935b18058b704d8e59a459e</anchor>
      <arglist>(const size_t rows, const size_t cols, double *in, double *out, const fftw_r2r_kind kind, const unsigned flags)</arglist>
    </member>
    <member kind="function">
      <type>fftw_plan</type>
      <name>plan_transpose</name>
      <anchorfile>group__fftw.html</anchorfile>
      <anchor>ga0b987de90d25ec636234952be30de6ec</anchor>
      <arglist>(const size_t rows, const size_t cols, double *in, double *out, const unsigned flags)</arglist>
    </member>
    <member kind="function">
      <type>fftw_plan</type>
      <name>plan_transpose</name>
      <anchorfile>group__fftw.html</anchorfile>
      <anchor>gac2de76c9b32737ddf89ca75bacd139bd</anchor>
      <arglist>(const size_t rows, const size_t cols, fftw_complex *in, fftw_complex *out, const unsigned flags)</arglist>
    </member>
    <member kind="function">
      <type>fftw_plan</type>
      <name>plan_dft_1d_r2c</name>
      <anchorfile>group__fftw.html</anchorfile>
      <anchor>gac14e1291ac986588c3ecd23de2a58406</anchor>
      <arglist>(const size_t real_rows, const size_t real_cols, double *in, fftw_complex *out, const unsigned flags)</arglist>
    </member>
    <member kind="function">
      <type>fftw_plan</type>
      <name>plan_dft_1d_c2r</name>
      <anchorfile>group__fftw.html</anchorfile>
      <anchor>gaa2189b45074e1d35b640dcc98767ef8a</anchor>
      <arglist>(const size_t real_rows, const size_t real_cols, fftw_complex *in, double *out, const unsigned flags)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>init_gaussian</name>
      <anchorfile>group__utilities.html</anchorfile>
      <anchor>ga0e730c6f07f61a20ea40d7866a5cdb90</anchor>
      <arglist>(M &amp;m, const double x0, const double y0, const double sigma_x, const double sigma_y, const double amplitude)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>init_gaussian_column</name>
      <anchorfile>group__utilities.html</anchorfile>
      <anchor>gaf74f93e3a788741c663d72dc38fa4dd7</anchor>
      <arglist>(M &amp;m, const double x0, const double sigma_x, const double amplitude)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>multiply_coeff</name>
      <anchorfile>group__algorithms.html</anchorfile>
      <anchor>ga8bb55d11281bf13e9fd2a5d01bd7c9ea</anchor>
      <arglist>(const Matrix&lt; QuadMat&lt; T1, n &gt;, TL_NONE &gt; &amp;c, const std::array&lt; Matrix&lt; T, TL_NONE &gt;, n &gt; &amp;in, std::array&lt; Matrix&lt; T, TL_NONE &gt;, n &gt; &amp;out)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>swap_fields</name>
      <anchorfile>namespacetoefl.html</anchorfile>
      <anchor>a4cf5c3a2c097084c21e9fda488b95e6a</anchor>
      <arglist>(Matrix&lt; T1, P1 &gt; &amp;lhs, Matrix&lt; T2, P2 &gt; &amp;rhs)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>permute_fields</name>
      <anchorfile>namespacetoefl.html</anchorfile>
      <anchor>ab501c750a4b0a58f3e07f3478c42d7d8</anchor>
      <arglist>(Matrix&lt; T, P &gt; &amp;first, Matrix&lt; T, P &gt; &amp;second, Matrix&lt; T, P &gt; &amp;third)</arglist>
    </member>
    <member kind="function">
      <type>std::ostream &amp;</type>
      <name>operator&lt;&lt;</name>
      <anchorfile>namespacetoefl.html</anchorfile>
      <anchor>a635977f59bd9eb65d722db32c2fd8da4</anchor>
      <arglist>(std::ostream &amp;os, const Matrix&lt; T, P &gt; &amp;mat)</arglist>
    </member>
    <member kind="function">
      <type>std::istream &amp;</type>
      <name>operator&gt;&gt;</name>
      <anchorfile>namespacetoefl.html</anchorfile>
      <anchor>af8cdd92d611881ca58f5b924cdeb7209</anchor>
      <arglist>(std::istream &amp;is, Matrix&lt; T, P &gt; &amp;mat)</arglist>
    </member>
    <member kind="function">
      <type>QuadMat&lt; double, n &gt;</type>
      <name>One</name>
      <anchorfile>group__containers.html</anchorfile>
      <anchor>ga6fd3fab40f3226dfd369a330e50f5405</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>QuadMat&lt; double, n &gt;</type>
      <name>Zero</name>
      <anchorfile>group__containers.html</anchorfile>
      <anchor>ga1c8a53ed2642944edfd3f9da59a6f016</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>invert</name>
      <anchorfile>namespacetoefl.html</anchorfile>
      <anchor>ada8d4d0294cb1bcbd6cfd4c46e5f7f4b</anchor>
      <arglist>(const QuadMat&lt; T, 2 &gt; &amp;in, QuadMat&lt; T, 2 &gt; &amp;out)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>invert</name>
      <anchorfile>namespacetoefl.html</anchorfile>
      <anchor>a3e1ac61572f522768b1e9c4bf29d42ef</anchor>
      <arglist>(const QuadMat&lt; T, 3 &gt; &amp;in, QuadMat&lt; T, 3 &gt; &amp;out)</arglist>
    </member>
    <member kind="function">
      <type>colormap_f</type>
      <name>redblue_f</name>
      <anchorfile>group__utilities.html</anchorfile>
      <anchor>gad8d19fbb27bf29fd5131c845ec7ceecb</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>colormap_ext</type>
      <name>redblue_ext</name>
      <anchorfile>group__utilities.html</anchorfile>
      <anchor>ga860335025a878570144953e2dd20adff</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>gentexture_RGBf</name>
      <anchorfile>group__utilities.html</anchorfile>
      <anchor>ga53a0f84e4f5464be844a2dcd08447f48</anchor>
      <arglist>(Texture_RGBf &amp;tex, const M &amp;field, const double maxabs)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>gentexture_RGBf_temp</name>
      <anchorfile>group__utilities.html</anchorfile>
      <anchor>ga78ead2d548e26a1cd8d405aa2764e021</anchor>
      <arglist>(Texture_RGBf &amp;tex, const M &amp;theta, const double ray)</arglist>
    </member>
    <member kind="function">
      <type>fftw_r2r_kind</type>
      <name>fftw_convert</name>
      <anchorfile>namespacetoefl.html</anchorfile>
      <anchor>a79ed5ffdd8c9fe7aaabda3f8370c0dfd</anchor>
      <arglist>(enum bc bc)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>fftw_normalisation</name>
      <anchorfile>namespacetoefl.html</anchorfile>
      <anchor>aac93b94f880749ff2c5df3eed3140a5a</anchor>
      <arglist>(enum bc bc, unsigned n)</arglist>
    </member>
    <member kind="function">
      <type>fftw_r2r_kind</type>
      <name>fftw_convert</name>
      <anchorfile>namespacetoefl.html</anchorfile>
      <anchor>a79ed5ffdd8c9fe7aaabda3f8370c0dfd</anchor>
      <arglist>(enum bc bc)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>fftw_normalisation</name>
      <anchorfile>namespacetoefl.html</anchorfile>
      <anchor>aac93b94f880749ff2c5df3eed3140a5a</anchor>
      <arglist>(enum bc bc, unsigned n)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>toefl::Arakawa</name>
    <filename>classtoefl_1_1_arakawa.html</filename>
    <member kind="function">
      <type></type>
      <name>Arakawa</name>
      <anchorfile>classtoefl_1_1_arakawa.html</anchorfile>
      <anchor>ac7d18718d661f4c8b9edf50dbc1075e2</anchor>
      <arglist>(const double h)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator()</name>
      <anchorfile>classtoefl_1_1_arakawa.html</anchorfile>
      <anchor>a7cd8e5a7b63707f67f217c16316d4d35</anchor>
      <arglist>(const GhostM &amp;lhs, const GhostM &amp;rhs, M &amp;jac)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>toefl::DFT_DFT</name>
    <filename>classtoefl_1_1_d_f_t___d_f_t.html</filename>
    <member kind="function">
      <type></type>
      <name>DFT_DFT</name>
      <anchorfile>classtoefl_1_1_d_f_t___d_f_t.html</anchorfile>
      <anchor>a5308cc3c288ab43d429678e82e600756</anchor>
      <arglist>(const size_t real_rows, const size_t real_cols, const unsigned flags=FFTW_MEASURE)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>r2c</name>
      <anchorfile>classtoefl_1_1_d_f_t___d_f_t.html</anchorfile>
      <anchor>aba2081e8cf42121e46b085dff687f143</anchor>
      <arglist>(Matrix&lt; double, TL_DFT &gt; &amp;inout, Matrix&lt; complex, TL_NONE &gt; &amp;swap)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>c2r</name>
      <anchorfile>classtoefl_1_1_d_f_t___d_f_t.html</anchorfile>
      <anchor>a34f50d4c5b2e36c802c56e3296ce729c</anchor>
      <arglist>(Matrix&lt; complex, TL_NONE &gt; &amp;inout, Matrix&lt; double, TL_DFT &gt; &amp;swap)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>dot</name>
      <anchorfile>classtoefl_1_1_d_f_t___d_f_t.html</anchorfile>
      <anchor>af37edbb5be6e0c1f473a5fbee52daaba</anchor>
      <arglist>(const Matrix&lt; complex, TL_NONE &gt; &amp;m1, const Matrix&lt; complex, TL_NONE &gt; &amp;m2)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>DFT_DFT</name>
      <anchorfile>classtoefl_1_1_d_f_t___d_f_t.html</anchorfile>
      <anchor>a9da42b87b4d2c684de60aa9d2c2740e7</anchor>
      <arglist>(DFT_DFT &amp;)=delete</arglist>
    </member>
    <member kind="function">
      <type>DFT_DFT &amp;</type>
      <name>operator=</name>
      <anchorfile>classtoefl_1_1_d_f_t___d_f_t.html</anchorfile>
      <anchor>a5edfb614f5fdbb076cfea18553be0272</anchor>
      <arglist>(DFT_DFT &amp;)=delete</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~DFT_DFT</name>
      <anchorfile>classtoefl_1_1_d_f_t___d_f_t.html</anchorfile>
      <anchor>a9dc932a569dd0d3d846f15c4a28bc60b</anchor>
      <arglist>()</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>toefl::DFT_DRT</name>
    <filename>classtoefl_1_1_d_f_t___d_r_t.html</filename>
    <member kind="function">
      <type></type>
      <name>DFT_DRT</name>
      <anchorfile>classtoefl_1_1_d_f_t___d_r_t.html</anchorfile>
      <anchor>a5f746985369610ff0962cd5511feb9b6</anchor>
      <arglist>(const size_t rows, const size_t cols, const fftw_r2r_kind kind, const unsigned=FFTW_MEASURE)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~DFT_DRT</name>
      <anchorfile>classtoefl_1_1_d_f_t___d_r_t.html</anchorfile>
      <anchor>a830985e207bcd99891faca3ed1c1c1ea</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>r2c</name>
      <anchorfile>classtoefl_1_1_d_f_t___d_r_t.html</anchorfile>
      <anchor>aefd679a98998b744a97599145e51c0e7</anchor>
      <arglist>(Matrix&lt; double, TL_DFT &gt; &amp;inout, Matrix&lt; complex, TL_NONE &gt; &amp;swap_T)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>c2r</name>
      <anchorfile>classtoefl_1_1_d_f_t___d_r_t.html</anchorfile>
      <anchor>a3e4e26116f0f3dcf9cf22e08cd3703f0</anchor>
      <arglist>(Matrix&lt; complex, TL_NONE &gt; &amp;inout_T, Matrix&lt; double, TL_DFT &gt; &amp;swap)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>DFT_DRT</name>
      <anchorfile>classtoefl_1_1_d_f_t___d_r_t.html</anchorfile>
      <anchor>a51a0dec4844bad6638b2dea38820164c</anchor>
      <arglist>(DFT_DRT &amp;)=delete</arglist>
    </member>
    <member kind="function">
      <type>DFT_DRT &amp;</type>
      <name>operator=</name>
      <anchorfile>classtoefl_1_1_d_f_t___d_r_t.html</anchorfile>
      <anchor>a7ba0e884d8f3d9641124ea1cf8d5e4b5</anchor>
      <arglist>(DFT_DRT &amp;)=delete</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>toefl::DRT_DFT</name>
    <filename>classtoefl_1_1_d_r_t___d_f_t.html</filename>
    <member kind="function">
      <type></type>
      <name>DRT_DFT</name>
      <anchorfile>classtoefl_1_1_d_r_t___d_f_t.html</anchorfile>
      <anchor>acdeda03e5447f291f929061654752a6a</anchor>
      <arglist>(const size_t real_rows, const size_t real_cols, const fftw_r2r_kind kind, const unsigned flags=FFTW_MEASURE)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>r2c_T</name>
      <anchorfile>classtoefl_1_1_d_r_t___d_f_t.html</anchorfile>
      <anchor>a839bef8caa8563490240895f1067e6d0</anchor>
      <arglist>(Matrix&lt; double, TL_DRT_DFT &gt; &amp;inout, Matrix&lt; complex, TL_NONE &gt; &amp;swap_T)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>c_T2r</name>
      <anchorfile>classtoefl_1_1_d_r_t___d_f_t.html</anchorfile>
      <anchor>a8c88b3d404cddf933d34349acda315bd</anchor>
      <arglist>(Matrix&lt; complex, TL_NONE &gt; &amp;inout_T, Matrix&lt; double, TL_DRT_DFT &gt; &amp;swap)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>DRT_DFT</name>
      <anchorfile>classtoefl_1_1_d_r_t___d_f_t.html</anchorfile>
      <anchor>a03ec2f6387472f4139697755d3af5021</anchor>
      <arglist>(DRT_DFT &amp;)=delete</arglist>
    </member>
    <member kind="function">
      <type>DRT_DFT &amp;</type>
      <name>operator=</name>
      <anchorfile>classtoefl_1_1_d_r_t___d_f_t.html</anchorfile>
      <anchor>a6b5d8ce31b821b6f59084948b93d0ec0</anchor>
      <arglist>(DRT_DFT &amp;)=delete</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~DRT_DFT</name>
      <anchorfile>classtoefl_1_1_d_r_t___d_f_t.html</anchorfile>
      <anchor>a736fdfd84649a1f681152279ea945e49</anchor>
      <arglist>()</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>toefl::DRT_DRT</name>
    <filename>classtoefl_1_1_d_r_t___d_r_t.html</filename>
    <member kind="function">
      <type></type>
      <name>DRT_DRT</name>
      <anchorfile>classtoefl_1_1_d_r_t___d_r_t.html</anchorfile>
      <anchor>aaee0742921852949671504079d3d1323</anchor>
      <arglist>(const size_t rows, const size_t cols, const fftw_r2r_kind horizontal_kind, const fftw_r2r_kind vertical_kind, const unsigned=FFTW_MEASURE)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~DRT_DRT</name>
      <anchorfile>classtoefl_1_1_d_r_t___d_r_t.html</anchorfile>
      <anchor>a5ee3da75aab8cadc487513972509b8d3</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>forward</name>
      <anchorfile>classtoefl_1_1_d_r_t___d_r_t.html</anchorfile>
      <anchor>adcc86b0ed34bb93eca9cdc8278f3f9e1</anchor>
      <arglist>(Matrix&lt; double, TL_NONE &gt; &amp;inout, Matrix&lt; double, TL_NONE &gt; &amp;swap)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>backward</name>
      <anchorfile>classtoefl_1_1_d_r_t___d_r_t.html</anchorfile>
      <anchor>a90e2df78fef04cce63a500d2fc482ecb</anchor>
      <arglist>(Matrix&lt; double, TL_NONE &gt; &amp;inout, Matrix&lt; double, TL_NONE &gt; &amp;swap)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>DRT_DRT</name>
      <anchorfile>classtoefl_1_1_d_r_t___d_r_t.html</anchorfile>
      <anchor>ad6fdc53a049a426f69d8be096a7e8408</anchor>
      <arglist>(DRT_DRT &amp;)=delete</arglist>
    </member>
    <member kind="function">
      <type>DRT_DRT &amp;</type>
      <name>operator=</name>
      <anchorfile>classtoefl_1_1_d_r_t___d_r_t.html</anchorfile>
      <anchor>ab6efeb1a13b1125ca568bc1af27584d5</anchor>
      <arglist>(DRT_DRT &amp;)=delete</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>toefl::AllocationError</name>
    <filename>classtoefl_1_1_allocation_error.html</filename>
    <base>toefl::Message</base>
    <member kind="function">
      <type></type>
      <name>AllocationError</name>
      <anchorfile>classtoefl_1_1_allocation_error.html</anchorfile>
      <anchor>a424affcd290790c0aa982d03d5a5918e</anchor>
      <arglist>(size_t n, size_t m, const char *d, const int l)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>display</name>
      <anchorfile>classtoefl_1_1_allocation_error.html</anchorfile>
      <anchor>a9391fc6957a0dd1f8c0e4b49802464db</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Message</name>
      <anchorfile>classtoefl_1_1_message.html</anchorfile>
      <anchor>a5823d9149ad03cc0dadd023c414fcc95</anchor>
      <arglist>(const char *message, const char *file, const int line)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>toefl::BadIndex</name>
    <filename>classtoefl_1_1_bad_index.html</filename>
    <base>toefl::Message</base>
    <member kind="function">
      <type></type>
      <name>BadIndex</name>
      <anchorfile>classtoefl_1_1_bad_index.html</anchorfile>
      <anchor>a76989e71c6dff3d3f113e0e63edf2fa6</anchor>
      <arglist>(size_t i, size_t i_max, size_t j, size_t j_max, const char *d, const int l)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>display</name>
      <anchorfile>classtoefl_1_1_bad_index.html</anchorfile>
      <anchor>aa335f4965aa3f6c3a68e758260d69be7</anchor>
      <arglist>() const </arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>toefl::GhostMatrix</name>
    <filename>classtoefl_1_1_ghost_matrix.html</filename>
    <templarg></templarg>
    <templarg>P</templarg>
    <base>toefl::Matrix</base>
    <member kind="function">
      <type></type>
      <name>GhostMatrix</name>
      <anchorfile>classtoefl_1_1_ghost_matrix.html</anchorfile>
      <anchor>a7b59b69c1e82768ce3cddaf1e2b91c7b</anchor>
      <arglist>(const size_t rows, const size_t cols, const enum bc bc_rows=TL_PERIODIC, const enum bc bc_cols=TL_PERIODIC, const bool allocate=true)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>GhostMatrix</name>
      <anchorfile>classtoefl_1_1_ghost_matrix.html</anchorfile>
      <anchor>a34caf5b7929b74396ebde378c8110055</anchor>
      <arglist>(const size_t rows, const size_t cols, const T &amp;value, const enum bc bc_rows=TL_PERIODIC, const enum bc bc_cols=TL_PERIODIC)</arglist>
    </member>
    <member kind="function">
      <type>T &amp;</type>
      <name>at</name>
      <anchorfile>classtoefl_1_1_ghost_matrix.html</anchorfile>
      <anchor>ae9962cd2dae8880bf4178c90980b9b60</anchor>
      <arglist>(const int i, const int j)</arglist>
    </member>
    <member kind="function">
      <type>const T &amp;</type>
      <name>at</name>
      <anchorfile>classtoefl_1_1_ghost_matrix.html</anchorfile>
      <anchor>aabc38449f549d9c20aed42fac0957af3</anchor>
      <arglist>(const int i, const int j) const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>display</name>
      <anchorfile>classtoefl_1_1_ghost_matrix.html</anchorfile>
      <anchor>a9fb0d794bf129796c13dfa68b6bbdfe9</anchor>
      <arglist>(std::ostream &amp;os=std::cout)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>initGhostCells</name>
      <anchorfile>classtoefl_1_1_ghost_matrix.html</anchorfile>
      <anchor>ac5c1d98d3b765fd94fca0f881338bf1d</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Matrix</name>
      <anchorfile>classtoefl_1_1_matrix.html</anchorfile>
      <anchor>af8f935080301ca145915c3e2330134fe</anchor>
      <arglist>(const size_t rows, const size_t cols, const bool allocate=true)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Matrix</name>
      <anchorfile>classtoefl_1_1_matrix.html</anchorfile>
      <anchor>a66fedb25468e7877b0c55d59ce9c1e35</anchor>
      <arglist>(const size_t rows, const size_t cols, const T &amp;value)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~Matrix</name>
      <anchorfile>classtoefl_1_1_matrix.html</anchorfile>
      <anchor>ae0bbffe530ad595079c99355458c064c</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Matrix</name>
      <anchorfile>classtoefl_1_1_matrix.html</anchorfile>
      <anchor>aed10cba858c6e424122ced79fab91087</anchor>
      <arglist>(const Matrix &amp;src)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Matrix</name>
      <anchorfile>classtoefl_1_1_matrix.html</anchorfile>
      <anchor>aa49de9ed627cd38701282b03ea52e3f9</anchor>
      <arglist>(Matrix &amp;&amp;temporary_src)</arglist>
    </member>
    <member kind="function">
      <type>Matrix &amp;</type>
      <name>operator=</name>
      <anchorfile>classtoefl_1_1_matrix.html</anchorfile>
      <anchor>aa748bce65eba4b471e48e02e2e92072c</anchor>
      <arglist>(const Matrix &amp;src)</arglist>
    </member>
    <member kind="function">
      <type>Matrix &amp;</type>
      <name>operator=</name>
      <anchorfile>classtoefl_1_1_matrix.html</anchorfile>
      <anchor>ad0c008428626e77f0d82eacab047cfe0</anchor>
      <arglist>(Matrix &amp;&amp;temporary_src)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>allocate</name>
      <anchorfile>classtoefl_1_1_matrix.html</anchorfile>
      <anchor>a171550ab096ef57acfbd755c7bfe930f</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const size_t</type>
      <name>rows</name>
      <anchorfile>classtoefl_1_1_matrix.html</anchorfile>
      <anchor>aa52708d41add23f7cc585e8c2ba0485e</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>const size_t</type>
      <name>cols</name>
      <anchorfile>classtoefl_1_1_matrix.html</anchorfile>
      <anchor>acaaf1b7e09ef4b7524d6b36829f6e699</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>T *</type>
      <name>getPtr</name>
      <anchorfile>classtoefl_1_1_matrix.html</anchorfile>
      <anchor>a1a2bcfc1183ab0d558f54c46531fb1a3</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>T const *</type>
      <name>getPtr</name>
      <anchorfile>classtoefl_1_1_matrix.html</anchorfile>
      <anchor>ae4b7b5be8a42549d0e2e9400f63b7022</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>std::vector&lt; T &gt;</type>
      <name>copy</name>
      <anchorfile>classtoefl_1_1_matrix.html</anchorfile>
      <anchor>a9de80b0a0ce91964416b39c51ac46b67</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>zero</name>
      <anchorfile>classtoefl_1_1_matrix.html</anchorfile>
      <anchor>a5f1050ba85376409c09b96a7d5b3ceba</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>isVoid</name>
      <anchorfile>classtoefl_1_1_matrix.html</anchorfile>
      <anchor>ab6697ba4f337254d25cf73e29c886195</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>const bool</type>
      <name>operator!=</name>
      <anchorfile>classtoefl_1_1_matrix.html</anchorfile>
      <anchor>a07f1cd766abd446985c51923b6b2c55b</anchor>
      <arglist>(const Matrix &amp;rhs) const </arglist>
    </member>
    <member kind="function">
      <type>const bool</type>
      <name>operator==</name>
      <anchorfile>classtoefl_1_1_matrix.html</anchorfile>
      <anchor>a5cf562d7f0077790582e297f1e6e6d8f</anchor>
      <arglist>(const Matrix &amp;rhs) const </arglist>
    </member>
    <member kind="function">
      <type>T &amp;</type>
      <name>operator()</name>
      <anchorfile>classtoefl_1_1_matrix.html</anchorfile>
      <anchor>a4ca998f5fb19bba6870a774f67a35d6d</anchor>
      <arglist>(const size_t i, const size_t j)</arglist>
    </member>
    <member kind="function">
      <type>const T &amp;</type>
      <name>operator()</name>
      <anchorfile>classtoefl_1_1_matrix.html</anchorfile>
      <anchor>a86a1f2b61fdee9e29e1c007c655b4fb0</anchor>
      <arglist>(const size_t i, const size_t j) const </arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>toefl::TurbulentBath</name>
    <filename>classtoefl_1_1_turbulent_bath.html</filename>
    <member kind="function">
      <type></type>
      <name>TurbulentBath</name>
      <anchorfile>classtoefl_1_1_turbulent_bath.html</anchorfile>
      <anchor>adcea53556317d5d7361a025f7e0c58c6</anchor>
      <arglist>(double amp)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>operator()</name>
      <anchorfile>classtoefl_1_1_turbulent_bath.html</anchorfile>
      <anchor>ad96f857f876b7dbb22856c5565cc42af</anchor>
      <arglist>(const double laplace)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>toefl::Coefficients</name>
    <filename>structtoefl_1_1_coefficients.html</filename>
    <templarg>S</templarg>
    <member kind="variable" static="yes">
      <type>static double const</type>
      <name>gamma_0</name>
      <anchorfile>structtoefl_1_1_coefficients.html</anchorfile>
      <anchor>abfcc0bdffc44a691918ced302fdb0e77</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const double</type>
      <name>alpha</name>
      <anchorfile>structtoefl_1_1_coefficients.html</anchorfile>
      <anchor>a1940fc3c8053eea3440f22819040ace5</anchor>
      <arglist>[3]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const double</type>
      <name>beta</name>
      <anchorfile>structtoefl_1_1_coefficients.html</anchorfile>
      <anchor>a5026e54e417b2ed77c28e81383b62916</anchor>
      <arglist>[3]</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>toefl::Karniadakis</name>
    <filename>classtoefl_1_1_karniadakis.html</filename>
    <templarg>n</templarg>
    <templarg></templarg>
    <templarg>P_x</templarg>
    <member kind="function">
      <type></type>
      <name>Karniadakis</name>
      <anchorfile>classtoefl_1_1_karniadakis.html</anchorfile>
      <anchor>a26750af2a9b2840fabb98b1a207bb41c</anchor>
      <arglist>(const size_t rows_x, const size_t cols_x, const size_t rows_k, const size_t cols_k, const double dt)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>init_coeff</name>
      <anchorfile>classtoefl_1_1_karniadakis.html</anchorfile>
      <anchor>a22407613edd0276d73e231d3d609d27e</anchor>
      <arglist>(Matrix&lt; QuadMat&lt; T_k, n &gt; &gt; &amp;coeff_origin, const double normalisation)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>invert_coeff</name>
      <anchorfile>classtoefl_1_1_karniadakis.html</anchorfile>
      <anchor>adccde7a98183629b5237020f76816a43</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>step_i</name>
      <anchorfile>classtoefl_1_1_karniadakis.html</anchorfile>
      <anchor>abc4d732dcd81018b4024f09611a1443c</anchor>
      <arglist>(std::array&lt; Matrix&lt; double, P_x &gt;, n &gt; &amp;v0, std::array&lt; Matrix&lt; double, P_x &gt;, n &gt; &amp;n0)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>step_ii</name>
      <anchorfile>classtoefl_1_1_karniadakis.html</anchorfile>
      <anchor>a204be22d4a86a063e2ef5006606a39f3</anchor>
      <arglist>(std::array&lt; Matrix&lt; Fourier_T, TL_NONE &gt;, n &gt; &amp;v)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>display</name>
      <anchorfile>classtoefl_1_1_karniadakis.html</anchorfile>
      <anchor>a98bde7da3c39fc7d35653cd9e9201a04</anchor>
      <arglist>(std::ostream &amp;os=std::cout) const </arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>toefl::Matrix</name>
    <filename>classtoefl_1_1_matrix.html</filename>
    <templarg>T</templarg>
    <templarg>P</templarg>
    <member kind="friend">
      <type>friend void</type>
      <name>swap_fields</name>
      <anchorfile>classtoefl_1_1_matrix.html</anchorfile>
      <anchor>a6d742b5adef98ee880851a78a866005e</anchor>
      <arglist>(Matrix&lt; T1, P1 &gt; &amp;lhs, Matrix&lt; T2, P2 &gt; &amp;rhs)</arglist>
    </member>
    <member kind="friend">
      <type>friend void</type>
      <name>permute_fields</name>
      <anchorfile>classtoefl_1_1_matrix.html</anchorfile>
      <anchor>a2a5baf9d8f440c1f53ed075cd3628906</anchor>
      <arglist>(Matrix &amp;first, Matrix &amp;second, Matrix &amp;third)</arglist>
    </member>
    <member kind="friend">
      <type>friend std::ostream &amp;</type>
      <name>operator</name>
      <anchorfile>classtoefl_1_1_matrix.html</anchorfile>
      <anchor>a8da52c7e2044d7f2418d088dfca00c93</anchor>
      <arglist>(std::ostream &amp;os, const Matrix &amp;mat)</arglist>
    </member>
    <member kind="friend">
      <type>friend std::istream &amp;</type>
      <name>operator&gt;&gt;</name>
      <anchorfile>classtoefl_1_1_matrix.html</anchorfile>
      <anchor>a8df66e6fa6bd88312fa17678a47ff98b</anchor>
      <arglist>(std::istream &amp;is, Matrix &amp;mat)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>toefl::MatrixArray</name>
    <filename>structtoefl_1_1_matrix_array.html</filename>
    <templarg></templarg>
    <templarg>P</templarg>
    <templarg>n</templarg>
    <member kind="function" static="yes">
      <type>static std::array&lt; Matrix&lt; T, P &gt;, n &gt;</type>
      <name>construct</name>
      <anchorfile>structtoefl_1_1_matrix_array.html</anchorfile>
      <anchor>ab4f617feadfe5c87e31f940656063bf8</anchor>
      <arglist>(size_t rows, size_t cols, T value=(T) 0)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>toefl::Message</name>
    <filename>classtoefl_1_1_message.html</filename>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>display</name>
      <anchorfile>classtoefl_1_1_message.html</anchorfile>
      <anchor>aa20df99f75c59eceb9d840fce97f28e3</anchor>
      <arglist>() const </arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>toefl::QuadMat</name>
    <filename>classtoefl_1_1_quad_mat.html</filename>
    <templarg>T</templarg>
    <templarg>n</templarg>
    <member kind="function">
      <type></type>
      <name>QuadMat</name>
      <anchorfile>classtoefl_1_1_quad_mat.html</anchorfile>
      <anchor>ace5651843bd22ab96921d32e4f0cf006</anchor>
      <arglist>()=default</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>QuadMat</name>
      <anchorfile>classtoefl_1_1_quad_mat.html</anchorfile>
      <anchor>a2402508ae637746134e0ea8da568ecfc</anchor>
      <arglist>(const T &amp;value)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>zero</name>
      <anchorfile>classtoefl_1_1_quad_mat.html</anchorfile>
      <anchor>ae0fe7e6f7ede59663619d27f4cfbe82a</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>T &amp;</type>
      <name>operator()</name>
      <anchorfile>classtoefl_1_1_quad_mat.html</anchorfile>
      <anchor>af572cb041e8326a8396ead6e2c7508de</anchor>
      <arglist>(const size_t i, const size_t j)</arglist>
    </member>
    <member kind="function">
      <type>const T &amp;</type>
      <name>operator()</name>
      <anchorfile>classtoefl_1_1_quad_mat.html</anchorfile>
      <anchor>a8763985d9d4d2d3fa97bdb486a5d7bfe</anchor>
      <arglist>(const size_t i, const size_t j) const </arglist>
    </member>
    <member kind="function">
      <type>const bool</type>
      <name>operator!=</name>
      <anchorfile>classtoefl_1_1_quad_mat.html</anchorfile>
      <anchor>a5cff69eb8c437e9bf70796b61b293b60</anchor>
      <arglist>(const QuadMat &amp;rhs) const </arglist>
    </member>
    <member kind="function">
      <type>const bool</type>
      <name>operator==</name>
      <anchorfile>classtoefl_1_1_quad_mat.html</anchorfile>
      <anchor>a11b15f16b5818b1bb8ba7feee7e5a207</anchor>
      <arglist>(const QuadMat &amp;rhs) const </arglist>
    </member>
    <member kind="friend">
      <type>friend std::ostream &amp;</type>
      <name>operator&lt;&lt;</name>
      <anchorfile>classtoefl_1_1_quad_mat.html</anchorfile>
      <anchor>a2e1616de5af08b47654991ad6d87d036</anchor>
      <arglist>(std::ostream &amp;os, const QuadMat&lt; T, n &gt; &amp;mat)</arglist>
    </member>
    <member kind="friend">
      <type>friend std::istream &amp;</type>
      <name>operator&gt;&gt;</name>
      <anchorfile>classtoefl_1_1_quad_mat.html</anchorfile>
      <anchor>a260b83b96017ed4532f93786da0fa01b</anchor>
      <arglist>(std::istream &amp;is, QuadMat&lt; T, n &gt; &amp;mat)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>toefl::colormap_f</name>
    <filename>structtoefl_1_1colormap__f.html</filename>
    <member kind="variable">
      <type>float</type>
      <name>R</name>
      <anchorfile>structtoefl_1_1colormap__f.html</anchorfile>
      <anchor>a50da233aba45d1b1e358ec143047b954</anchor>
      <arglist>[256]</arglist>
    </member>
    <member kind="variable">
      <type>float</type>
      <name>G</name>
      <anchorfile>structtoefl_1_1colormap__f.html</anchorfile>
      <anchor>a30dec96e645ebfc91592a2aa57e2d774</anchor>
      <arglist>[256]</arglist>
    </member>
    <member kind="variable">
      <type>float</type>
      <name>B</name>
      <anchorfile>structtoefl_1_1colormap__f.html</anchorfile>
      <anchor>ada8d389103c79964956f08304b16fdba</anchor>
      <arglist>[256]</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>toefl::colormap_ext</name>
    <filename>structtoefl_1_1colormap__ext.html</filename>
    <member kind="variable">
      <type>float</type>
      <name>R</name>
      <anchorfile>structtoefl_1_1colormap__ext.html</anchorfile>
      <anchor>a0592005c04cdac13e21716b3f32e203c</anchor>
      <arglist>[384]</arglist>
    </member>
    <member kind="variable">
      <type>float</type>
      <name>G</name>
      <anchorfile>structtoefl_1_1colormap__ext.html</anchorfile>
      <anchor>aaaa21f6f2d96b434eb5c38eafafe77cd</anchor>
      <arglist>[384]</arglist>
    </member>
    <member kind="variable">
      <type>float</type>
      <name>B</name>
      <anchorfile>structtoefl_1_1colormap__ext.html</anchorfile>
      <anchor>ad407e3d27a8b079d2888627dc0c57d72</anchor>
      <arglist>[384]</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>toefl::Timer</name>
    <filename>classtoefl_1_1_timer.html</filename>
    <member kind="function">
      <type>void</type>
      <name>tic</name>
      <anchorfile>classtoefl_1_1_timer.html</anchorfile>
      <anchor>a58b8b58e5f80b1055d3e5bc8ac8787b3</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>toc</name>
      <anchorfile>classtoefl_1_1_timer.html</anchorfile>
      <anchor>a0bec631747d31e3ce359bed22e4efa5b</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>diff</name>
      <anchorfile>classtoefl_1_1_timer.html</anchorfile>
      <anchor>afb22394b0cb0f25a8aa83b9bf02ae9c0</anchor>
      <arglist>()</arglist>
    </member>
  </compound>
  <compound kind="dir">
    <name>/home/matthias/feltor/inc</name>
    <path>/home/matthias/feltor/inc/</path>
    <filename>dir_bfccd401955b95cf8c75461437045ac0.html</filename>
    <dir>/home/matthias/feltor/inc/toefl</dir>
  </compound>
  <compound kind="dir">
    <name>/home/matthias/feltor/inc/toefl</name>
    <path>/home/matthias/feltor/inc/toefl/</path>
    <filename>dir_bab826ae084583e2fc8f2a1d4f46d11d.html</filename>
    <file>arakawa.h</file>
    <file>dft_dft.h</file>
    <file>dft_drt.h</file>
    <file>drt_dft.h</file>
    <file>drt_drt.h</file>
    <file>exceptions.h</file>
    <file>fft.h</file>
    <file>ghostmatrix.h</file>
    <file>init.h</file>
    <file>karniadakis.h</file>
    <file>karniadakis2.h</file>
    <file>matrix.h</file>
    <file>matrix_array.h</file>
    <file>message.h</file>
    <file>padding.h</file>
    <file>quadmat.h</file>
    <file>texture.h</file>
    <file>timer.h</file>
    <file>toefl.h</file>
    <file>toefl_doc.h</file>
  </compound>
  <compound kind="page">
    <name>index</name>
    <title></title>
    <filename>index</filename>
  </compound>
</tagfile>
