
.PHONY: doc clean
doc:
	mkdir -p inc
	mkdir -p src
	(cat ../inc/file/Doxyfile ; echo "INPUT = ../inc/dg/ \ ../inc/dg/backend"; echo "OUTPUT_DIRECTORY = ./inc/dg/ " ) |doxygen - 
	(cat ../inc/file/Doxyfile ; echo "INPUT = ../inc/file/"; echo "OUTPUT_DIRECTORY = ./inc/file/ " ) |doxygen - 
	(cat ../inc/file/Doxyfile ; echo "INPUT = ../inc/toefl/"; echo "OUTPUT_DIRECTORY = ./inc/toefl/ " ) |doxygen - 
	(cat ../inc/file/Doxyfile ; echo "INPUT = ../src/feltor/"; echo "OUTPUT_DIRECTORY = ./src/feltor/ " ) |doxygen - 
	(cat ../inc/file/Doxyfile ; echo "INPUT = ../src/feltor2D/"; echo "OUTPUT_DIRECTORY = ./src/feltor2D/ " ) |doxygen - 
	(cat ../inc/file/Doxyfile ; echo "INPUT = ../src/solovev/"; echo "OUTPUT_DIRECTORY = ./src/solovev/ " ) |doxygen - 

clean:
	rm -rf inc/file inc/dg inc/toefl src/feltor src/feltor2D src/solovev 
