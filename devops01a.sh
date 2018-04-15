#!/bin/bash

volume() {
  vol_num=`expr $(df | wc -l) - 1`
  echo "Number of volumes: $vol_num"

  printf "\n"
  echo "Size of each volume:"
  df | awk '{printf "%-25s %5s\n",$1, $2}'

  printf "\n"
  echo "Free space on each volume: "
  df | awk '{printf "%-25s %5s\n",$1, $4}'
}

cpu() {
  printf "\n"
  echo "Number of cpu/cores: "
  grep -c ^processor /proc/cpuinfo

  printf "\n"
  echo "Information about the cpu/cores: "
  lscpu
}

ram() {
  printf "\n"
  echo "Amount of ram: "
  free -m
}

network() {
  printf "\n"
  echo "IP Address: `ifconfig | head -2 | grep 'inet ' | tr -s ' ' | sed 's/addr://g' |cut -d' ' -f3`"
  echo "MAC Address: `ifconfig | head -1 | tr -s ' ' | cut -d' ' -f5 | tr ':' ' ' |tr 'a-z' 'A-Z'|sed 's/ //g'`"
}

volume
cpu
ram
network
