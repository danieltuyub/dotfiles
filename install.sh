#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="${HOME}/.dotfiles"
CONFIG_DIR="${HOME}/.config"

mkdir -p "${CONFIG_DIR}"

# --- Identificar el sistema operativo ---
OS="$(${REPO_DIR}/scripts/detect_os.sh)"
echo "[install] Sistema detectado: ${OS}"

# --- Neovim ---
ln -snf "${REPO_DIR}/config/nvim" "${CONFIG_DIR}/nvim"
echo "[install] nvim → ${CONFIG_DIR}/nvim"

# --- Kitty ---
ln -snf "${REPO_DIR}/config/kitty" "${CONFIG_DIR}/kitty"
# Crea symlink local.conf → kitty-<os>.conf
pushd "${REPO_DIR}/config/kitty" >/dev/null
case "${OS}" in
    macos) TARGET="kitty-darwin.conf" ;;
    linux) TARGET="kitty-linux.conf" ;;
    wsl) TARGET="kitty-linux.conf" ;; # En windows
    *) TARGET="kitty-linux.conf" ;;
esac
ln -snf "${TARGET}" local.conf
popd >/dev/null
echo "[install] kitty → ${CONFIG_DIR}/kitty (local.conf → ${TARGET})"

echo "Instalación de dotfiles completada"
