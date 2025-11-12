# Pull directly from tensorflow as a quick-fix to enable gpu device
# FROM nvidia/cuda:11.8.0-base-ubuntu22.04
ARG BASE=ubuntu

FROM ${BASE}

# Default values provided here, overridden from either command line
# or compose file. 
ARG DI_RESOURCES=resource
ARG IMAGE_RESOURCES=/app/resource
ARG USER=user

RUN mkdir /app; chmod 777 /app
WORKDIR /app

# COPY Resources
COPY resource /app/resource

RUN apt-get update; \
  apt-get install -y sudo wget git build-essential zsh curl ripgrep \
                     ruby-full fd-find python3;\
  rm -r /var/lib/apt/lists
RUN bash /app/resource/add_user.sh ${USER}

USER ${USER}
WORKDIR /home/${USER}

# Install node
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash ;\
    bash -c ". $HOME/.nvm/nvm.sh; nvm install 24" ;\
    echo "\. $HOME/.nvm/nvm.sh" >> $HOME/.zshrc

RUN git clone https://github.com/wangsen992/dotfiles; bash dotfiles/install.sh

RUN bash /app/resource/install_nvim.sh

