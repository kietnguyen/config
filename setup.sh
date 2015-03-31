#!/bin/bash

# Make sure only root can run this script
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi


# setup vim
./setup-vim.sh


# setup tmux
cp .tmux.conf ~/.

