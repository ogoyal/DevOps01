#!/bin/bash

source "$(pwd)/devops01a.sh" >/dev/null

if [ "$1" == "-all" ]; then
    volume
    cpu
    ram
    network
elif [ "$1" == "-volumes" ]; then
    volume
elif [ "$1" == "-cpu" ]; then
    cpu
elif [ "$1" == "-ram" ]; then
    ram
elif [ "$1" == "-network" ]; then
    network
else
    echo "-volumes : display volume information"
    echo "-cpu : display cpu information"
    echo "-ram : display ram information"
    echo "-network : display mac & ip address"
    echo "-all : display information for all command line options"
fi


