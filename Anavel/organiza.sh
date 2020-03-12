#!/bin/bash
#
#script que organiza os picks de velocidade em ordem crescente de profundidade
#

#replacing . by , in all pick files in order to use the function sort to sort all pick files from menor to maior

for i in {25..25025..500}
do
sed -i 's/\./,/g' pick$i.rsf
done

for i in {25..25025..500}
do
cat pick$i.rsf|sort -n>temp$i.dat
mv temp$i.dat pick$i.rsf
done

rm -f temp*.dat

#replacing , by . in all pick files to use files pick in matlab

for i in {25..25025..500}
do
sed -i 's/,/\./g' pick$i.rsf
done



