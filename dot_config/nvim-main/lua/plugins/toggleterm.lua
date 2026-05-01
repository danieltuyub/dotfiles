return {
  'akinsho/toggleterm.nvim', version = "*", config = true,
  opts = {
    direction = "float",
    start_in_insert = true,
    float_opts = {
      border = "curved",
      title = "center",
      -- winblend = 5,
    },
    close_on_exit = true
  },
  keys = {
    {
      "<leader>tt",
      function() require("toggleterm").toggle() end,
      mode = { "n", "t" },
      desc = "Toggle terminal",
    },
    {
      "<Esc>",
      function() require("toggleterm").toggle() end,
      mode = "t",
      desc = "Back to editor from terminal",
    },
  },
}
