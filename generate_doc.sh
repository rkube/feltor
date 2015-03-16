#!/bin/bash
#this file automatically loops over inc and src directories and runs doxygen
# on the Doxyfiles and outputs documentation in the current directory
# It generates tag files so that src documentation can link to inc documentations

#pay attention on name collisions in docus through tag files
include="inc/dg inc/file inc/toefl src/solovev"
src="src/feltor src/feltor2D"
all="$include $src"
tagfiles=""

#first generate tag files for include components
for i in $include;
do (cat ../$i/Doxyfile; \
	echo "INPUT = ../$i/"; \
    echo "GENERATE_HTML=NO";\
	echo "OUTPUT_DIRECTORY = ./$i/"; \
    echo "GENERATE_TAGFILE = ./${i}.tag" ) | doxygen - ;
    tagfiles="$tagfiles ./${i}.tag=../../../${i}/html"
done;

#generate independent documentations
for i in $include;
do (cat ../$i/Doxyfile; \
	echo "INPUT = ../$i/"; \
	echo "MATHJAX_RELPATH = http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"; \
    echo "OUTPUT_DIRECTORY = ./$i/")  \
    | doxygen - ;
done;

#generate dependent documentations
for i in $src;
do (cat ../$i/Doxyfile; \
	echo "INPUT = ../$i/"; \
	echo "OUTPUT_DIRECTORY = ./$i/"; \
    echo "EXTERNAL_GROUPS=NO" ;\
    echo "EXTERNAL_PAGES=NO" ;\
	echo "MATHJAX_RELPATH = http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"; \
    echo "TAGFILES = $tagfiles") | doxygen - 
done;

