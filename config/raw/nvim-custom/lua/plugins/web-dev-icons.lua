return {
  "nvim-tree/nvim-web-devicons",
  lazy = true,
  priority = 1000, --load before nvim-tree
  config = function()
    require("nvim-web-devicons").setup({
      default = true,
      strict = true,
    })
  end,
}
