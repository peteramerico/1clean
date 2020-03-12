function matDRV(iteracao,estagio)
%matDRV(iteracao,estagio)

%estagio diz respeito a qual camada/refletor o layer stripping esta
%trabalhando atualmente
if nargin<2
    estagio=1;
    if nargin<1
        iteracao=1;
    end
end

%informacoes do marmousoft?
%xina=250;dxana=250;xfna=8750;

%xina, dxana e xfna para correr nos semblances
xina=25;dxana=500;
xfna=25525;
%xfinal1 e xfinal2 sao as duas opcoes da extensao do nosso modelo
xfinal1=25850;
xfinal2=30850;
pvec=xina:dxana:xfna;
zini=zeros(size(pvec));
vini=1500*ones(size(pvec));
nn=length(pvec);


%iteracao=1;
%estagio=1;%2 ou 3

%excluindo a pasta next se ja existir e criando a nova next. A pasta next
%ira conter todos os arquivos, gerados na presente iteracao, que sao
%necessarios na iteracao seguinte
rmnext=exist('next');
if rmnext==7
    rmdir next s
end
mkdir next

%Rodando o usingdbscan.m para fazer a picagem automatica nos semblances e
%gerar os arquivos pick...
%usingdibscan(iteracao,estagio,picksFiguras,epsilon,MinPts,xstart,dx,xend)
usingdbscan(iteracao,estagio)
if iteracao~=1
    %atual e passada sao matrizes tridimensionais que contem as informacoes
    %de todos os picks dessa iteracao e da passada
    atual=load(strcat('picks',num2str(iteracao),'.mat'));
    atual=atual.picks;
    copyfile(strcat(strcat(strcat(strcat('../../../',num2str(iteracao-1)),'/Anavel/picks1/picks'),num2str(iteracao-1)),'.mat'),'.')
    passada=load(strcat('picks',num2str(iteracao-1),'.mat'));
    passada=passada.picks;
    
    %obtendo informacao de qual estagio era a 2 iteracoes atras, para
    %depois decidir se compara os picks dessa iteracao com os da iteracao
    %passada
    if iteracao~=1 && iteracao~=2
    estagioantes2=load(strcat(strcat('../../../',num2str(iteracao-2),'/Anavel/picks1/estagio.txt')));
    else
        estagioantes2=0;
    end
    
    %estagio do layer strp - se na 1, 2 ou 3 camada
    %estagio=1;%2 ou 3
    pvecc=length(pvec);
    
    %se o estagio de duas iteracoes atras for diferente do estagio da
    %iteracao atual (e se nao estivermos na 2 ou 3 iteracao) significa que
    %na iteracao atual acabamos de comecar a definir essa camada e entao
    %nao faremos comparacao dos picks nessa iteracao com os da passada,
    %pois estariamos comparando picks de uma camada com outra diferente. Se
    %o estagio for o mesmo, podemos comparar picks dessa iteracao com a
    %passada pois estaremos lidando com a mesma camada
    if estagioantes2~=estagio && estagioantes2~=0
        mediaPosicaoPorcent=0
        mediaVelPorcent=0
    elseif estagio==1
        for i=1:2;
            for k=1:length(pvec);
                if atual(1,i,k)==0
                    atual(1,i,k)=passada(1,i,k);
                    porcentagem(1,i,k)=0;
                    pvecc=pvecc-1;
                else
                    porcentagem(1,i,k)=(atual(1,i,k)*100)./passada(1,i,k);
                end
            end
        end
        somaPorcentPosicao=0;
        for j=1:pvecc
            somaPorcentPosicao=somaPorcentPosicao+porcentagem(1,1,j);
            j=j+1;
        end
        mediaPosicaoPorcent=somaPorcentPosicao/pvecc
        somaPorcentVel=0;
        for j=1:pvecc
            somaPorcentVel=somaPorcentVel+porcentagem(1,2,j);
            j=j+1;
        end
        mediaVelPorcent=somaPorcentVel/pvecc
    elseif estagio==2
        for i=1:2
            for k=1:length(pvec)
                for l=1:2
                    if atual(2,i,k)==0 && passada(2,i,k)~=0
                        atual(:,:,k)=passada(:,:,k);
                        porcentagem(2,i,k)=0;
                        pvecc=pvecc-1;
                    elseif atual(2,i,k)==0 && passada(2,i,k)==0
                        atual(2,1)=800;
                        atual(2,2)=2000;
                        porcentagem(2,i,k)=0;
                        pvecc=pvecc-1;
                    elseif atual(2,i,k)~=0 && passada(2,i,k)==0
                        %atual(l,i,k)=passada(l,i,k);
                        %if atual(2,1,k)==0
                        %    atual(2,1,k)=1000;
                        %    atual(2,2,k)=2000;
                        %end
                        porcentagem(2,i,k)=0;
                        pvecc=pvecc-1;
                    else
                        porcentagem(2,i,k)=(atual(2,i,k)*100)./passada(2,i,k);
                    end
                end
            end
        end
        somaPorcentPosicao=0;
        for j=1:pvecc
            somaPorcentPosicao=somaPorcentPosicao+porcentagem(2,1,j);
            %j=j+1;
        end
        mediaPosicaoPorcent=somaPorcentPosicao/pvecc
        somaPorcentVel=0;
        for j=1:pvecc
            somaPorcentVel=somaPorcentVel+porcentagem(2,2,j);
            %j=j+1;
        end
        mediaVelPorcent=somaPorcentVel/pvecc
    elseif estagio==3
        for i=1:2
            for k=1:length(pvec);
                for l=1:3;
                    if atual(3,i,k)==0 && passada(3,i,k)~=0
                        atual(:,:,k)=passada(:,:,k);
                        porcentagem(3,i,k)=0;
                        pvecc=pvecc-1;
                    elseif atual(3,i,k)==0 && passada(3,i,k)==0
                        atual(3,1)=1100;
                        atual(3,2)=2000;
                        porcentagem(2,i,k)=0;
                        pvecc=pvecc-1;
                    elseif atual(3,i,k)~=0 && passada(3,i,k)==0
                        %atual(l,i,k)=passada(l,i,k);
                        %if passada(3,1,k)==0
                        %    atual(3,1,k)=1100;
                        %    atual(3,2,k)=2000;
                        %end
                        porcentagem(3,i,k)=0;
                        pvecc=pvecc-1;
                    else
                        porcentagem(3,i,k)=(atual(3,i,k)*100)./passada(3,i,k);
                    end
                end
            end
        end
        somaPorcentPosicao=0;
        for j=1:pvecc
            somaPorcentPosicao=somaPorcentPosicao+porcentagem(3,1,j);
            %j=j+1;
        end
        mediaPosicaoPorcent=somaPorcentPosicao/pvecc
        somaPorcentVel=0;
        for j=1:pvecc
            somaPorcentVel=somaPorcentVel+porcentagem(3,2,j);
            %j=j+1;
        end
        mediaVelPorcent=somaPorcentVel/pvecc
    end
        %end
    %end
    %gravando as medias das porcentagens em arquivos txt para facil acesso
    %depois
    dlmwrite('mediaPosicaoPorcent.txt',mediaPosicaoPorcent);
    dlmwrite('mediaVelPorcent.txt',mediaVelPorcent);
    
    %copiando todos os arquivos que estao dentro da pasta next da iteracao
    %anterior para a pasta da iteracao atual
    nextpassada=exist(strcat(strcat('../../../',num2str(iteracao-1)),'/Anavel/picks1/next'));
    if nextpassada==7
        ini1=exist(strcat(strcat('../../../',num2str(iteracao-1)),'/Anavel/picks1/next/ini1.txt'));
        if ini1==2
            copyfile(strcat(strcat('../../../',num2str(iteracao-1)),'/Anavel/picks1/next/ini1.txt'),'.')
        end
        ini2=exist(strcat(strcat('../../../',num2str(iteracao-1)),'/Anavel/picks1/next/ini2.txt'));
        if ini2==2
            copyfile(strcat(strcat('../../../',num2str(iteracao-1)),'/Anavel/picks1/next/ini2.txt'),'.')
        end
        ini3=exist(strcat(strcat('../../../',num2str(iteracao-1)),'/Anavel/picks1/next/ini3.txt'));
        if ini3==2
            copyfile(strcat(strcat('../../../',num2str(iteracao-1)),'/Anavel/picks1/next/ini3.txt'),'.')
        end
        set25=exist(strcat(strcat('../../../',num2str(iteracao-1)),'/Anavel/picks1/next/vana-setini25'));
        if set25==7
            copyfile(strcat(strcat('../../../',num2str(iteracao-1)),'/Anavel/picks1/next/vana-setini25'),'.')
            copyfile(strcat(strcat('../../../',num2str(iteracao-1)),'/Anavel/picks1/next/vana-setini30'),'.')
        end
        vanasmooth=exist(strcat(strcat('../../../',num2str(iteracao-1)),'/Anavel/picks1/next/vana-smooth25'));
        if vanasmooth==7
            copyfile(strcat(strcat('../../../',num2str(iteracao-1)),'/Anavel/picks1/next/vana-smooth25'),'.')
            copyfile(strcat(strcat('../../../',num2str(iteracao-1)),'/Anavel/picks1/next/vana-smooth30'),'.')
        end
    end
    
    %Fazendo todos os procedimentos necessarios para gerar os modelos
    %(arquivos .bin) que serao usados para migrar o dado na iteracao
    %seguinte. coloco todos os arquivos que serao usados na iteracao
    %seguinte dentro da pasta next
     %setini2teste marca a partir de onde o layer stripping trabalha
     %atualmente e tambem marca a interface da camada atual para ser usada
     %nas figuras
     %calculaVINT10 eh a funcao que usa os picks para construir os modelos
     %de velocidade
     %modeloteste gera as nossas figuras. precisa do codigo chamado
     %interface para marcar as interfaces nas figuras
    xfin=xfinal1:5000:xfinal2;
    for xfinal=xfin
        setini=0;
        %trabalhando no modelo com extensao de 25850 metros. esse modelo eh
        %usado mais para fins de demonstracao de resultados, mas para
        %melhorar o resultado na borda, precisamos trabalhar com um modelo
        %mais extenso, que eh o de 30850 m, calculado mais a frente
        if xfinal==25850
            ha1=exist ('vana01_nearest_smooth.bin');
            ha2=exist ('vana01_setini.bin');
            if ha1==2
                delete vana01_nearest_smooth.bin;
            end
            if ha2==2
                delete vana01_setini.bin;
            end
            setini=exist('vana-setini25');
            if setini==7
                copyfile('vana-setini25/vana01_setini.bin','.')
                setini2teste('vana01_setini.bin',301,0);
            end
            copyfile('vana-smooth25/vana01_nearest_smooth.bin','.')
            
            %se as condicoes seguintes forem satisfeitas, significa que o
            %resultado da camada atual, obtido nessa iteracao eh bom o
            %suficiente para partirmos para a camada seguinte na proxima
            %iteracao
            if mediaPosicaoPorcent>=85 && mediaPosicaoPorcent<=115 && mediaVelPorcent>=85 && mediaVelPorcent<=115
                %calculaVINT10(suave,setini,xfinal,velfile,velfilein,PATH)
                calculaVINT10(0,1,xfinal);
                setini2teste('vana01_setini.bin',301,10);
                mkdir ./next/vana-setini25
                copyfile('vana01_setini.bin','./next/vana-setini25')
                estagio=estagio+1;
                dlmwrite('estagio.txt',estagio);
                copyfile('estagio.txt','../../..')
                estagioSetini=estagio-1;
                setini2teste('vana01_setini.bin',301,estagioSetini);
                copyfile(strcat(strcat('ini',num2str(estagioSetini)),'.txt'),'./next')
                delete vana01_setini.bin;
                setini=exist('vana-setini25');
                if setini==7
                    copyfile('vana-setini25/vana01_setini.bin','.')
                end
                calculaVINT10(1,0,xfinal);
                %modeloteste(modelo,suave,setini,velfile,PATH)
                modeloteste(iteracao,1,0)
                mkdir ./next/vana-smooth25
                copyfile('vana01_nearest_smooth.bin','./next/vana-smooth25')
            else
                %se existir na pasta atual os arquivos 
                %ini1.txt, ini2.txt ou ini3.txt, copia pra pasta next pra
                %serem usados nas iteracoes seguintes (para construir os modelos)
                ini1=exist('ini1.txt');
                if ini1==2
                    copyfile('ini1.txt','./next')
                end
                ini2=exist('ini2.txt');
                if ini2==2
                    copyfile('ini2.txt','./next')
                end
                ini3=exist('ini3.txt');
                if ini3==2
                    copyfile('ini3.txt','./next')
                end
                calculaVINT10(0,1,xfinal);
                mkdir ./next/vana-setini25
                copyfile('vana01_setini.bin','./next/vana-setini25')
                %calculaVINT10(suave,setini,xfinal,velfile,velfilein,PATH)
                %calculaVINT10(0,1,xfinal);
                setini2teste('vana01_setini.bin',301,10);
                delete vana01_setini.bin;
                if setini==7
                    copyfile('vana-setini25/vana01_setini.bin','.')
                end
                %setini2teste('vana01_setini.bin',301,0);
                calculaVINT10(1,0,xfinal);
                %delete vana01_setini.bin;
                %modeloteste(modelo,suave,setini,velfile,PATH)
                modeloteste(iteracao,1,0)
                mkdir ./next/vana-smooth25
                copyfile('vana01_nearest_smooth.bin','./next/vana-smooth25')
            end
            %trabalhando no modelo de extensao 30850 metros
        elseif xfinal==30850
            ha1=exist ('vana01_nearest_smooth.bin');
            ha2=exist ('vana01_setini.bin');
            if ha1==2
                delete vana01_nearest_smooth.bin;
            end
            if ha2==2
                delete vana01_setini.bin;
            end
            setini=exist('vana-setini30');
            if setini==7
                copyfile('vana-setini30/vana01_setini.bin','.')
                setini2teste('vana01_setini.bin',301,0);
            end
            copyfile('vana-smooth30/vana01_nearest_smooth.bin','.')
            if mediaPosicaoPorcent>=85 && mediaPosicaoPorcent<=115 && mediaVelPorcent>=85 && mediaVelPorcent<=115
                %calculaVINT10(suave,setini,xfinal,velfile,velfilein,PATH)
                calculaVINT10(0,1,xfinal);
                mkdir ./next/vana-setini30
                copyfile('vana01_setini.bin','./next/vana-setini30')
                calculaVINT10(1,0,xfinal);
                mkdir ./next/vana-smooth30
                copyfile('vana01_nearest_smooth.bin','./next/vana-smooth30')
                
            else
                mkdir ./next/vana-setini30
                copyfile('vana01_setini.bin','./next/vana-setini30')
                calculaVINT10(1,0,xfinal);
                mkdir ./next/vana-smooth30
                copyfile('vana01_nearest_smooth.bin','./next/vana-smooth30')
            end
        end
    end
    %Para a primeira iteracao realizamos procedimento um pouco diferente
    %das demais iteracoes
