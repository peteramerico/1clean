%%Criando o modelo de velocidade constante, com dimensoes que seguem o dado
%%que gerei com o csmodeling. Aqui temos x=618 que corresponde a 30850m,
%%para ver se consigo mais traços para migrar no fim do meu modelo real,
%%que vai de fato até 25850m.
v=2000*ones(301,618);
file=fopen('vana01_nearest_smooth.bin','wb');
fwrite(file,v,'float');
clear all
file=fopen('vana01_nearest_smooth.bin');
v=fread(file,[301,618],'float');
imagesc(v)