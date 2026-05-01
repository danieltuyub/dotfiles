return {
  "Shatur/neovim-session-manager",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local Path = require("plenary.path")
    require("session_manager").setup({
      sessions_dir = Path:new(vim.fn.stdpath("data"), "sessions"), -- Carpeta donde se guardan sesiones
      autoload_mode = require("session_manager.config").AutoloadMode.Disabled,
      autosave_last_session = true,
      autosave_ignore_filetypes = { "gitcommit", "gitrebase", "dashboard" },
      autosave_ignore_not_normal = true,
      autosave_ignore_dirs = { "~/", "/" },
    })
  end,
}
