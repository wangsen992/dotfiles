#!/bin/zsh

# Detect OS
OS="$(uname)"
IS_DARWIN=false
if [[ "$OS" == "Darwin" ]]; then
  IS_DARWIN=true
fi

# Install zsh and Oh My Zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Symlink .zshrc
rm -f $HOME/.zshrc
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc

# Locale setup (Linux only - macOS uses UTF-8 by default)
if [[ "$IS_DARWIN" == "false" ]]; then
  SUDO=$(which sudo)
  $SUDO apt update
  $SUDO apt install -y locales ncurses-term
  $SUDO locale-gen en_US.UTF-8
  $SUDO update-locale LANG=en_US.UTF-8
  echo "export LANG=en_US.UTF-8"  >> ~/.zshrc
  echo "export LC_ALL=en_US.UTF-8" >> ~/.zshrc
fi

# Homebrew setup
if [[ "$IS_DARWIN" == "true" ]]; then
  # macOS: use official Homebrew
  if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
  # Homebrew installer already adds eval to ~/.zshrc on macOS
  eval "$(brew shellenv)"
else
  # Linux: use Linuxbrew
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.zshrc
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Install tools via Homebrew
brew install neovim node

# tmux setup
if [[ "$IS_DARWIN" == "true" ]]; then
  brew install tmux
else
  SUDO=$(which sudo)
  $SUDO apt install -y tmux
fi

# TPM and catppuccin
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
git clone -b v2.1.3 https://github.com/catppuccin/tmux.git ~/.tmux/plugins/catppuccin/tmux

# neovim setup
mkdir -p $HOME/.config
ln -s $HOME/dotfiles/nvim $HOME/.config/nvim