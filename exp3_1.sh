#!/bin/bash

XSB_PATH=/home/stu1/XSBench/openmp-threading
#FILEB_PATH=/home/stu1/filebench-1.5-alpha3/workloads

OUTPUT_EXP3_1=FX_hugepage2_defer.out

TIME_SEQ=$(seq 0 600)

#THP enable
#echo always > /sys/kernel/mm/transparent_hugepage/enabled
#echo always > /sys/kernel/mm/transparent_hugepage/defrag

#execute bench
#echo `cd /home/stu1/filebench-1.5-alpha3/workloads ; filebench -f fileserver.f` &
${XSB_PATH}/XSBench -t 4 -g 60000 -p 14000000 &


#log
for i in ${TIME_SEQ}
do
        echo "time: ${i}s" >> ${OUTPUT_EXP3_1}
        cat /proc/meminfo | grep AnonHuge >> ${OUTPUT_EXP3_1}

        sleep 1
done

#THP disable
#echo never > /sys/kernel/mm/transparent_hugepage/enabled
#echo never > /sys/kernel/mm/transparent_hugepage/defrag

#kill
sudo killall -9 filebench
sudo killall -9 XSBench
