#!/bin/bash

XSB_PATH=/home/stu1/XSBench/openmp-threading
BTR_PATH=/home/stu1//vmitosis-workloads/bin

OUTPUT_ANON=BTR_usage_always.out
OUTPUT_ANONHUGE=BTRhuge_usage_always.out

TIME_SEQ=$(seq 0 600)

#execute bench
#${XSB_PATH}/XSBench -t 4 -g 60000 -p 14000000 &
${BTR_PATH}/bench_btree_st

#log
for i in ${TIME_SEQ}
do
        echo "time: ${i}s" >> ${OUTPUT_ANON}
        echo "time: ${i}s" >> ${OUTPUT_ANONHUGE}
        cat /proc/meminfo | grep AnonPage >> ${OUTPUT_ANON}
        cat /proc/meminfo | grep AnonHuge >> ${OUTPUT_ANONHUGE}

        sleep 1
done


