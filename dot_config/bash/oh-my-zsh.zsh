# ~/.config/zsh/oh-my-zsh.zsh

export ZSH="$HOME/.oh-my-zsh"

# Tema Powerlevel10k
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins base
plugins=(
  git
  rails
  git
  node
  kubectl
  golang
  terraform
  aws
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Cargar Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Cargar configuración del tema
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
