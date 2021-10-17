#!/bin/bash

# This script is for building custom ISO for neuroimaging analysis.
# Oct 13, 2021 written by Fumitoshi Kodaka
# To install Cubic visit https://launchpad.net/cubic, do below in your Ubuntu.
#   $ sudo apt-add-repository ppa:cubic-wizard/release
#   $ sudo apt update
#   $ sudo apt install --no-install-recommends cubic
# Prepare Ubuntu 18.04 ISO
# Start Cubic and select Ubuntu 18.04 ISO image.

apt update
apt upgrade -y

apt install git curl vim -y

. ./functions/functions
# cd $HOME

# start installer
while :
do
    echo "###############################################################"
    echo "    ###   #    ########     ####         ####         ######   "
    echo "    # ##  #       ##         ##        ##  ##       ###        "
    echo "    #  ## #       ##         ##       #########     ###        "
    echo "    #   ###       ##        ####           ##         ######   "
    echo "###############################################################"
    echo "Welcome to Neuroimaging Tool(s) Installer for Cubic (NTI4C) CLI"
    echo "Please input a number of tool(s) liseted below you want [1-3]. "
    echo "If you want to quit, press q key                               "
    echo "          1. FSL | 2. FreeSurfer | 3. AFNI                     "
    echo "###############################################################"
    
    read tool_number
    if [[ ${tool_number} =~ [1-3] ]]; then
        echo "OK, go ahead!"
        break
    elif [ $tool_number = "q" ]; then
        break
    else
        echo "Select just a number of tools listed below"
    fi
done

case $tool_number in
    "q")
        echo "Install process canceled"
        ;;
    1)
        echo "FSL is selected"
        install_fsl
        ;;
    2)
        echo "Specify the series of the version of FreeSurfer [6.0.1 or 7.2.0]./
        If you want to quit, press q key."
        while :
        do
            read version
            if [ $version = 6.0.1 ]; then
                echo "FreeSurfer version 6.0.1"
                install_freesurfer 6.0.1
                break
            elif [ $version = 7.2.0 ]; then
                echo "FreeSurfer version 7.1.0"
                install_freesurfer 7.2.0
                break
            elif [ $version = "q" ]; then
                echo "Canceling installation..."
                exit 0
            else 
                echo "Specify either 6.0.1 or 7.2.0"
            fi
        done
        ;;
    3) 
        echo "AFNI selected"
        ;;
esac
