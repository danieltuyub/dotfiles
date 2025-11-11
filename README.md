# Dotfiles portables (Neovim + Kitty)

Este repo contiene una configuración mínima y portable para Neovim y Kitty.

## Instalación

```bash
git clone git@github.com:danieltuyub/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
chmod +x install.sh scripts/detect_os.sh
./install.sh
nvim '+Lazy sync'

