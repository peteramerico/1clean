function modeloteste(modelo,suave,setini,velfile,PATH)
%modelo(modelo,suave,setini,velfile,PATH)

if nargin < 5;
    PATH='';
    if nargin < 4;
        if nargin < 3;
            setini=0;
        end
        if nargin < 2;
            suave = 0;
        end
        if (suave==1)
            char='_smooth';
        else
            char='';
        end
        if nargin < 1;
            modelo=0;
        end
        velfile=strcat(['vana01_nearest',char,'.bin']);
    end
end

if setini==1;
    velfilesetini=strcat('vana01_setini',char,'.bin');
end

if suave==0
    nmodelo=strcat('modeloLSTESTE',int2str(modelo));
    mmodelo=strcat('modeloLSTESTE',int2str(modelo));
else
    nmodelo=strcat('modeloLSTESTE',int2str(modelo),'-suave-eng');
    mmodelo=strcat('modeloLSTESTE',int2str(modelo),'-suave-eng');
end

%vmin=1400;
%vmax=3300;
vmin=1400;
vmax=4500;

nnp=618;
if setini==1
    figure()
    file=fopen(strcat('vana01_setini',char,'.bin'));
    v=fread(file,[301,nnp],'float');
    if length(v)==518;
        imagesc(0.05:0.05:25.850, 0.01:0.01:3.000,v,[vmin vmax])
    else
        imagesc(0.05:0.05:30.850, 0.01:0.01:3.000,v,[vmin vmax])
    end
    xlabel('Distancia (km)')
    ylabel('Profundidade (km)')
    colormap(jet)
    colorbar
    hold on
    interfaces
    saveas(gcf,nmodelo)
    saveas(gcf,mmodelo,'epsc')
else
    figure()
    file=fopen(strcat('vana01_nearest',char,'.bin'));
    v=fread(file,[301,nnp],'float');
    if length(v)==518;
        imagesc(0.05:0.05:25.850, 0.01:0.01:3.000,v,[vmin vmax])
    else
        imagesc(0.05:0.05:30.850, 0.01:0.01:3.000,v,[vmin vmax])
    end
    
    xlabel('Distance (km)')
    ylabel('Depth (km)')
    colormap(jet)
    colorbar
    hold on
    interfaces
    saveas(gcf,nmodelo)
    saveas(gcf,mmodelo,'epsc')
end