#!/bin/bash

## Env
DIR=$(pwd)
INSTALL="0"

## Prerequisites
echo "Downloading OCP 4 installer if not exists:"
if [ ! -f ./ocp4-installer.tar.gz ]; then
    wget -O ./ocp4-installer.tar.gz https://mirror.openshift.com/pub/openshift-v4/clients/ocp/stable/openshift-install-linux.tar.gz && tar xvzf ./ocp4-installer.tar.gz .
else
    echo "Installer exists, using ./ocp4-installer.tar.gz. Unpacking..." ; echo " "
    tar xvzf ./ocp4-installer.tar.gz
fi

if [ ! -f ./install-dir/terraform.cluster.tfstate ]; then
    echo "AWS credentials: "; echo " "
    aws configure
    
    cleanup() {
        rm -f ./openshift-install
        rm -f ./README.md
        rm -f ~/.ssh/myocp*
    }
    
    echo "Generating SSH key pair" ; echo " "
    rm -f ~/.ssh/myocp* ; ssh-keygen -t rsa -b 4096 -N '' -f ~/.ssh/myocp
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/myocp
    ssh-add -L
    
    ## Install config file
    echo "Creating install config file" ; echo " "
    rm -f ./install-dir/install-config.yaml && rm -f ./install-dir/.openshift_install* ; ./openshift-install create install-config --dir=install-dir
    
    echo "Edit the installation file ./install-dir/install-config.yaml if you need."
    echo "Confirm when you are ready:" ; echo " "
    
    while true; do
        read -p "Proceed with OCP cluster installation: yY|nN -> " yn
        case $yn in
                [Yy]* ) echo "Installing OCP4 cluster... " ; INSTALL="1" ; break;;
                [Nn]* ) echo "Aborting installation..." ; cleanup ; ssh-add -D ; exit;;
                * ) echo "Select yes or no";;
        esac
    done
    
    if [ $INSTALL -gt 0 ]; then
    ./openshift-install create cluster --dir=install-dir --log-level=info
    echo "Set HTPasswd as Identity Provider" ; echo " "
    ./oauth.sh
    ssh-add -D
    fi
else
    echo "An OCP cluster exists. Skipping installation..."
fi

exit