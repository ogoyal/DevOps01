#!/bin/bash

volume() {
  echo "***VOLUME***"
  vol_num=`expr $(df | wc -l) - 1`
  echo "Number of volumes: $vol_num"

  printf "\n"
  echo "Size of each volume:"
  df | awk '{printf "%-25s %5s\n",$1, $2}'

  printf "\n"
  echo "Free space on each volume: "
  df | awk '{printf "%-25s %5s\n",$1, $4}'
  
  printf "\n"
}

cpu() {
  echo "***CPU***"
  cpu_num=`expr $(grep -c ^processor /proc/cpuinfo)`
  echo "Number of cpu/cores: $cpu_num"

  printf "\n"
  echo "Information about the cpu/cores: "
  lscpu

  printf "\n"
}

ram() {
  echo "***RAM***"
  free -m

  printf "\n"
}

network() {
  echo "***NETWORK***"
  echo "IP Address: `hostname -I`"
  IFACE=`ip route | awk '{print $3}'`
  echo "MAC Address: `cat /sys/class/net/$IFACE/address`"

  printf "\n"
}

volume
cpu
ram
network

