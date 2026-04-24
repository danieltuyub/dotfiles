return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  priority = 1000,
  config = function()
    require("tiny-inline-diagnostic").setup({
      options = {
        override_open_float = true,
        throottle = 200,
      },
    })
    vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
  end,
}
