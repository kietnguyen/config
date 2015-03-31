#!/usr/bin/bash

# setup folders
mkdir -p ~/.vim/{bundle,colors}
cd ~/.vim

# install git and init
#sudo apt-get install -y git
#git init

# install pip
wget -O - --no-check-certificate https://bootstrap.pypa.io/get-pip.py | python - --user

# setup local bin for pip
echo "PATH=$PATH:~/.local/bin" >> ~/.bashrc && source ~/.bashrc

# remove a submodule by
#git submodule deinit -f a_submodule
#git rm -f a_submodule
#git rm --cached a_submodule

# clone Vundle
git submodule add https://github.com/gmarik/Vundle.vim bundle/Vundle.vim

# copy .vimrc
cp .vimrc ~/. && vim +PluginInstall +qall

# compile YouCompleteMe
sudo apt-get install -y build-essential cmake python-dev
cd ~/.vim/bundle/YouCompleteMe && ./install.sh --clang-completer
