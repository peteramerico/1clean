#!/bin/bash

#
i=ls1
j=7500
#cdpmax=25800
#while [ $j -le $cdpmax ]
#do
suwind key=cdp min=$j max=$j < data_psdm_cdp_off.su > cig${i}-${j}.su
#  j=$(($j+25))
#end
sustrip < cig${i}-${j}.su >cig${i}-${j}.bin
cp cig${i}-${j}.bin /media/peter/NO_NAME/cigs

j=13500
#cdpmax=25800
#while [ $j -le $cdpmax ]
#do
suwind key=cdp min=$j max=$j < data_psdm_cdp_off.su > cig${i}-${j}.su
#  j=$(($j+25))
#end
sustrip < cig${i}-${j}.su >cig${i}-${j}.bin
cp cig${i}-${j}.bin /media/peter/NO_NAME/cigs

j=19500
#cdpmax=25800
#while [ $j -le $cdpmax ]
#do
suwind key=cdp min=$j max=$j < data_psdm_cdp_off.su > cig${i}-${j}.su
#  j=$(($j+25))
#end
sustrip < cig${i}-${j}.su >cig${i}-${j}.bin
cp cig${i}-${j}.bin /media/peter/NO_NAME/cigs

j=23500
#cdpmax=25800
#while [ $j -le $cdpmax ]
#do
suwind key=cdp min=$j max=$j < data_psdm_cdp_off.su > cig${i}-${j}.su
#  j=$(($j+25))
#end
sustrip < cig${i}-${j}.su >cig${i}-${j}.bin
cp cig${i}-${j}.bin /media/peter/NO_NAME/cigs

