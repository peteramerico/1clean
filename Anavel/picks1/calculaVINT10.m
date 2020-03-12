    function calculaVINT10(suave,setini,xfinal,velfile,PATH)
%calculaVINT10(suave,setini,xfinal,velfile,velfilein,PATH)

%PATH='/Users/peter/Documents/2019.1/projeto-mestrado/peter/layer-strp/teste-fim/Anavel/'

%xina=250;dxana=250;xfna=8750;
xina=25;dxana=500;xfna=25525;
pvec=xina:dxana:xfna;
zini=zeros(size(pvec));
vini=1500*ones(size(pvec));
nn=length(pvec);


if nargin < 5;
    PATH='';
    if nargin <4;
        if nargin < 3;
            xfinal=25850;
            %xfinal=30850;
        end
        if nargin < 2;
            setini=0;
        end
        if nargin < 1;
            suave = 0;
        end
        if (suave==1)
            char='_smooth';
        else
            char='';
        end
        velfile=strcat(['vana01_nearest',char,'.bin']);
    end
end


if setini==1;
    velfilesetini=strcat('vana01_setini',char,'.bin');
end

if exist('ini.txt','file');
    velfileinsetini=strcat('vana01_setini.bin');
end
if exist('vana01_nearest_smooth.bin','file');
    velfilein=strcat('vana01_nearest_smooth.bin');
end

%dz=3;dx=25;
dz=10;dx=50;
%xini=0.0;xfinal=9025;
xini=0.0;
%xfinal=25850;
%xfinal=30850;
%zini=0.0;zfinal=3000.0;
zini0=0.0;zfinal=3000.0;
newp=(xini:dx:xfinal);nnp=length(newp);

vfinal=4500.0;

zinterp=(zini0:dz:zfinal);nzint=length(zinterp);

if exist('velfilein','var');
    fid = fopen(velfilein,'rb');
    if fid < 0; error(strcat(['file ',velfilein,' not found.'])); end;
    veloINTant=fread(fid,[nzint,nnp],'float');
    fclose(fid);
else
    veloINTant=2000*ones([nzint nnp]);
end;

if exist('ini.txt','file');
    ini=load('ini.txt');
    
    ini2=ini;
    ini2(:,1)=0:50:xfinal;
    ini3=ini2;
    ini3(:,2)=(ini2(:,2)*dz)-dz;
    
    fid1 = fopen(velfileinsetini,'rb');
    if fid1 < 0; error(strcat(['file ',velfileinsetini,' not found.'])); end;
    veloINTsetini=fread(fid1,[nzint,nnp],'float');
    fclose(fid1);
    
    zini1=interp1(ini2(:,1),ini2(:,2),pvec,'linear','extrap');
    zini=(zini1*dz)-dz;
    [xx,zz]=meshgrid(newp,zinterp);
    %    velm=zeros(size(veloINTant));
    %    for jj=1:nnp;
    %        aux = cumsum(1./veloINTant(:,jj));
    %        velm(:,jj)=[1:nzint]'./aux;
    %    end;
    %    vini=interp2(xx,zz,velm,pvec,zini);
    vini=interp2(xx,zz,veloINTsetini,pvec,zini);
    velant = 1;
else
    velant = 0;
end
newzini=interp1(pvec,zini,newp,'linear','extrap');
%if velant==1;
%    for ix=1:length(newp);
%        ii=find(newp(ix)==ini(:,1));
%        if ~isempty(ii);
%            newzini(ix)=ini(ii,2);
%        end
%    end
%end

j=0;

yint=ones(size(1:nzint));
yprof=ones(size(1:nzint));
vfinalp=ones(size(veloINTant));

