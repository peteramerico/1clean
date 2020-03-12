function setini2teste(fname,n1,estagio,x,z)
%estagio=0 cria o arquivo ini.txt necessario p calculaVINT10 -
%estagio=1,2 ou 3 cria os .txt usados no arquivo interfaces.m (que por sua
%vez eh usado no modeloteste.m para gerar imagem com o modelo
if nargin < 2;
  error('Must specify filename and n1');
end;

%n1=301;
%n2=517;
velmod = loadbin(fname,n1);
[n1,n2]=size(velmod);
%z=1:n1;
%x=1:n2;
if nargin < 5;
  z=1:n1;
  if nargin < 4;
    x=1:n2;
    if nargin < 3;
       estagio=0;
    end
  end;
end;

ind=zeros(size(x));
for ix=1:length(x);
    ind(ix)=max(find(velmod(2:end,ix)-velmod(1:end-1,ix)>50));%+1;
end

%for ix=1:length(x);
%    ind1(ix)=max(find(velmod(2:end,ix)-velmod(1:end-1,ix)>50));
%end

zrefd=zeros(size(x));
for ix=1:length(x);
    zrefd(ix)=z(ind(ix));
end
yyn=[x(:), zrefd(:)];

vv=zeros(size(x));
for ix=1:length(x);
  vv(ix)=velmod(ind(ix),ix);
end
%Para gerar figura
%{
if estagio~=100
    figure()
    imagesc(x,z,velmod)
    hold on
    plot(x,zrefd,'r')
    hold off
end
%}
aux= [yyn,vv'];
if estagio==10;
    save -ascii iniaqui.txt aux
end
if estagio==0;
    save -ascii ini.txt aux
end
if estagio==1;
    save -ascii ini1.txt aux
end
if estagio==2;
    save -ascii ini2.txt aux
end
if estagio==3;
    save -ascii ini3.txt aux
end