#!/bin/zsh

# tmux cleanup
rm $HOME/.tmux.conf
rm -r $HOME/.tmux

# required
rm ~/.config/nvim{,.bak}

# optional but recommended
rm ~/.local/share/nvim{,.bak}
rm ~/.local/state/nvim{,.bak}
rm ~/.cache/nvim{,.bak}
