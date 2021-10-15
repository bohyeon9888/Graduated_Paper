#!/bin/bash

XSB_PATH=/home/stu1/XSBench/openmp-threading
BTR_PATH=/home/stu1//vmitosis-workloads/bin

OUTPUT_ANON=FB_usage_always.out

TIME_SEQ=$(seq 0 1000)

#execute bench
#time ${XSB_PATH}/XSBench -t 4 -g 50000 -p 14000000 &
time ${BTR_PATH}/bench_btree_st &

#log
for i in ${TIME_SEQ}
do
        echo "time: ${i}s" >> ${OUTPUT_ANON}
        cat /proc/meminfo | grep AnonPage >> ${OUTPUT_ANON}
        cat /proc/meminfo | grep AnonHuge >> ${OUTPUT_ANON}

        sleep 1
done