for p=pvec
    clear dado
    j=j+1;
    ji=(j-1)*(nzint);
    display(strcat(['Position no. ',num2str(j),' of ',num2str(nn)]));
    
    %fid2 = fopen(strcat(strcat(strcat(PATH,'pick'),int2str(p)),'.rsf'), 'r');
    %dado = fscanf(fid2, '%g %g %g', [3 inf]);
    dado=load('-ascii',strcat(strcat(strcat(PATH,'pick'),int2str(p)),'.rsf'));

    %%dado has 3 rows and the third has only zeros in it. This happens
    %%because all pick files have the third column filed with zeros.
    %fclose(fid2);
    
    %%The pick function basically organizes the dado function in the
    %%correct way for us to use here. pick puts zini(0.0) as the first
    %%element of the first row, puts vini(1500) as the first element of the
    %%second row and after placing zini and vini it repeats the first and
    %%second row of dado in the same order as it appeared in dado. pick
    %%ignores the 3rd row of dado, which had zeros only. So, pick has
    %%depths in the first row and velocities in the second row. Then in the
    %%first column we have 0 depth in the first row and its corresponding
    %%velocitie (1500) in the second row. This correspondence between
    %%rows continues for each column.
    
    
    %ndado diz quantas picagens foram feitas no semblance
    ndado=size(dado,1);
    
    tamanho1=ones(1,2);
    
    if ndado==1;
        %if size(dado,1)==size(tamanho1);
            pick=[zini(j) vini(j);dado(1,1)' dado(1,2)']';
        %end
    end
    if ndado==2
        if velant==1;
            %iii=find(dado(1,1)~=zini(j));
            pick=[zini(j) vini(j);dado(2,1)' dado(2,2)']';
            %tpick uso para salvar o arquivo pick como esta na iteracao atual
            %do layer striping
            %tpick=[zini(j) dado(1,iii+1)';vini(j) dado(2,iii+1)';0 0]';
        end
    end
    
    %prestar atencao aqui quando for usar 3 picks pra ver se esta
    %funcionando direito
    tamanho3=ones(3,2);
    if size(dado)==size(tamanho3);
        %iii=find(dado(1,2)~=zini(j));
        pick=[zini(j) vini(j);dado(3,1)' dado(3,2)']';
        
        %tpick=[dado(1,1) zini(j) dado(1,iii+2)';dado(2,1) vini(j) dado(2,iii+2)';0 0 0]';
    end
    
    %if velant==1;
    %    filenamesave = ['tpick' num2str(p) '.rsf' ];
    %    save(filenamesave,'-ascii','tpick');
    %end
    npick=length(pick);
    
    
    m=0;
    for prof=zini0:dz:zfinal
        m=m+1;
        for k=2:npick
            if velant == 1;
                yint(m)=interp2(xx,zz,veloINTsetini,p,prof);
            end
            if (prof>=pick(1,k-1) && prof<=pick(1,k))
                
                yint(m)=pick(2,k);
                
                
                %yint(m)=(pick(1,k)-pick(1,k-1))/(pick(1,k)/pick(2,k)-pick(1,k-1)/pick(2,k-1));
                %den=max((pick(1,k)-pick(1,k-1))/3000,(pick(1,k)/pick(2,k)-pick(1,k-1)/pick(2,k-1)));
                %yint(m)=(pick(1,k)-pick(1,k-1))/den;
                
            end
        end
        
        if (prof>pick(1,npick) && prof<=zfinal)
            
            if setini==1
                yint(m)=vfinal;
            else
                yint(m)=yint(m-1);
            end
            
        end
        
        yprof(m)=prof;
        
    end
    vv(1:3,ji+1:ji+nzint)=[yprof' ones(nzint,1)*p yint']';
end
nn=j;

