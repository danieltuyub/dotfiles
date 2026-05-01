return {
  "sindrets/diffview.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  cmd = {
    "DiffviewOpen",
    "DiffviewClose",
    "DiffviewToggleFiles",
    "DiffviewFocusFiles",
    "DiffviewFileHistory",
  },

  keys = {
    { "<leader>dv", "<cmd>DiffviewOpen<CR>", desc = "Open Diffview" },
    { "<leader>dc", "<cmd>DiffviewClose<CR>", desc = "Close Diffview" },
    { "<leader>df", "<cmd>DiffviewFileHistory %<CR>", desc = "File history" },
    { "<leader>dh", "<cmd>DiffviewFileHistory<CR>", desc = "Project history" },
  },

  config = function()
    local actions = require("diffview.actions")

    require("diffview").setup({
      enhanced_diff_hl = true, -- highlights tipo VSCode
      view = {
        merge_tool = {
          layout = "diff3_mixed",
        },
        default = {
          layout = "diff2_horizontal", -- estilo VSCode
        },
      },
      file_panel = {
        win_config = {
          width = 35,
        },
      },
      keymaps = {
        view = {
          ["<tab>"]     = actions.select_next_entry,
          ["<s-tab>"]   = actions.select_prev_entry,
          ["gf"]        = actions.goto_file_edit,
          ["q"]         = actions.close,
          ["<Esc>"]     = actions.close,
        },
        file_panel = {
          ["j"]         = actions.next_entry,
          ["k"]         = actions.prev_entry,
          ["<cr>"]      = actions.select_entry,
          ["R"]         = actions.refresh_files,
          ["q"]         = "<Cmd>DiffviewClose<CR>",
          ["<Esc>"]     = "<Cmd>DiffviewClose<CR>",
        },
        file_history_panel = {
          ["q"]         = "<Cmd>DiffviewClose<CR>",
          ["<Esc>"]     = "<Cmd>DiffviewClose<CR>",
        },
      },
    })
  end,
}
