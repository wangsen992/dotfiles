#!/bin/zsh

SUDO=$(which sudo)

# Pre-SETUP
$SUDO apt update

# Make sure icons appear correctly by setting locale
$SUDO apt update
$SUDO apt install -y locales ncurses-term
$SUDO locale-gen en_US.UTF-8
$SUDO update-locale LANG=en_US.UTF-8
echo "export LANG=en_US.UTF-8"  >> ~/.zshrc
echo "export LC_ALL=en_US.UTF-8" >> ~/.zshrc

# tmux setup
$SUDO apt install -y tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf

# neovim setup
mkdir -p $HOME/.config
mkdir -p ~/.tmux/plugins/catppuccin
git clone -b v2.1.3 https://github.com/catppuccin/tmux.git ~/.tmux/plugins/catppuccin/tmux
ln -s $HOME/dotfiles/nvim $HOME/.config/nvim


chsh -s $(which zsh); \
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
rm -f $HOME/.zshrc && ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";\ 
  echo >> /home/${USER}/.zshrc; \
  echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/user/.zshrc; \
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

/home/linuxbrew/.linuxbrew/bin/brew install neovim node
