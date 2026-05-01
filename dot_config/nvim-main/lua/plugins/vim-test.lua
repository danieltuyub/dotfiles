return {
  "vim-test/vim-test",
  -- Carga el plugin solo cuando uses los comandos o las teclas
  cmd = { "TestNearest", "TestFile", "TestSuite", "TestLast", "TestVisit" },

  keys = {
    { "<leader>tn", "<cmd>TestNearest<cr>", desc = "Test: Nearest" },
    { "<leader>tf", "<cmd>TestFile<cr>",    desc = "Test: File" },
    { "<leader>tl", "<cmd>TestLast<cr>",    desc = "Test: Last" },
    { "<leader>ts", "<cmd>TestSuite<cr>",   desc = "Test: Suite" },
  },
  config = function()
    vim.g["test#echo_command"] = 1 
    vim.g["test#preserve_screen"] = 0
    vim.g["test#strategy"] = "kitty" -- or toggleterm, neovim
  end,
}
