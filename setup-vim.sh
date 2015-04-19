#!/usr/bin/env bash

GH_CONFIG_PATH=`pwd`
REQUIRED_MEM=`cat /proc/meminfo | awk 'NR==3||NR==16' | awk '{sum+=$2;} END {print sum}'`

if [ "$REQUIRED_MEM" -lt 875 ]; then
  echo "Might not have enough memory to compile YouCompleteMe"
  exit 1
fi

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
sed -n '1,/End of Vundle/p' $GH_CONFIG_PATH/.vimrc > ~/.vimrc

# setup folders
mkdir -p ~/.vim/{bundle,backup,swap,undo}
cd ~/.vim && git init && \
  printf "backup/\nswap/\nundo/\n" >> .gitignore

# clone Vundle
git submodule add https://github.com/gmarik/Vundle.vim bundle/Vundle.vim

# install Vundle plugins
vim +PluginInstall +qall

# compile YouCompleteMe
sudo apt-get install -y build-essential cmake python-dev
cd ~/.vim/bundle/YouCompleteMe && ./install.sh --clang-completer

# copy .vimrc
cp $GH_CONFIG_PATH/.vimrc ~/.vimrc
