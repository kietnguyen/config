#!/usr/bin/env bash

SRC_DIR=$(cd $(dirname $BASH_SOURCE) && pwd)

# Install and copy config file
sudo apt-get install -y i3

# Copy config files
ln -s ${SRC_DIR}/.i3 ${HOME}/
