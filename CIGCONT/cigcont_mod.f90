MODULE cigcont_ffd_mod
  USE rsf
  USE, INTRINSIC :: iso_c_binding
  USE, INTRINSIC :: iso_fortran_env

  IMPLICIT NONE

  TYPE cigcont_t
   INTEGER :: nx,nz
   INTEGER :: nv,nsnap,ngstore
   REAL(KIND=4) :: dv,dz
   REAL(KIND=4) :: x0,z0
   REAL(KIND=4) :: v_min,v_max,v_ref
  END TYPE cigcont_t

CONTAINS

  SUBROUTINE fd_continuation(cig,xoff,press,press_cube)
    IMPLICIT NONE
    TYPE(cigcont_t), INTENT(IN) :: cig
    REAL(KIND=4), INTENT(IN), DIMENSION(cig%nx) :: xoff
    REAL(KIND=4), DIMENSION(cig%nz,cig%nx) :: press
    REAL(KIND=4), INTENT(OUT), DIMENSION(cig%nz,cig%nx,cig%ngstore) :: press_cube
    REAL(KIND=4), DIMENSION(cig%nz,cig%nx) :: press_n
    REAL(KIND=4), ALLOCATABLE :: fd_mat(:,:),fdl_mat(:,:)
    REAL(KIND=4), DIMENSION(cig%nz) :: z,rfac,fd_vec

    REAL(KIND=4), PARAMETER :: z0_cont=3.0
    INTEGER, PARAMETER :: m1=1,m2=1

    INTEGER  :: ix,iz,iz0,iv,ivs,ierr
    REAL(KIND=4) :: x,v_0,v_1,vfac,v_ini
    REAL(KIND=4) :: mu

    ! contante da malha:
    mu=0.25*cig%dv/cig%dz

    IF(cig%dv<0)THEN
       v_ini=cig%v_max
    ELSE 
       v_ini=cig%v_min
    END IF


    ALLOCATE(fd_mat(cig%nz,m1+m2+1),fdl_mat(cig%nz,m1+m2+1),STAT=ierr)
    IF(ierr /= 0) PRINT*,'Falha na alocação para fd_mat ou fdl_mat!'
 
    ivs=1;
    press_cube(:,:,ivs)=press(:,:)
    
    PRINT *, 'Continuing the CIG ...'

    iz0=FLOOR(z0_cont/cig%dz+1)+1 

    Loop_velocidade:DO iv=1,cig%nv

       v_0=v_ini+REAL(iv-1)*cig%dv
       v_1=v_0+cig%dv

       vfac=2*mu/(v_0+v_1)

       Loop_x: DO ix=1,cig%nx

          ! lado direito do Sistema linear

          x=xoff(ix)/2.0 !ATENÇÂO! meio offset

          DO iz=1,cig%nz
             z(iz)=cig%z0+(iz-1)*cig%dz
          END DO

          rfac=vfac*(x*x+z*z)/z

          fd_vec=0.d0;
          fd_mat=0.d0;
          fdl_mat=0.d0;

          ! primeiro termo:
          fd_vec(1:iz0-1)=0.d0
          DO iz=iz0,cig%nz-1
             fd_vec(iz)=rfac(iz)*(press(iz-1,ix)-press(iz+1,ix))+press(iz,ix);
          END DO
          fd_vec(cig%nz)=rfac(cig%nz)*press(cig%nz-1,ix)+press(cig%nz,ix)

          fd_mat(1:iz0-1,2)=1.0;

          DO iz=iz0,cig%nz-1
             fd_mat(iz,1)=-rfac(iz);
             fd_mat(iz,2)=1.0;
             fd_mat(iz,3)=rfac(iz);
          END DO

          fd_mat(cig%nz,1)=-rfac(cig%nz);
          fd_mat(cig%nz,2)=1.0;

          CALL cbandec(cig%nz,cig%nz,fd_mat,m1,m2,fdl_mat) 
          CALL cbanbks(cig%nz,cig%nz,fd_mat,m1,m2,fdl_mat,fd_vec)

          press_n(:,ix)=fd_vec(:);

       END DO Loop_x

       ! atualiza imagem:
       press(:,:)=press_n(:,:);


       ! amazenamento no cubo de imagem:
       IF (MOD(iv,cig%nsnap)==0) THEN
          ivs=ivs+1
          press_cube(:,:,ivs) = press(:,:)
          WRITE(ERROR_UNIT,*)'Frame ',ivs,' corresponds to velocity ',v_1
       END IF

    END DO Loop_velocidade

  END SUBROUTINE fd_continuation


  SUBROUTINE cbandec(nalloc,n,a,m1,m2,al)
    !
    ! Decomposicao LU para sistemas bandeados
    !
    !
    ! nalloc = dimensao fisica alocada para as linhas da  matrix a
    ! n      = dimensao logica para o sistema linear (<=nalloc)
    ! a(:,:) = aranjo para armazenamento da matrix bandeada  
    ! m1     = banda inferior
    ! m2     = banda superior
    ! al(:,:)= area de trabalho da mesma dimensao de a(:,:)
    !
    INTEGER, INTENT(in) :: nalloc,n
    INTEGER, INTENT(in) :: m1,m2
    REAL(KIND=4), INTENT(inout) :: a(nalloc,m1+m2+1)
    REAL(KIND=4), INTENT(out) :: al(nalloc,m1)

    INTEGER  :: i,k,l,mm
    REAL(KIND=4) :: dum

    mm = m1+m2+1
    DO i=1,m1
       a(i,:) = EOSHIFT(a(i,:),shift=m1+1-i)
    END DO

    DO k=1,n
       l = MIN(m1+k,n)
       DO i=k+1,l
          dum         = a(i,1)/a(k,1)
          al(k,i-k)   = dum
          a(i,1:mm-1) = a(i,2:mm) - dum * a(k,2:mm)
          a(i,mm)     = 0.0
       END DO
    END DO
  END SUBROUTINE cbandec

  SUBROUTINE cbanbks(nalloc,n,a,m1,m2,al,b)
    !
    ! Solucao do sistema linear usando decomposicao LU
    !
    !
    ! nalloc = dimensao fisica alocada para as linhas da  matrix a
    ! n      = dimensao logica para o sistema linear (<=nalloc)
    ! a(:,:) = aranjo para armazenamento da matrix bandeada  
    ! m1     = banda inferior
    ! m2     = banda superior
    ! al(:,:)= area de trabalho da mesma dimensao de a(:,:)
    ! b(:)   = lado direito do sistema linear
    !
    INTEGER, INTENT(in) :: nalloc,n
    INTEGER, INTENT(in) :: m1,m2
    REAL(KIND=4), INTENT(in) :: a(nalloc,m1+m2+1)
    REAL(KIND=4), INTENT(in) :: al(nalloc,m1)
    REAL(KIND=4), INTENT(inout) :: b(n)

    INTEGER  :: i,k,l,mm

    mm = m1+m2+1
    DO k=1,n
       l = MIN(k+m1,n)
       b(k+1:l) = b(k+1:l) - al(k,1:l-k)*b(k)
    END DO

    DO i=n,1,-1
       l=MIN(mm,n-i+1)
       b(i) = (b(i)-DOT_PRODUCT(a(i,2:l),b(i+1:i+l-1)))/a(i,1)
    END DO

  END SUBROUTINE cbanbks

END MODULE cigcont_ffd_mod
