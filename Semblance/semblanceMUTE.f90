PROGRAM sembl
  USE rsf
  USE, INTRINSIC :: iso_c_binding
  USE, INTRINSIC :: iso_fortran_env

  IMPLICIT NONE
  TYPE(file) :: name_in,name_out
 
  INTEGER :: nz,nx,nv
  REAL(KIND=4) :: oz,ox,ov,dz,dx,dv,h,ll,kk
  REAL(KIND=4) :: soma,somasq,termo1,termo2
  
  INTEGER :: i,j,k,ierr
  INTEGER :: l,na

  REAL, DIMENSION(:), ALLOCATABLE :: press
  REAL, DIMENSION(:,:), ALLOCATABLE :: press_cube

  CALL sf_init()
  
  name_in=rsf_input()
  IF (sf_float /= gettype(name_in)) CALL sf_error("Need float type")

  CALL from_par(name_in,"n1",nz); CALL from_par(name_in,"d1",dz); CALL from_par(name_in,"o1",oz);
  CALL from_par(name_in,"n2",nx); CALL from_par(name_in,"d2",dx); CALL from_par(name_in,"o2",ox);
  CALL from_par(name_in,"n3",nv); CALL from_par(name_in,"d3",dv); CALL from_par(name_in,"o3",ov);

  WRITE(ERROR_UNIT,*)nz,nx,nv,dz,dx,dv,oz,ox,ov

  CALL from_par("janela", na,33);
!  janela=5 no SConstruct dentro da /Anavel

  !ALLOCATE(press_cube(601,nx),STAT=ierr)
  ALLOCATE(press_cube(nz,nx),STAT=ierr)
  IF(ierr /= 0) PRINT*,'Falha na alocação para press_cube!'
  press_cube=0.0

  
  name_out=rsf_output()

  !CALL to_par(name_out,"n1",601); CALL to_par(name_out,"d1",dz); CALL to_par(name_out,"o1",oz);
  CALL to_par(name_out,"n1",nz); CALL to_par(name_out,"d1",dz); CALL to_par(name_out,"o1",oz); 
  CALL to_par(name_out,"n2",nv); CALL to_par(name_out,"d2",dv); CALL to_par(name_out,"o2",ov); 
  CALL to_par(name_out,"n3",1);

  !ALLOCATE(press(601),STAT=ierr)
  ALLOCATE(press(nz),STAT=ierr)
  IF(ierr /= 0) PRINT*,'Falha na alocação para press!'
  press=0.0

  
  WRITE(ERROR_UNIT,*)'numero de amostras de meio janela',na
  
! Se quisesse fazer o semblance so ate a velocidade 3000 usaria esse do abaixo e no call to_par do n2 usaria 161 tambem
  !DO i=1,161
  DO i=1,nv
     CALL rsf_read(name_in,press_cube)
     !DO j=na+1,601-na
     DO j=na+1,nz-na
        termo1=0.0
        termo2=0.0
        DO l=j-na,j+na
           soma=0.0
           somasq=0.0
! P/ mute: ll, h (h que eh a reta do mute que delimita ate onde faz o calculo do semblance e ll p/ dar o valor da profundidade-0,3,6,9,12,15,...,3000).
           ll=(l*dz)-dz
           h=(0.2*ll)+2500
           DO k=1,nx
! P/ mute: kk p/ dar o valor do offset-50,150,250,...,4950. O if serve pra fazer o calculo do semblance somente dentro da regiao que nao deve ter mute (uma reta delimita essa area).
           kk=(k*dx)-ox
           IF (kk<=h) THEN
                 soma=soma+press_cube(l,k)
                 somasq=somasq+press_cube(l,k)*press_cube(l,k)
           END IF
           END DO
           termo1=termo1+soma*soma
           termo2=termo2+nx*somasq
        END DO
        press(j)=termo1/termo2
     END DO
     CALL rsf_write(name_out,press)
  END DO

  IF(ALLOCATED(press))DEALLOCATE(press,STAT=ierr)
  IF(ALLOCATED(press_cube))DEALLOCATE(press_cube,STAT=ierr)


END PROGRAM sembl
