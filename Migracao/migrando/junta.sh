#!/bin/bash

#junta os painéis de offset
cat data_psdm_co50.su data_psdm_co150.su data_psdm_co250.su data_psdm_co350.su data_psdm_co450.su data_psdm_co550.su data_psdm_co650.su data_psdm_co750.su data_psdm_co850.su data_psdm_co950.su data_psdm_co1050.su data_psdm_co1150.su data_psdm_co1250.su data_psdm_co1350.su data_psdm_co1450.su data_psdm_co1550.su data_psdm_co1650.su data_psdm_co1750.su data_psdm_co1850.su data_psdm_co1950.su data_psdm_co2050.su data_psdm_co2150.su data_psdm_co2250.su data_psdm_co2350.su data_psdm_co2450.su data_psdm_co2550.su data_psdm_co2650.su data_psdm_co2750.su data_psdm_co2850.su data_psdm_co2950.su data_psdm_co3050.su data_psdm_co3150.su data_psdm_co3250.su data_psdm_co3350.su data_psdm_co3450.su data_psdm_co3550.su data_psdm_co3650.su data_psdm_co3750.su data_psdm_co3850.su data_psdm_co3950.su data_psdm_co4050.su data_psdm_co4150.su data_psdm_co4250.su data_psdm_co4350.su data_psdm_co4450.su data_psdm_co4550.su data_psdm_co4650.su data_psdm_co4750.su data_psdm_co4850.su data_psdm_co4950.su >data_psdm.su

#oraganiza em CIG offset
susort <data_psdm.su >data_psdm_cdp_off.su cdp offset

#supsimage < data_psdm_cdp_off.su title="CIG" label1="depth" label2="h" #>data_psdm_cdp_off.eps

#j=0
#cdpmax=25800
#while [ $j -le $cdpmax ]
#do
#  suwind key=cdp min=$j max=$j < data_psdm_cdp_off.su > data_psdm_cdp${j}.su
#  j=$(($j+25))
#end
