#!/bin/bash
export TIME=$(date '+%Y%m%d%H%M')
MAX_THREADS=`nproc --all`
THREAD=(1)
#K=(1) 
#L_SIZE=(10)
K=(1 10) 
L_SIZE=(10 20 30 40 50 60 70 80 90 100 110 120 130 140 150 160 170 180 190 200 250 300 350 400 450 500)

for k in ${K[@]}; do
  rm -rf ${1}_search_K${k}_baseline_T${THREAD}.log
  awk 'NR==11{ print; exit }' ${1}_search_L${L_SIZE[1]}K${k}_baseline_T${THREAD}.log >> ${1}_search_K${k}_baseline_T${THREAD}.log
  awk 'NR==12{ print; exit }' ${1}_search_L${L_SIZE[1]}K${k}_baseline_T${THREAD}.log >> ${1}_search_K${k}_baseline_T${THREAD}.log
  for l in ${L_SIZE[@]}; do
    awk 'NR==13{ print $0; exit }' ${1}_search_L${l}K${k}_baseline_T${THREAD}.log >> ${1}_search_K${k}_baseline_T${THREAD}.log
  done
done
