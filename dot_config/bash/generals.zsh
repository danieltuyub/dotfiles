#!/bin/bash 

export EZA_CONFIG_DIR=~/.config/eza
export EDITOR=nvim
export LANG=en_US.UTF-8

# perfil por defecto
export NVIM_APPNAME="nvim-main"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

# Configuraciones de nvim
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

