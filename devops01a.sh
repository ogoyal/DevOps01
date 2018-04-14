#!/bin/bash

vol_num=`expr $(df | wc -l) - 1`
echo "Number of volumes: $vol_num"

printf "\n"
echo "Size of each volume:"
df | awk '{printf "%-25s %5s\n",$1, $2}'

printf "\n"
echo "Free space on each volume: "
df | awk '{printf "%-25s %5s\n",$1, $4}'

printf "\n"
echo "Number of cpu/cores"
grep -c ^processor /proc/cpuinfo

printf "\n"
echo "Information about the cpu/cores"
lscpu

printf "\n"
echo "Amount of ram"
free -m