if (suave==1)
    
    mmp=medfilt2(reshape(vv(3,:),nzint,nn),'symmetric');
    xxp=reshape(vv(2,:),nzint,nn);
    %mmp=reshape(vv(3,:),nzint,nn);
    %xxp=reshape(vv(2,:),nzint,nn);
    
    for k=1:nzint
        vfinalp(k,1:nnp)=interp1(xxp(k,:),mmp(k,:),newp','nearest','extrap');
    end
    
    PSF = fspecial('gaussian',21,7);
    
    if setini==1;
        vfin=zeros(size(newp));
        for ix=1:length(newp);
            vfin(ix)=max(find(vfinalp(2:end,ix)-vfinalp(1:end-1,ix)>50))+1;
        end
    end
    
    veloINT=reshape(imfilter(vfinalp,PSF,'conv','symmetric'),nzint,nnp);
    
    %veloINT=reshape(vfinalp,nzint,nnp);
    
    if velant == 1;
        veloINTnew=veloINTsetini;
    else
        veloINTnew=veloINT;
    end
    
    if setini==1;
        if size(dado)==size(tamanho1);
            for j=1:nnp;
                ii=find(zinterp>=newzini(j) & zinterp<(vfin(j)*dz)-dz);
                %iii=find(zinterp<(vfin(j)*dz)-dz);
                veloINTnew(ii,j)=veloINTant(ii,j)+veloINT(ii,j)-2000;
            end
        else
            for j=1:nnp;
                ii=find(zinterp>=ini3(j,2) & zinterp<(vfin(j)*dz)-dz);
                veloINTnew(ii,j)=veloINTant(ii,j)+veloINT(ii,j)-2000;
            end
        end
    else
        if size(dado)==size(tamanho1);
            for j=1:nnp;
                ii=find(zinterp>=newzini(j));
                veloINTnew(ii,j)=veloINTant(ii,j)+veloINT(ii,j)-2000;
            end
        else
            for j=1:nnp;
                ii=find(zinterp>=ini3(j,2));
                veloINTnew(ii,j)=veloINTant(ii,j)+veloINT(ii,j)-2000;
            end
        end
    end
    
    vnew=medfilt2(veloINTnew,'symmetric');
    %PSF = fspecial('gaussian',21,7);
    veloINTnow=reshape(imfilter(vnew,PSF,'conv','symmetric'),nzint,nnp);
    veloINT=reshape(veloINTnow,(nzint)*nnp,1);
    
else
    
    mmp=reshape(vv(3,:),nzint,nn);
    xxp=reshape(vv(2,:),nzint,nn);%yyp=reshape(vv(1,:),nzint,nn);
    %    newp=(xini:dx:xfinal-dx);nnp=length(newp);
    
    for k=1:nzint
        %xxpnew(k,1:nnp)=newp';
        %yypnew(k,1:nnp)=ones(nnp,1)*yprof(k);
        vfinalp(k,1:nnp)=interp1(xxp(k,:),mmp(k,:),newp','nearest','extrap');
    end
    
    if setini==1;
        vfin=zeros(size(newp));
        for ix=1:length(newp);
            vfin(ix)=max(find(vfinalp(2:end,ix)-vfinalp(1:end-1,ix)>50))+1;
        end
    end
    
    veloINT=reshape(vfinalp,nzint,nnp);
    
    if velant == 1;
        veloINTnew=veloINTsetini;
    else
        veloINTnew=veloINT;
    end
    
    if setini==1;
        if size(dado)==size(tamanho1);
            for j=1:nnp;
                ii=find(zinterp>=newzini(j) & zinterp<(vfin(j)*dz)-dz);
                veloINTnew(ii,j)=veloINTant(ii,j)+veloINT(ii,j)-2000;
            end
        else
            for j=1:nnp;
                ii=find(zinterp>=ini3(j,2) & zinterp<(vfin(j)*dz)-dz);
                veloINTnew(ii,j)=veloINTant(ii,j)+veloINT(ii,j)-2000;
            end
        end
    else
        if size(dado)==size(tamanho1);
            for j=1:nnp;
                ii=find(zinterp>=newzini(j));
                veloINTnew(ii,j)=veloINTant(ii,j)+veloINT(ii,j)-2000;
            end
        else
            for j=1:nnp;
                ii=find(zinterp>=ini3(j,2));
                veloINTnew(ii,j)=veloINTant(ii,j)+veloINT(ii,j)-2000;
            end
        end
    end
    
        
    veloINT=reshape(veloINTnew,(nzint)*nnp,1);
    
end

if exist('velfilesetini','var');
    fid = fopen(velfilesetini,'wb');
    fwrite(fid,veloINT,'float');
    fclose(fid);
else
    fid = fopen(velfile,'wb');
    fwrite(fid,veloINT,'float');
    fclose(fid);
end