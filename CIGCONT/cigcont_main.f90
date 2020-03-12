PROGRAM cigcont_main
  USE rsf
  USE cigcont_ffd_mod

  IMPLICIT NONE
  TYPE(file) :: name_in,name_out
  
  TYPE(cigcont_t) :: cig
 
  INTEGER :: nz,nx
  REAL(KIND=4) :: oz,ox,dz,dx
  REAL(KIND=4) :: v_min,v_max,v_ref,dv
  REAL(KIND=4) :: arg,ov
  INTEGER :: nsnap,ngstore,ngstore1,ngstore2
  
  INTEGER :: i,ierr
  INTEGER :: iv,nv
  REAL(KIND=4), ALLOCATABLE :: press(:,:),press1(:,:),press2(:,:)
  REAL(KIND=4), ALLOCATABLE :: press_cube(:,:,:),press_tmp1(:,:,:),press_tmp2(:,:,:)
  REAL(KIND=4), ALLOCATABLE :: xoff(:)

  CALL sf_init()
  
  name_in=rsf_input()
  IF (sf_float /= gettype(name_in)) CALL sf_error("Need float type")
  
  CALL from_par(name_in,"n1",nz); CALL from_par(name_in,"d1",dz); CALL from_par(name_in,"o1",oz); 
  CALL from_par(name_in,"n2",nx); CALL from_par(name_in,"d2",dx); CALL from_par(name_in,"o2",ox); 

  CALL from_par("vi", v_min,1400.0);
  CALL from_par("vr", v_ref,1500.0);
  CALL from_par("vf", v_max,2000.0);
  CALL from_par("dv", dv,25.0);
  CALL from_par("nsp", nsnap,2);

  cig%nz=nz;cig%dz=dz
  cig%x0=ox;cig%z0=oz
  cig%nx=nx
  cig%nsnap=nsnap


  ALLOCATE(press(nz,nx),xoff(nx),STAT=ierr)
  IF(ierr /= 0) PRINT*,'Falha na alocação para press ou xoff!'
  ALLOCATE(press1(nz,nx),press2(nz,nx),STAT=ierr)
  IF(ierr /= 0) PRINT*,'Falha na alocação para press ou xoff!'

  CALL rsf_read(name_in,press)
  DO i=1,nx
     xoff(i)=(i-1)*dx+ox
  END DO
      
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  press1=0
  press1=press

  cig%dv=-dv
  cig%v_min=v_min;cig%v_max=v_ref
     
  !número de passos na velocidade para trás
  nv=FLOOR((cig%v_max-cig%v_min)/ABS(dv)+0.5)
  cig%nv=nv
  !número de seções armazenadas na continuação para trás
  ngstore1=nv/nsnap+1
  cig%ngstore=ngstore1
     
  ALLOCATE(press_tmp1(nz,nx,ngstore1),STAT=ierr)
  IF(ierr /= 0) PRINT*,'Falha na alocação para press_cube!'
  
  press_tmp1=0.
!  WRITE(ERROR_UNIT,*)cig%ngstore,cig%dv
  CALL fd_continuation(cig,xoff,press1,press_tmp1)     

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  press2=0
  press2=press
 
  cig%dv=dv
  cig%v_min=v_ref;cig%v_max=v_max

  !número de passos na velocidade para frente   
  nv=FLOOR((cig%v_max-cig%v_min)/ABS(dv)+0.5)
  cig%nv=nv
    !número de seções armazenadas na continuação para frente
  ngstore2=nv/nsnap+1
  cig%ngstore=ngstore2
     
  ALLOCATE(press_tmp2(nz,nx,ngstore2),STAT=ierr)
  IF(ierr /= 0) PRINT*,'Falha na alocação para press_cube!'

  press_tmp2=0.
  CALL fd_continuation(cig,xoff,press,press_tmp2)     

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  ngstore=ngstore1+ngstore2-1

  WRITE(ERROR_UNIT,*)ngstore
  ALLOCATE(press_cube(nz,nx,ngstore),STAT=ierr)
  IF(ierr /= 0) PRINT*,'Falha na alocação para press_cube!'
  press_cube=0.
  press_cube(:,:,1:ngstore1)=press_tmp1(:,:,ngstore1:1:-1)
  press_cube(:,:,ngstore1+1:ngstore)=press_tmp2(:,:,2:ngstore2)

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  name_out=rsf_output()

  ov=v_min;nv=ngstore;dv=dv*nsnap
  CALL to_par(name_out,"n1",nz); CALL to_par(name_out,"d1",dz); CALL to_par(name_out,"o1",oz);
  CALL to_par(name_out,"n2",nx); CALL to_par(name_out,"d2",dx); CALL to_par(name_out,"o2",ox);
  CALL to_par(name_out,"n3",nv); CALL to_par(name_out,"d3",dv); CALL to_par(name_out,"o3",ov);
 
  DO iv=1,ngstore
     CALL rsf_write(name_out,press_cube(:,:,iv))     
  END DO

  IF(ALLOCATED(press))DEALLOCATE(press,STAT=ierr)
  IF(ALLOCATED(xoff))DEALLOCATE(xoff,STAT=ierr)
  IF(ALLOCATED(press_cube))DEALLOCATE(press_cube,STAT=ierr)
  IF(ALLOCATED(press_tmp1))DEALLOCATE(press_tmp1,STAT=ierr)
  IF(ALLOCATED(press_tmp2))DEALLOCATE(press_tmp2,STAT=ierr) 

END PROGRAM cigcont_main
