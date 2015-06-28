#!/usr/bin/env bash

wget -qO- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

# reload nvm for non-interactive shell
. ~/.nvm/nvm.sh

# install npm
nvm install stable 2> /dev/null
nvm alias default stable
