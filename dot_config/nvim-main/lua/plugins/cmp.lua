return {
  -- Autocompletado principal
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",

      -- Snippets engine
      "hrsh7th/vim-vsnip",
      "hrsh7th/cmp-vsnip",
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),

          -- Navegar snippets (vsnip)
          ["<Tab>"] = function(fallback)
            if vim.fn == 1 then
              vim.fn.feedkeys(t("<Plug>(vsnip-expand-or-jump)"), "")
            else
              fallback()
            end
          end,
          ["<S-Tab>"] = function(fallback)
            if vim.fn["vsnip#jumpable"](-1) == 1 then
              vim.fn.feedkeys(t("<Plug>(vsnip-jump-prev)"), "")
            else
              fallback()
            end
          end,
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "vsnip" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  }
}

