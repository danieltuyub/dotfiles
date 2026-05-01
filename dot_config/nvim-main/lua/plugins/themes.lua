return {
  ---------------------------------------------------------------------------
  --  CATPPUCCIN
  ---------------------------------------------------------------------------
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- mocha, macchiato, frappe, latte
        transparent_background = false,
        term_colors = true,
        integrations = {
          treesitter = true,
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
            },
            underlines = {
              errors = { "underline" },
              hints = { "underline" },
              warnings = { "underline" },
              information = { "underline" },
            },
          },
          lsp_trouble = true,
          cmp = true,
          gitsigns = true,
          neogit = true,
          telescope = true,
          nvimtree = true,
          which_key = true,
          indent_blankline = {
            enabled = true,
            scope_color = "lavender",
          },
          mason = true,
          notify = true,
          noice = true,
          mini = {
            enabled = true,
            indentscope_color = "lavender",
          },
          diffview = true,
          neotest = true,
        },
      })

      -- Tema por defecto al arrancar
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },

  ---------------------------------------------------------------------------
  --  TOKYONIGHT
  ---------------------------------------------------------------------------
  {
    "folke/tokyonight.nvim",
    priority = 900,
    opts = {
      style = "night", -- night, storm, day, moon
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "dark",
        floats = "dark",
      },
      sidebars = { "qf", "help", "undotree", "terminal", "packer" },
      lualine_bold = true,
    },
  },

  ---------------------------------------------------------------------------
  --  KANAGAWA
  ---------------------------------------------------------------------------
  {
    "rebelot/kanagawa.nvim",
    priority = 900,
    opts = {
      compile = false,
      theme = "wave", -- wave, dragon, lotus
      background = {
        dark = "wave",
        light = "lotus",
      },
      transparent = false,
      dimInactive = false,
      terminalColors = true,
      colors = {},
      overrides = function(colors)
        local theme = colors.theme
        return {
          -- Ejemplo: resaltar línea de diagnóstico
          DiagnosticUnderlineError = { sp = theme.diag.error, undercurl = true },
          DiagnosticUnderlineWarn  = { sp = theme.diag.warning, undercurl = true },
          DiagnosticUnderlineInfo  = { sp = theme.diag.info, undercurl = true },
          DiagnosticUnderlineHint  = { sp = theme.diag.hint, undercurl = true },
        }
      end,
    },
  },

  ---------------------------------------------------------------------------
  --  NIGHTFOX (nightfox / nordfox / duskfox / etc.)
  ---------------------------------------------------------------------------
  {
    "EdenEast/nightfox.nvim",
    priority = 900,
    opts = {
      options = {
        transparent = false,
        terminal_colors = true,
        dim_inactive = false,
        styles = {
          comments = "italic",
          keywords = "italic",
          functions = "bold",
          strings = "NONE",
          variables = "NONE",
        },
        inverse = {
          match_paren = true,
          visual = true,
          search = true,
        },
      },
      groups = {
        all = {
          LspCodeLens = { fg = "#888888", style = "italic" },
        },
      },
      modules = {
        telescope = true,
        lsp_trouble = true,
        gitsigns = true,
        nvimtree = true,
        whichkey = true,
        hop = true,
        cmp = true,
      },
    },
  },

  ---------------------------------------------------------------------------
  --  GRUVBOX MATERIAL
  ---------------------------------------------------------------------------
  {
    "sainnhe/gruvbox-material",
    priority = 900,
    config = function()
      vim.g.gruvbox_material_background = "medium" -- soft, medium, hard
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_diagnostic_text_highlight = 1
      vim.g.gruvbox_material_diagnostic_line_highlight = 1
      vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
      vim.g.gruvbox_material_enable_better_performance = 1
      -- No aplicamos colorscheme aquí para no sobrescribir el principal
    end,
  },

  ---------------------------------------------------------------------------
  --  ONEDARK
  ---------------------------------------------------------------------------
  {
    "navarasu/onedark.nvim",
    priority = 900,
    opts = {
      style = "darker", -- dark, darker, cool, deep, warm, war, light
      transparent = false,
      term_colors = true,
      code_style = {
        comments = "italic",
        keywords = "italic",
        functions = "none",
        strings = "none",
        variables = "none",
      },
      lualine = {
        transparent = false,
      },
      diagnostics = {
        darker = true,
        undercurl = true,
        background = false,
      },
    },
  },
  {
    "projekt0n/github-nvim-theme",
    priority = 900,
  },
  {
    "jacoborus/tender.vim",
    proiority = 900,
  },
  {
    "marko-cerovac/material.nvim",
    priority = 900,
  },
  {
    "bluz71/vim-moonfly-colors",
    priority = 900,
  },
  { "blazkowolf/gruber-darker.nvim",
    priority = 900,
  },
}
