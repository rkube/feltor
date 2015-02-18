#!/bin/bash

#pay attention on name collisions through tag files
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
    echo "TAGFILES = $tagfiles") | doxygen - 
done;

