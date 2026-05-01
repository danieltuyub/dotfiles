return {
  "zaldih/themery.nvim",
  lazy = false,
  cmd = { "Themery" },
  config = function()
    -- Función para obtener todos los colorschemes disponibles
    local function get_all_colorschemes()
      local cs = vim.fn.getcompletion("", "color")
      table.sort(cs)

      local themes = {}
      for _, name in ipairs(cs) do
        table.insert(themes, {
          name = name,
          colorscheme = name,
        })
      end
      return themes
    end

    require("themery").setup({
      themes = get_all_colorschemes(),
      livePreview = true,
      persist = true,
    })
  end,
}

