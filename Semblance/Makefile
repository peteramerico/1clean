FC = gfortran
OPT=-O3 -mtune=native
INC_DIR=-I $(RSFROOT)/include
LIB_DIR=-L $(RSFROOT)/lib -lrsff90 -lrsf -lfftw -lm

all: sembl

sembl: semblance.f90
	$(FC) semblance.f90 $(INC_DIR) $(LIB_DIR) $(OPT) -W -Wall -Wextra -fopenmp -g -o sembl

clean: 
	rm -f *.o *.mod *.swp *~
