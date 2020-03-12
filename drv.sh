#!/bin/bash

estagio=1
#: '
iteracao=1

mkdir $iteracao
cp -r ./1clean/* ./$iteracao

cd ./$iteracao/Migracao/migrando/
./Rayt2d
./MigPre

./junta.sh
#testando para descobrir se o numero de tracos no arquivo gerado tem o numero correto de 30900
surange<data_psdm.su >range.txt
range="./range.txt"
ntr="$(awk 'NR==1 {print; exit}' $range)"
traco="30900 traces:"
while [ "$ntr" != "$traco" ]
do
./junta.sh
rm range.txt
surange<data_psdm.su >range.txt
range="./range.txt"
ntr="$(awk 'NR==1 {print; exit}' $range)"
echo $ntr
#if [ "$ntr" != "$traco" ]
#then
#echo $traco
#echo $ntr
#fi
done

cp data_psdm.su ../../CIGCONT
cd ../../CIGCONT/
scons
cd ../Anavel
cp ../CIGCONT/*cigcont*.rsf .
cp *cigcont*.rsf ./picks1
cd ./picks1
scons
matlab_R2014b -r "try matDRV($iteracao,$estagio); catch; end; quit"
file="./estagio.txt"
estagio=$(cat "$file")
echo $estagio

cd ../../..

#'
iteracao=2

gedit OKusingdbscan.txt
gedit OKmatDRV.txt
#while [ "$estagio" -le "4" ]
while [ "$estagio" -le "3" ]
do
	rm OKusingdbscan.txt
	rm OKmatDRV.txt
	mkdir $iteracao
	cp -r ./1clean/* ./$iteracao
	cp -r ./$(( $iteracao - 1 ))/Anavel/picks1/next/vana-smooth30/vana01_nearest_smooth.bin ./$iteracao
	cp -r ./$(( $iteracao - 1 ))/Anavel/picks1/next/vana-smooth30/vana01_nearest_smooth.bin ./$iteracao/Migracao
	cp -r ./$(( $iteracao - 1 ))/Anavel/picks1/next/vana-smooth30/vana01_nearest_smooth.bin ./$iteracao/Migracao/migrando
	cp -r ./$(( $iteracao - 1 ))/Anavel/picks1/next/* ./$iteracao/Anavel/picks1

	cd ./$iteracao/Migracao/migrando/
	./Rayt2d
	./MigPre

	./junta.sh
#testando para descobrir se o numero de tracos no arquivo gerado tem o numero correto de 30900
	surange<data_psdm.su >range.txt
	range="./range.txt"
	ntr="$(awk 'NR==1 {print; exit}' $range)"
	traco="30900 traces:"
	while [ "$ntr" != "$traco" ]
	do
		./junta.sh
		rm range.txt
		surange<data_psdm.su >range.txt
		range="./range.txt"
		ntr="$(awk 'NR==1 {print; exit}' $range)"
		echo $ntr
		#if [ "$ntr" != "$traco" ]
		#then
		#echo $traco
		#echo $ntr
		#fi
	done

	cp data_psdm.su ../../CIGCONT
	cd ../../CIGCONT/
	scons
	cd ../Anavel
	cp ../CIGCONT/*cigcont*.rsf .
	cp *cigcont*.rsf ./picks1
	cd ./picks1
	scons
	matlab_R2014b -r "try matDRV($iteracao,$estagio); catch; end; quit"
	#matlab_R2014 -r -nodisplay -nojvm "try matDRV($iteracao,$estagio); catch; end; quit"
	file="./estagio.txt"
	estagio=$(cat "$file")
	echo $estagio

	cd ../../..
	usingdb="OKusingdbscan.txt"
	if [ -f "$usingdb" ]
	then
	echo "$usingdb found"
	else
		break
	fi
	
	matDRV="OKmatDRV.txt"
	if [ -f "$matDRV" ]
	then
	echo "$matDRV found"
	else
		break
	fi

	iteracao=$(( $iteracao + 1 ))

done
