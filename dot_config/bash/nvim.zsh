#!/bin/bash 

# perfil por defecto
export NVIM_PROFILE="nvim-main"

nvim() {
  NVIM_APPNAME="$NVIM_PROFILE" command nvim "$@"
}
