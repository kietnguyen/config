#!/usr/bin/env bash

if [ $EUID != 0 ]; then
  sudo "$0" "$@"
  exit $?
fi

SRC_DIR=`dirname $BASH_SOURCE`

# Install VirtualBox
sudo echo "deb http://download.virtualbox.org/virtualbox/debian vivid contrib" > /etc/apt/sources.list.d/virtualbox.list
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
sudo apt-get -q update
sudo apt-get -qy install virtualbox-4.3

# Install vagrant
wget -qO - http://www.vagrantup.com/downloads.html | grep -Eo 'https?://\S+/vagrant_[0-9.]+_x86_64.deb' | head -1 | xargs wget -N && \
sudo dpkg -i vagrant_*_x86_64.deb && \
rm vagrant_*_x86_64.deb
