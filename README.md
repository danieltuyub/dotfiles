# Dotfiles con Chezmoi

Mis configuraciones personales gestionadas con [chezmoi](https://www.chezmoi.io/).

## 🚀 Herramientas incluidas

- **Terminal:** [Kitty](https://sw.kovidgoyal.net/kitty/) (Configuración modular para macOS/Linux).
- **Shell:** Zsh con [Oh My Zsh](https://ohmyz.sh/), [Powerlevel10k](https://github.com/romkatv/powerlevel10k) y plugins esenciales.
- **Editor:** [Neovim](https://neovim.io/) (perfil `nvim-main` basado en Lazy.nvim).
- **Utilidades:** 
  - [eza](https://github.com/eza-community/eza) con soporte de temas dinámicos.
  - GitHub CLI (`gh`).
  - Aliases y funciones personalizadas en `.config/bash/`.

## 📦 Instalación

Para aplicar estos dotfiles en una nueva máquina:

```bash
# Instalar chezmoi
sh -c "$(curl -fsSL https://git.io/chezmoi)"

# Inicializar y aplicar
chezmoi init https://github.com/danieltuyub/dotfiles.git
chezmoi apply
```

## 🛠 Estructura del repositorio

- `dot_config/`: Configuraciones que se despliegan en `~/.config/`.
  - `nvim-main/`: Configuración completa de Neovim.
  - `kitty/`: Terminal multiplataforma.
  - `eza/`: Temas para el reemplazo de `ls`.
  - `bash/`: Scripts de Zsh/Bash (aliases, variables de entorno).
- `dot_zshrc.tmpl`: Plantilla para el archivo `.zshrc`.
- `.chezmoiexternal.toml`: Gestión de plugins y temas externos (Zsh, eza).
- `.chezmoidata.toml`: Variables locales (como `eza_theme`).

## 🎨 Personalización de eza

Para cambiar el tema de `eza`, edita `.chezmoidata.toml`:

```toml
eza_theme = "tokyonight"
```

Luego ejecuta `chezmoi apply`.
