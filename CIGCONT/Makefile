FC = gfortran
OPT=-mtune=native
INC_DIR=-I$(RSFROOT)/include
LIB_DIR=-L$(RSFROOT)/lib -lrsff90 -lrsf -lfftw -lm

all: cigcont cigcont_mod.o

cigcont:cigcont_mod.o cigcont_main.f90
	$(FC) cigcont_main.f90 $(INC_DIR) $(LIB_DIR) -o cigcont cigcont_mod.o

cigcont_mod.o:cigcont_mod.f90
	$(FC) $(INC_DIR) -c cigcont_mod.f90 -W -Wall -Wextra -g

clean: 
	rm -f *.o *.mod *.swp *~
