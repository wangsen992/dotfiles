#!/bin/bash

# Create User Env
# echo USER: $USER
# export USER_HOME=/home/${USER}
SUDO=$(which sudo)

wget install-node.vercel.app/lts && $SUDO bash lts --yes && rm lts

# download nvim source code and install pre-requistes
# cd /app
wget https://github.com/neovim/neovim/archive/refs/tags/v0.11.5.tar.gz
tar xzvf v0.11.5.tar.gz
rm v0.11.5.tar.gz

cd neovim-0.11.5
$SUDO apt-get install -y ninja-build gettext cmake unzip curl build-essential
# make CMAKE_BUILD_TYPE=Release
$SUDO make CMAKE_INSTALL_PREFIX=/usr/local install
$SUDO rm -rf neovim-stable
