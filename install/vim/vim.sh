#!/usr/bin/env bash

SRC_DIR=$(cd $(dirname $BASH_SOURCE) && pwd)
REQUIRED_MEM=`cat /proc/meminfo | awk 'NR==3||NR==16' | awk '{sum+=$2;} END {print sum}'`

if [ "$REQUIRED_MEM" -lt 875 ]; then
  echo "Might not have enough memory to compile YouCompleteMe"
  exit 1
fi

# install vim and git
sudo apt-get install -y vim \
                        vim-gnome `# add vim clipboard support` \
                        git

# copy .vimrc for Vundle
sed -n '1,/End of Vundle/p' $SRC_DIR/.vimrc > $HOME/.vimrc

# setup folders
mkdir -p $HOME/.vim/{bundle,backup,swap,undo}

# Vundle
# ======
# install Vundle
git clone https://github.com/gmarik/Vundle.vim $HOME/.vim/bundle/Vundle.vim
# install Vundle plugins
vim +PluginInstall +qall


# YouCompleteMe
# =============
# install prerequisites
sudo apt-get install -y build-essential cmake python-dev
# compile and install YouCompleteMe
(cd $HOME/.vim/bundle/YouCompleteMe && ./install.py)


# term_for_vim
# ============
# install nvm
#wget -qO- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
# reload nvm
#. $HOME/.nvm/nvm.sh
# install npm and node.js
#nvm install stable 2> /dev/null
#nvm alias default stable
# install tern
#(cd $HOME/.vim/bundle/tern_for_vim && npm install)


# symbolic link .vimrc
#rm $HOME/.vimrc && ln -s $SRC_DIR/.vimrc $HOME
