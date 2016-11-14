#!/usr/bin/env bash

SRC_DIR=$(cd $(dirname "${BASH_SOURCE}") && pwd)

# Install and copy config file
sudo apt-get install -y tmux xclip

# Install TMUX Plugin Manager (TPM)
# See: https://github.com/tmux-plugins/tpm
git clone https://github.com/tmux-plugins/tpm "${HOME}"/.tmux/plugins/tpm

# Copy config files
#ln -s "${SRC_DIR}"/.tmux.conf "${HOME}"

# Reload TMUX environment
tmux source "${HOME}"/.tmux.conf
