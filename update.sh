#!/bin/bash

echo -e "\n$(date "+%d-%m-%Y --- %T") --- Working\n"

if [ ! $UID -eq 0 ]; then
    echo -e "Please run this script as root or using sudo\n"
    echo -e "$(date "+%d-%m-%Y --- %T") --- Script Terminated\n"
    exit
else
    apt-get update
    apt-get -y upgrade

    apt-get -y autoremove
    apt-get autoclean

    echo -e "\nRunning on $HOSTNAME"
fi

echo -e "\n$(date "+%d-%m-%Y --- %T") --- Script Terminated\n"
