device = omp

#configure machine 
include ../config/default.mk
include ../config/*.mk 
include ../config/devices/devices.mk

INCLUDE+= -I../inc/# include files libs
INCLUDE+= -I../src/# include files from source code

TARGETS =  compare histdiag ncdiag filamentdiag fftwdiag crosscoherencdiag feltorSesoldiag feltorShwdiag feltorSHdiag feltordiag vmaxnc feltorSHvmaxdiag toeflRdiag impRdiag

all: $(TARGETS)


ncdiag: ncdiag.cpp
	$(CC) $(OPT) $(CFLAGS) $< -o $@ $(INCLUDE) $(LIBS) -DDG_DEBUG -g
filamentdiag: filamentdiag.cu
	$(CC) $(OPT) $(CFLAGS) $< -o $@ $(INCLUDE) $(LIBS) 
feltordiag: feltordiag.cu
	$(CC) $(OPT) $(CFLAGS) $< -o $@ $(INCLUDE) $(LIBS) -g 
feltorSHdiag: feltorSHdiag.cu
	$(CC) $(OPT) $(CFLAGS) $< -o $@ $(INCLUDE) $(LIBS) $(JSONLIB) 
toeflRdiag: toeflRdiag.cu
	$(CC) $(OPT) $(CFLAGS) $< -o $@ $(INCLUDE) $(LIBS) $(JSONLIB)
toeflEPdiag: toeflEPdiag.cu
	$(CC) $(OPT) $(CFLAGS) $< -o $@ $(INCLUDE) $(LIBS) $(JSONLIB)
impRdiag: impRdiag.cu
	$(CC) $(OPT) $(CFLAGS) $< -o $@ $(INCLUDE) $(LIBS) $(JSONLIB) -g
feltorSHvmaxdiag: feltorSHvmaxdiag.cu
	$(CC) $(OPT) $(CFLAGS) $< -o $@ $(INCLUDE) $(LIBS) $(JSONLIB)
vmaxnc: vmaxnc.cu
	$(CC) $(OPT) $(CFLAGS) $< -o $@ $(INCLUDE) $(LIBS) 
fftwdiag: fftwdiag.cpp
	$(CC) $(OPT) $(CFLAGS) -std=c++0x $< -o $@ $(INCLUDE) $(LIBS)  -lfftw3
histdiag: histdiag.cpp
	$(CC) $(OPT) $(CFLAGS) $< -o $@ $(INCLUDE) $(LIBS) -DDG_DEBUG -g
compare: compare.cpp
	$(CC) $(OPT) $(CFLAGS) $< -o $@ $(INCLUDE) $(LIBS) -DDG_DEBUG -g
crosscoherencdiag: crosscoherencdiag.cpp
	$(CC) $(OPT) $(CFLAGS) $< -o $@ $(INCLUDE) $(LIBS) -DDG_DEBUG -g
feltorSesoldiag: feltorSesoldiag.cpp
	$(CC) $(OPT) $(CFLAGS) $< -o $@ $(INCLUDE) $(LIBS) -DDG_DEBUG -g
feltorShwdiag: feltorShwdiag.cpp
	$(CC) $(OPT) $(CFLAGS) $< -o $@ $(INCLUDE) $(LIBS) $(JSONLIB) -DDG_DEBUG -g

.PHONY: clean

clean:
	rm -f $(TARGETS)
