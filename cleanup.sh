#!/bin/zsh

echo "Cleaning up dotfiles..."

# tmux
rm -f $HOME/.tmux.conf
rm -rf $HOME/.tmux

# neovim
rm -rf $HOME/.config/nvim{,.bak}
rm -rf $HOME/.local/share/nvim{,.bak}
rm -rf $HOME/.local/state/nvim{,.bak}
rm -rf $HOME/.cache/nvim{,.bak}

# zsh
rm -f $HOME/.zshrc
rm -rf $HOME/.oh-my-zsh

# homebrew (macOS)
if [[ "$(uname)" == "Darwin" ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
fi

echo "Done! Restart your shell to complete cleanup."