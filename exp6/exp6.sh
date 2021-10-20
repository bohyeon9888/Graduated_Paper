#!/bin/bash

XSB_PATH=/home/stu1/XSBench/openmp-threading
BTR_PATH=/home/stu1//vmitosis-workloads/bin
GRF_PATH=/home/stu1

OUTPUT_ANON=FIXusage_defer.out

TIME_SEQ=$(seq 0 1800)

#execute bench
time ${XSB_PATH}/XSBench -t 4 -g 50000 -p 14000000 &
#time ${BTR_PATH}/bench_btree_st &
#time ${GRF_PATH}/graph500 -s 25 -e 28 -V &

#log
for i in ${TIME_SEQ}
do
        echo "time: ${i}s" >> ${OUTPUT_ANON}
        cat /proc/meminfo | grep AnonPage >> ${OUTPUT_ANON}
        cat /proc/meminfo | grep AnonHuge >> ${OUTPUT_ANON}

done
