# Default values provided here, overridden from either command line
# or compose file. 
ARG BASE=ubuntu

# Select base image
# NOTE: : Image should be debian based for this dockerfile
FROM ${BASE}

ARG USER=user
# COPY Resources
RUN mkdir /app; chmod 777 /app
COPY resource /app/resource

# Install essentials for os setup
RUN apt-get update; \
  apt-get install -y --no-install-recommends \
  sudo wget git build-essential zsh curl ripgrep ruby-full fd-find python3;\
  rm -r /var/lib/apt/lists
RUN bash /app/resource/add_user.sh ${USER}

# Switch to USER for user-level setup
USER ${USER}
WORKDIR /home/${USER}

RUN git clone https://github.com/wangsen992/dotfiles
RUN bash dotfiles/install.sh
RUN sudo locale-gen en_US.UTF-8
# RUN chsh -s $(which zsh); \
#   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
# RUN NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";\ 
#   echo >> /home/${USER}/.zshrc; \
#   echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/user/.zshrc; \
#   eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# 
# RUN /home/linuxbrew/.linuxbrew/bin/brew install neovim node
