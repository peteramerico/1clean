function usingdibscan(iteracao,estagio,picksFiguras,epsilon,MinPts,xstart,dx,xend)
%usingdibscan(iteracao,estagio,picksFiguras,epsilon,MinPts,xstart,dx,xend)

if nargin<8
    xend=52;
    if nargin<7
        dx=1;
        if nargin<6
            xstart=1;
            if nargin<5
                MinPts=5;
                if nargin<4
                    epsilon=20;
                    if nargin<3
                        picksFiguras=0;
                        if nargin<2
                            estagio=1;
                            if nargin<1
                                iteracao=1;
                            end
                        end
                    end
                end
            end
        end
    end
end

%picksFiguras diz se quero ou nao mostrar figuras com os picks.
%1=sim, 0=nao
%picksFiguras=0;
%iteracao=1;
%estagio=1;%2%3;

xina=25;dxana=500;xfna=25525;
dvec=xina:dxana:xfna;
%dv=char(dvec);

%xstart, dx e xend dizem em quais semblances sera feita picagem automatica,
%xstart=1, dx=1 e xend=52 cobre todos os semblances no caso desse modelo
%simples
%xstart=1;dx=1;xend=52;
dall=xstart:dx:xend;
dz=10;
zini=0.0;zfinal=3000.0;

zinterp=(zini:dz:zfinal);nzint=length(zinterp);

%nfiles.sh usa sfget (funcao do madagascar) p/ pegar os enderecos dos
%binarios dos arquivos stk.rsf (binarios dos semblances)
%pegando os caminhos de cada binario
pathToScript = fullfile(pwd,'nfiles.sh');
cmdStr=[pathToScript];
%salva os caminhos de todos os binarios na variavel in
[stat,in]=system(cmdStr);
%separa os caminhos pondo no vetor C
C=strsplit(in,'@');
C=char(C);
C=strcat(C,'@');

i=1:2;
j=1:10;
k=1:52;
picks(j,i,k)=0;
pickss(j,i,k)=0;

