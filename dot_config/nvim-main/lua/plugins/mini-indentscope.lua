return {
  "nvim-mini/mini.indentscope",
  event = "VeryLazy",
  opts = {
    symbol = "│",
    options = { try_as_border = true },
  },
  config = function(_, opts)
    local indentscope = require("mini.indentscope")

    opts.draw = opts.draw or {}
    opts.draw.animation = indentscope.gen_animation.linear({
      duration = 120,
      unit = "total",
    })

    indentscope.setup(opts)
  end,
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "NvimTree",
        "lazy",
        "mason",
        "terminal",
      },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
    local function set_indentscope_hl()
      vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { link = "Statement" })
    end

    vim.api.nvim_create_autocmd("ColorScheme", { callback = set_indentscope_hl })
    set_indentscope_hl()
  end,
}
