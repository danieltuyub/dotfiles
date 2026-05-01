return {
  "nvim-treesitter/nvim-treesitter-context",
  event = "BufReadPost",
  keys = {
    {
      "<leader>tc",
      function() require("treesitter-context").toggle() end,
      desc = "Toggle Treesitter Context",
    },
  },
  opts = {
    enable = true,
    max_lines = 0,
    trim_scope = "outer",
    mode = "cursor", -- o "topline"
  },
}
