return {
  "nvim-pack/nvim-spectre",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  -- cmd = "Spectre",
  keys = {
    { "<leader>S", function() require("spectre").open() end, desc = "Open Spectre" },
    { "<leader>sw", function() require("spectre").open_visual({ select_word = true }) end, desc = "Spectre: Search word" },
    { "<leader>sf", function() require("spectre").open_file_search() end, desc = "Spectre: Search in file" },
  },
  opts = function()
    _G.SpectreEnterVsplit = function()
      local e = require("spectre.actions").get_current_entry()
      if not e or not e.filename then return end

      -- busca un split a la derecha; si no existe, créalo
      local cur = vim.api.nvim_get_current_win()
      vim.cmd("wincmd l")
      local right = vim.api.nvim_get_current_win()
      if right == cur then
        vim.cmd("vsplit")
        vim.cmd("wincmd l")
      end

      -- abre/actualiza el archivo en el split derecho
      vim.cmd("edit " .. vim.fn.fnameescape(e.filename))
      vim.api.nvim_win_set_cursor(0, { e.lnum, math.max(e.col - 1, 0) })

      -- vuelve al panel
      vim.api.nvim_set_current_win(cur)
    end

    return {
      open_cmd = "tabnew", --vnew, tabnew, edit, vsplit, split
      live_update = true,
      mapping = {
        enter_file = {
          map = "<CR>",
          cmd = "<cmd>lua _G.SpectreEnterVsplit()<CR>",
          desc = "Open file (vsplit)",
        },
      },
    }
  end,
  config = function(_, opts)
    require("spectre").setup(opts)

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "spectre_panel",
      callback = function()
        vim.keymap.set("n", "q", function()
          vim.cmd("only")   
          vim.cmd("close")
        end, { buffer = true, silent = true })
      end,
    })
  end,
}
