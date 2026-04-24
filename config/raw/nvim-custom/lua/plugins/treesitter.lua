return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  branch = "master",
  config = function()
    require("nvim-treesitter.configs").setup({
      -- Lenguajes que quieres tener instalados
      ensure_installed = {
        "javascript",   -- Node (JS)
        "typescript",
        "tsx",          -- TSX/React, por si acaso
        "go",
        "html",
        "vim",
        "lua",
        "ruby",
        "terraform",
        "hcl",          -- Terraform usa también HCL
        "markdown",
        "markdown_inline",
        "json",
        "yaml",
      },
      sync_install = false,
      auto_install = true,  -- instala parser al abrir un archivo nuevo (si tienes tree-sitter CLI)
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
        disable = { "ruby" },
      },
    })
  end,
}

