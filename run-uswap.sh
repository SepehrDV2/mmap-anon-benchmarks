#!/bin/bash

echo 1 > /proc/sys/vm/drop_caches

echo "dev,seq,hint,threads,time,workGB,tlb,readGB,CPUwork"


## seq 1 SSD native page
numactl --cpunodebind=0 --membind=0 timeout 310s ./mmapbench /dev/null 1 1 0 0 1
echo 1 > /proc/sys/vm/drop_caches

## seq 1 SSD huge page
#cgexec -g memory:gups_tests numactl --cpunodebind=1 --membind=1 timeout 210s ./mmapbench /dev/null 1 1 0 1 1; echo 1 > /proc/sys/vm/drop_caches
#timeout 210s ./mmapbench /dev/null 20 1 0 | grep -v CPUwork ; echo 1 > /proc/sys/vm/drop_caches
#timeout 210s ./mmapbench /blk/s2 20 1 1 | grep -v CPUwork ; echo 1 > /proc/sys/vm/drop_caches
#timeout 210s ./mmapbench /blk/s2 20 1 2 | grep -v CPUwork ; echo 1 > /proc/sys/vm/drop_caches

#fio --filesize=2TB --filename=/blk/s2 --io_size=2TB --name=randbla --rw=randread --iodepth=256 --ioengine=libaio --direct=1 --blocksize=1MB --numjobs=1 --bandwidth-log --output=/dev/null 2> /dev/null
#/bin/cp agg-read_bw.log seq1.csv

## rnd 1 SSD
#timeout 210s ./mmapbench /blk/s2 100 0 0 | grep -v CPUwork ; echo 1 > /proc/sys/vm/drop_caches
#timeout 210s ./mmapbench /blk/s2 100 0 1 | grep -v CPUwork ; echo 1 > /proc/sys/vm/drop_caches
#timeout 210s ./mmapbench /blk/s2 100 0 2 | grep -v CPUwork ; echo 1 > /proc/sys/vm/drop_caches

#fio --filesize=2TB --filename=/blk/s2 --io_size=8GB --name=randbla --rw=randread --iodepth=1 --ioengine=psync --direct=1 --blocksize=4096 --numjobs=100 --bandwidth-log --output=/dev/null 2> /dev/null
#/bin/cp agg-read_bw.log rnd1.csv
