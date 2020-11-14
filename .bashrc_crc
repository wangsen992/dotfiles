#Check http://crc.nd.edu/wiki for login problems
#Contact crcsupport@nd.edu if further problems
PKG_CONFIG_PATH=/usr/share/pkgconfig:/usr/share/pkgconfig

if [ -r /opt/crc/Modules/current/init/bash ]; then
        source /opt/crc/Modules/current/init/bash
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# Workaround to enable tab-expand an environment variable
# Details see (https://stackoverflow.com/questions/6418493/bash-variable-expansion-on-tab-complete)
shopt -s direxpand

# Environmental variables
export CPATH=$HOMEBREW_PREFIX/include
export WORKSPACE=/scratch365/$USER/Workspace
export EDITOR=nvim
export OPAL_PREFIX=$HOME/.linuxbrew/Cellar/open-mpi/4.0.4_1
export XML_CATALOG_FILES="/afs/crc.nd.edu/user/s/swang18/.linuxbrew/etc/xml/catalog"

export PATH=$HOME/usr/bin/:$PATH
unset PKG_CONFIG_PATH
eval $(/afs/crc.nd.edu/user/s/swang18/.linuxbrew/bin/brew shellenv)

#Additional aliases
alias work="cd $WORKSPACE"
alias emacs="emacs -q -l ~/.emacs.d/init.el"
alias src-of="source ~/usr/opt/openfoam/etc/bashrc"

#Additional modules


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/afs/crc.nd.edu/user/s/swang18/usr/opt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/afs/crc.nd.edu/user/s/swang18/usr/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/afs/crc.nd.edu/user/s/swang18/usr/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/afs/crc.nd.edu/user/s/swang18/usr/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
conda deactivate
# <<< conda initialize <<<

