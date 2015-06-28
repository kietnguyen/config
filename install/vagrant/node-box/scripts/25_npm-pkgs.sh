#!/usr/bin/env bash

echo 'export prefix=$HOME/local/npm-packages' >> ~/.npmrc

echo '# npm packages' >> ~/.bashrc
echo 'export PATH=$HOME/local/npm-packages/bin:$PATH' >> ~/.bashrc

# reload nvm, node, and npm for non-interactive shell
. ~/.nvm/nvm.sh

# No bower's statistics question
echo '{ "interactive": false }' >> ~/.bowerrc

npm install -g bower    \
               gulp     \
               yo       \
               jshint
#npm install -g ionic generator-meanjs
