#!/bin/bash

GH_CONFIG_PATH=`pwd`

# install git and init
#sudo apt-get install -y git

# install pip
wget -O - --no-check-certificate https://bootstrap.pypa.io/get-pip.py | python - --user

# setup local bin for pip
echo "PATH=$PATH:~/.local/bin" >> ~/.bashrc && source ~/.bashrc

# remove a submodule by
#git submodule deinit -f a_submodule
#git rm -f a_submodule
#git rm --cached a_submodule

# copy .vimrc for Vundle
cp $GH_CONFIG_PATH/.vimrc-vundle ~/.vimrc

# setup folders
mkdir -p ~/.vim/bundle
cd ~/.vim && git init

# clone Vundle
git submodule add https://github.com/gmarik/Vundle.vim bundle/Vundle.vim

# install Vundle plugins
vim +PluginInstall +qall

# compile YouCompleteMe
sudo apt-get install -y build-essential cmake python-dev
cd ~/.vim/bundle/YouCompleteMe && ./install.sh --clang-completer

# copy .vimrc
cp $GH_CONFIG_PATH/.vimrc ~/.vimrc
