#!/bin/zsh

# tmux setup
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf

# neovim setup
mkdir -p $HOME/.config
mkdir -p ~/.tmux/plugins/catppuccin
git clone -b v2.1.3 https://github.com/catppuccin/tmux.git ~/.tmux/plugins/catppuccin/tmux
ln -s $HOME/dotfiles/nvim $HOME/.config/nvim
