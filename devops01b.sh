#!/bin/bash

# Import functions from devops01a.sh
source "$(pwd)/devops01a.sh" >/dev/null

if [ -z "$1" ]; then
    echo "[-volumes] : display volume information."
    echo "[-cpu]     : display cpu information."
    echo "[-ram]     : display ram information."
    echo "[-network] : display mac & ip address."
    echo "[-all]     : display information for all command line options."
else
    for i in "$@" ; do
        if [[ $i == "-all" ]]; then
            volume; cpu; ram; network;
            exit 1;
        fi
    done

    for i in "$@" ; do
        if [[ $i == "-volumes" ]]; then
            volume;
        fi
        if [[ $i == "-cpu" ]]; then
            cpu;
        fi
        if [[ $i == "-ram" ]]; then
            ram;
        fi
        if [[ $i == "-network" ]]; then
            network;
        fi
    done

fi

