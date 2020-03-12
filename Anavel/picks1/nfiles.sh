#!/bin/bash 

#loop=(25)

for i in {25..25525..500}
do
#loop+=($i)
sfget in parform=n < stk$i.rsf
done

#echo ${loop[@]}
