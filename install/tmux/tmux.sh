#!/usr/bin/env bash

SRC_DIR=$(cd $(dirname $BASH_SOURCE) && pwd)

# Install and copy config file
sudo apt-get install -y tmux xclip

# Copy config files
ln -s ${SRC_DIR}/.tmux.conf ~/
