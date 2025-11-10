#!/bin/zsh

# tmux setup
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotfiles/tmux $HOME/.tmux

# neovim setup
mkdir -p $HOME/.config
ln -s $HOME/dotfiles/nvim $HOME/.config/nvim
