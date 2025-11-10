#!/bin/zsh

# Pre-SETUP
apt update
apt install git wget tmux

# Make sure icons appear correctly by setting locale
apt update
apt install -y locales
locale-gen en_US.UTF-8
update-locale LANG=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# tmux setup
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf

# neovim setup
mkdir -p $HOME/.config
mkdir -p ~/.tmux/plugins/catppuccin
git clone -b v2.1.3 https://github.com/catppuccin/tmux.git ~/.tmux/plugins/catppuccin/tmux
ln -s $HOME/dotfiles/nvim $HOME/.config/nvim