elseif iteracao==1
   xfin=xfinal1:5000:xfinal2;
   for xfinal=xfin
       ha1=exist ('vana01_nearest_smooth.bin');
       ha2=exist ('vana01_setini.bin');
       if ha1==2
           delete vana01_nearest_smooth.bin;
       end
       if ha2==2
           delete vana01_setini.bin;
       end
       if xfinal==25850
           %calculaVINT10(suave,setini,xfinal,velfile,velfilein,PATH)
           calculaVINT10(0,1,xfinal);
           setini2teste('vana01_setini.bin',301,10);
           %delete vana01_setini.bin;
           calculaVINT10(1,0,xfinal);
           %delete vana01_setini.bin;
           mkdir ./next/vana-smooth25
           copyfile('vana01_nearest_smooth.bin','./next/vana-smooth25')
           %modeloteste(modelo,suave,setini,velfile,PATH)
           modeloteste(iteracao,1,0)
       elseif xfinal==30850
           calculaVINT10(1,0,xfinal);
           mkdir ./next/vana-smooth30
           copyfile('vana01_nearest_smooth.bin','./next/vana-smooth30')
       end
   end
end
%salvando um arquivo .txt que sera usado somente para conferir se a funcao
%rodou por inteiro, o que provavelmente indica que nao houve erro fatal no
%funcionamento
ok=('okmatDRV');
dlmwrite('OKmatDRV.txt',ok);
copyfile('OKmatDRV.txt','../../..')
