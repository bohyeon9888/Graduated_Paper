#!/bin/bash

XSB_PATH=/home/stu1/XSBench/openmp-threading
FILEB_PATH=/home/stu1/filebench-1.5-alpha3/workloads

OUTPUT_ANON=Anon_usage.out
OUTPUT_ANONHUGE=Anonhuge_usage.out

TIME_SEQ=$(seq 0 300)

#THP enable
echo always > /sys/kernel/mm/transparent_hugepage/enabled
echo always > /sys/kernel/mm/transparent_hugepage/defrag

#execute bench
${XSB_PATH}/XSBench -t 4 -g 60000 -p 9000000 &

#log
for i in ${TIME_SEQ}
do
	echo "time: ${i}s" >> ${OUTPUT_ANON}
	echo "time: ${i}s" >> ${OUTPUT_ANONHUGE}
	cat /proc/meminfo | grep AnonPage >> ${OUTPUT_ANON}
	cat /proc/meminfo | grep AnonHuge >> ${OUTPUT_ANONHUGE}

	sleep 1
done

#THP disable
echo never > /sys/kernel/mm/transparent_hugepage/enabled
echo never > /sys/kernel/mm/transparent_hugepage/defrag

#kill
sudo killall -9 XSBench
