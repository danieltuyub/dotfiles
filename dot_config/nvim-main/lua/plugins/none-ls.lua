return {
  "nvimtools/none-ls.nvim",
  enabled = false,
  config = function()
    local null_ls = require("null-ls") -- 'null_ls' variable name is common
    null_ls.setup({
      sources = {
        -- RuboCop as a diagnostic source (linter)
        null_ls.builtins.diagnostics.rubocop,
        -- RuboCop as a formatting source (autocorrect)
        null_ls.builtins.formatting.rubocop,
      },
    })
  end,
}
