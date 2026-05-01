return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MattesGroeger/vim-bookmarks",
    "tom-anders/telescope-vim-bookmarks.nvim",
  },
  cmd = "Telescope",
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>",  desc = "Live grep" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>",    desc = "Buffers" },
    { "<leader>fw", "<cmd>Telescope grep_string<cr>", desc = "Search word under cursor" },
    { "<leader>fm", "<cmd>Telescope vim_bookmarks<cr>", desc = "Search bookmars" },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        mappings = {
          i = {
            ["<C-q>"] = require("telescope.actions").send_to_qflist,
          },
        },
      },
    })

    require("telescope").load_extension("vim_bookmarks")
  end,
}
