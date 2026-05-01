return {
  "ray-x/go.nvim",
  dependencies = {
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  ft = { "go", "gomod" },
  event = { "CmdlineEnter" },
  build = ':lua require("go.install").update_all_sync()',
  opts = {
    lsp_cfg = true,
    lsp_gofumpt = true,
  },
  config = function(_, opts)
    require("go").setup(opts)

    local format_sync_grp =
    vim.api.nvim_create_augroup("GoFormat", { clear = true })

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
        require("go.format").goimports()
      end,
      group = format_sync_grp,
    })
  end,
}
