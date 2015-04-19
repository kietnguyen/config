#!/usr/bin/env bash

# Make sure only root can run this script
#if [[ $EUID -ne 0 ]]; then
#   echo "This script must be run as root" 1>&2
#   exit 1
#fi

# update software sources
sudo apt-get update
#sudo apt-get upgrade -y


# setup vim
./setup-vim.sh


# setup tmux
sudo apt-get install -y tmux xclip && cp .tmux.conf ~/.


# setup i3
#sudo apt-get install -y i3 && cp -r .i3 ~/.
