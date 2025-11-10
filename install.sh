#!/bin/zsh

# tmux setup
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf

# neovim setup
mkdir -p $HOME/.config
ln -s $HOME/dotfiles/nvim $HOME/.config/nvim