%loop em todo o dado para criar os arquivos pick automaticamente
for d=dall
    j=j+1;
    %abrindo semblance e rodando DBSCAN p picar automatico
    
    Cnow=char(C(d,:));
    Cnownew=strtrim(Cnow);
    fid=fopen(Cnownew,'r');
    if fid == -1
        error('Author:Function:OpenFile', 'Cannot open file: %s', C(d,:));
    end
    v=fread(fid,[1001,13051],'float');
    fclose(fid);
    vv=zeros(size(v));
    clear vv;
    vv=v;
    x=size(v,2);
    z=size(v,1);
    
    %Excluindo pontos com amplitude menor que min
    maior=0;
    for i=1:x
        for j=1:z
            TF=isnan(vv(j,i));
            tf=isinf(vv(j,i));
            if (vv(j,i)~=0 & TF==0 & tf==0 & vv(j,i)>maior)
                maior=vv(j,i);
            end
        end
    end
    %min=0.20*maior;
    min=0.20*maior;
    %min=0.16;
    
    %loops (em i e j) for vetorizados
    %i=1:x;
    %j=1:z;
    %if vv(j,i)<min
    %    vv(j,i)=0;
    %end
    for i=1:x;
        for j=1:z;
            TF=isnan(vv(j,i));
            if vv(j,i)<min || TF==1
                vv(j,i)=0;
            end
        end
    end
    clear TF
    porcent=(100*nnz(vv))/nnz(v);
    w=min;
    %while porcent>=0.55
    while porcent>=0.55 && min<=0.95*maior && w>=0
        if min<=maior
            min=min*1.008
            %min=min*1.02
            for i=1:x
                for j=1:z
                    TF=isnan(vv(j,i));
                    if vv(j,i)<min || TF==1
                        vv(j,i)=0;
                    end
                end
            end
            porcent=(100*nnz(vv))/nnz(v)
        %{
        elseif min>=maior
            w=w-0.05
            vv=v;
            min=w*maior;
            for i=1:x;
                for j=1:z;
                    if vv(j,i)<min
                        vv(j,i)=0;
                    end
                end
            end
            porcent=(100*nnz(vv))/nnz(v);
            %}
        end
        %porcent=(100*nnz(vv))/nnz(v)
        clear TF
    end
    
    
    l=0;
    %x1 vai ser a matriz que contem os enderecos dos pontos que sao nao-nulos
    %da matriz vv. cada linha de x1 diz respeito a um ponto.
    x1=zeros(size(vv));
    clear x1;
    for i=1:x
        for j=1:z
            TF=isnan(vv(j,i));
            if (vv(j,i)~=0 && TF==0)
                %k=k+1;
                l=l+1;
                x1(l,1)=i;
                x1(l,2)=j;
            end
        end
    end
    
    %mostrando o semblance
    %{
figure
imagesc(1400:500:4000, 10:10:3000,v)
colormap(jet)
colorbar
    %}
    %saveas(gcf,'cig7025-it8-semblance-full')
    %saveas(gcf,'cig7025-it8-semblance-full','epsc')
    
    %mostrando o semblance depois de zerar todos os pontos com amplitude menor
    %que min
    %{
figure
imagesc(1400:500:4000, 10:10:3000,vv)
colormap(jet)
colorbar
    %}
    %saveas(gcf,'cig7025-it8-semblance-filtrado')
    %saveas(gcf,'cig7025-it8-semblance-filtrado','epsc')
    
    %mapa de pontos mostrando todos os pontos que nao foram zerados
    %{
figure
scatter(x1(:,1),x1(:,2))
xlim([1 261])
ylim([1 1001])
set(gca, 'YDir','reverse')
    %}
    %saveas(gcf,'cig7025-it8-pontos')
    %saveas(gcf,'cig7025-it8-pontos','epsc')
    
    %Agrupando os pontos (formando os clusters) com o DBSCAN
    %epsilon=10;
    %epsilon=50;
    %epsilon=20;
    %MinPts=15;
    %MinPts=5;
    %MinPts=16;
    idx = DBSCAN(x1,epsilon,MinPts);
    
    %determinando o numero de clusters
    nclusters=max(idx);
    
    %nclusters=0;
    %n=0;
    %for i=1:length(idx)-1
    %    if idx(i) ~= idx(i+1)
    %        n=n+1;
    %        numbers(n)=idx(i);
    %    end
    %end
    %nclusters=max(numbers);
    
    
    %mostrando os pontos agrupados pelo DBSCAN
    %{
figure
PlotClusterinResult(x1,idx);
xlim([1 261])
ylim([1 1001])
title(['DBSCAN Clustering (\epsilon = ' num2str(epsilon) ', MinPts = ' num2str(MinPts) ')']);
set(gca, 'YDir','reverse')
    %}
    %saveas(gcf,'cig7025-it8-pontos-agrupados')
    %saveas(gcf,'cig7025-it8-pontos-agrupados','epsc')
    
    xidx=x1;
    %construindo uma matriz que identifica a qual cluster cada ponto pertence e
    %tambem tem o valor de cada ponto
    xidx(:,3)=idx;
    for i=1:length(x1)
        %i=1:numel(x1(:,1));
        xidx(i,4)=vv(xidx(i,2),xidx(i,1));
    end
    
    %Para encontrar o ponto de valor maximo dentro de cada cluster
    maximo=zeros(nclusters,4);
    %loop na quantidade de clusters para encontrar o ponto com amplitude maxima
    %dentro de cada cluster
    pickl=zeros(size(maximo));
    clear pickl;
    for i=1:nclusters
        cluster=zeros(length(x1),4);
        %loop percorrendo todos os pontos
        for j=1:length(x1)
            %j=1:numel(x1(:,1));
            %selecionando todos os pontos dentro da matriz xidx que fazem parte
            %do cluster em que o loop esta rodando no momento e colocando
            %dentro da matriz cluster (para cada cluster essa matriz cluster eh
            %reinicializada)
            if xidx(j,3)==i
                cluster(j,:)=xidx(j,:);
            end
        end
        %encontrando o ponto de maxima amplitude dentro do cluster atual
        top(i)=max(cluster(:,4));
        %loop em toda extensao da matriz xidx
        for k=1:length(x1)
            %localizando o ponto de maximo
            if cluster(k,4)==top(i)
                %criando a matriz maximo que contem a linha toda aonde se
                %encontra o ponto de maximo (vai conter para todos os clusters)
                maximo(i,:)=cluster(k,:);
                %escrevendo da forma que o arquivo pick eh lido na etapa de
                %construcao do modelo
                pickl(i,2)=((maximo(i,1)-1)*10)+1400;
                pickl(i,1)=((maximo(i,2)-1)*3);
            end
        end
    end
    %colocando os picks em ordem, da menor para a maior profundidade
    pickall=sortrows(pickl,1);
    
    
    %Desconsiderando os picks que tiverem valor de velocidade menor do que 80%
    %do valor do pick anterior (do pick mais raso para o mais profundo)
    apaga=zeros(size(pickall));
    clear apaga;
    for p=1:(nclusters-1)
        if pickall(p,1)<200
            apaga(p)=pickall(p,1);
        elseif abs(pickall(p+1,1)-pickall(p,1))<=150
            first=abs(2000-pickall(p,2));
            second=abs(2000-pickall(p+1,2));
            if first<second
                apaga(p+1)=pickall(p+1,1);
            elseif second<first
                apaga(p)=pickall(p,1);
            end
        %end
        elseif pickall(p+1,2)<0.8*pickall(p,2)
            apaga(p+1)=pickall(p+1,1);
        end
        if pickall(p+1,1)>2500
            apaga(p+1)=pickall(p+1,1);
        end
        if pickall(p+1,2)>3200
            apaga(p+1)=pickall(p+1,1);
        end
        %p=nclusters;
    end
    if exist ('apaga','var')==1
        exclude=zeros(size(pickall));
        clear exclude;
        exclude=find(apaga);
        pick=zeros(size(pickall));
        clear pick;
        pick=pickall;
        pick(exclude,:)=[];
        conta=numel(pickall)/2;
        i=1:conta;
        j=1:2;
        pickss(i,j,d)=pickall;
        pickss(exclude,:,d)=[0];
    elseif exist ('apaga','var')==0
        pick=zeros(size(pickall));
        clear pick;
        pick=pickall;
        conta=numel(pickall)/2;
        i=1:conta;
        j=1:2;
        pickss(i,j,d)=pickall;
    end
    
    conta=numel(pickall)/2;
    %i=1:conta;
    %j=1:2;
    h=0;
    for i=1:conta
        for j=1:2
            if pickss(i,j,d)~=0
                h=h+0.5;
                if floor(h)==h
                    picks(h,1,d)=pickss(i,1,d);
                    picks(h,j,d)=pickss(i,j,d);
                end
                %picks(i,j,d)=picks(i+1,j,d);
                %picks(i+1,j,d)=0;
            end
        end
    end
    
    %estagios layer stripping (1 2 3)
    quantos=numel(pick)/2;
    
    if iteracao~=1
        copyfile(strcat(strcat(strcat(strcat('../../../',num2str(iteracao-1)),'/Anavel/picks1/picks'),num2str(iteracao-1)),'.mat'),'.')
        passada=load(strcat('picks',num2str(iteracao-1),'.mat'));
        passada=passada.picks;
    end
    %estagio=1, 2 ou 3;
    if estagio==1
        i=2:quantos;
        pick(i,:)=[];
    elseif estagio==2
        if size(pick,1)<2
            pick=passada(:,:,d);
        end
        if pick(2,1)==0
            pick(2,1)=800;
            pick(2,2)=2000;
        end
        quantos=numel(pick)/2;
        if quantos>=3
            i=3:quantos;
            pick(i,:)=[];
        end
        %{
    elseif quantos==1
        pick(2,1)=pick(1,1);
        pick(2,2)=pick(1,2);
        pick(1,1)=100;
        pick(1,2)=2000;
    elseif quantos==0
        if d~=1
            pick=picks(:,:,d-1);
        else
            pick(1,1)=300;
            pick(1,2)=1800;
            pick(2,1)=800;
            pick(2,2)=2200;
            pick(3,1)=1200;
            pick(3,2)=2300;
        end
    end
        %}
    elseif estagio==3
        if size(pick,1)<3
            pick=passada(:,:,d);
        end
        if pick(3,1)==0
            pick(3,1)=1100;
            pick(3,2)=2000;
        end
        quantos=numel(pick)/2;
        if quantos>=4
            i=4:quantos;
            pick(i,:)=[];
        end
        %{
    elseif quantos==2
        pick(3,1)=pick(2,1);
        pick(3,2)=pick(2,2);
        pick(2,1)=pick(1,1);
        pick(2,2)=pick(1,2);
        pick(1,1)=100;
        pick(1,2)=2000;
    elseif quantos==1
        pick(3,1)=pick(1,1);
        pick(3,2)=pick(1,2);
        pick(1,1)=300;
        pick(1,2)=1600;
        pick(2,1)=600;
        pick(2,2)=2000;
    elseif quantos==0
        if d~=1
            pick=picks(:,:,d-1);
        else
            pick(1,1)=300;
            pick(1,2)=1800;
            pick(2,1)=800;
            pick(2,2)=2200;
            pick(3,1)=1200;
            pick(3,2)=2300;
        end
    end
        %}
    end
    
    
    %fid=fopen(strcat(strcat('pick',num2str(dvec(d))),'.rsf'));
    dlmwrite(strcat(strcat('pick',num2str(dvec(d))),'.rsf'),pick);
    
    %escrevendo os picks para criar mapa de pontos como os do DBSCAN
    if picksFiguras==1
        pontos=zeros(size(pickall));
        clear pontos;
        for i=1:length(picks(:,2,d))
            pontos(i,1)=((picks(i,2,d)-1400)/10)+1;
            pontos(i,2)=(picks(i,1,d)/3)+1;
        end
    end
    
    %figura com os pontos de amplitude maxima de cada cluster plotados no
    %semblance
    %{
figure
imagesc(1400:500:4000, 10:10:3000,v)
colormap(jet)
colorbar
hold on
scatter(pick(:,2),pick(:,1),70,'filled','r','o')
    %}
    %saveas(gcf,'cig7025-it8-pontos-agrupados-centroamp')
    %saveas(gcf,'cig7025-it8-pontos-agrupados-centroamp','epsc')
    
    %mapa de pontos mostrando os pontos dos clusters com os pontos de
    %amplitudes maximas
    if picksFiguras==1
        figure
        PlotClusterinResult(x1,idx);
        xlim([1 261])
        ylim([1 1001])
        title(['DBSCAN Clustering (\epsilon = ' num2str(epsilon) ', MinPts = ' num2str(MinPts) ')']);
        set(gca, 'YDir','reverse')
        hold on
        scatter(pontos(:,1),pontos(:,2),40,'filled','y','o')
    end
    %saveas(gcf,'cig7025-it8-semblance-picks')
    %saveas(gcf,'cig7025-it8-semblance-picks','epsc')
    
    
end

%Salvando os picks em .mat
save(strcat('picks',num2str(iteracao),'.mat'),'picks');
%para abrir depois:
%{
picks1=load('picks1.mat');
picks=picks1.picks;
%}
ok=('okusingdbscan');
dlmwrite('OKusingdbscan.txt',ok);
copyfile('OKusingdbscan.txt','../../..')