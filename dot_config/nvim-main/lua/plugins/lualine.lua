return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",

  config = function()
    local ok, lualine = pcall(require, "lualine")
    if not ok then
      return
    end

    -- Componente: icono de LSP actual (o “No LSP”)
    local function lsp_name()
      local clients = vim.lsp.get_clients({ bufnr = 0 })
      if next(clients) == nil then
        return "No LSP"
      end
      local names = {}
      for _, client in ipairs(clients) do
        table.insert(names, client.name)
      end
      return " " .. table.concat(names, ",")
    end

    -- Componente: nombre de archivo estilo VSCode (ruta relativa)
    local filename = {
      "filename",
      path = 1, -- 0 = solo nombre, 1 = relativo, 2 = absoluto
      symbols = {
        modified = " ●",     -- archivo modificado
        readonly = " ",
        unnamed  = "[No Name]",
        newfile  = "[New]",
      },
    }

    -- Componente: branch git con iconito
    local branch = {
      "branch",
      icon = "",
    }

    lualine.setup({
      options = {
        theme = "auto",
        icons_enabled = true,
        component_separators = { left = "│", right = "│" },
        section_separators   = { left = "",  right = ""  },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        globalstatus = true, -- barra única como VSCode
        always_divide_middle = true,
      },

      sections = {
        -- IZQUIERDA (como status bar de VSCode)
        lualine_a = {
          { "mode", icon = "" }, -- modo + iconito Neovim
        },
        lualine_b = {
          branch,
          "diff",
        },
        lualine_c = {
          filename,
        },

        -- DERECHA (info tipo VSCode)
        lualine_x = {
          {
            "diagnostics",
            symbols = { error = " ", warn = " ", info = " ", hint = " " },
          },
          lsp_name,
          { "encoding", fmt = string.upper }, -- UTF-8
          "fileformat",                        -- unix / dos / mac
          "filetype",                          -- ruby, lua, go, etc.
        },
        lualine_y = {
          "progress", -- 50%
        },
        lualine_z = {
          "location", -- línea:columna
        },
      },

      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { filename },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },

      extensions = { "nvim-tree", "quickfix", "fugitive" },
    })
  end,
}
