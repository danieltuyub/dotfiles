return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = {
      char = "▏",     -- símbolo recomendado (evita el bug de que desaparezcan en columnas profundas)
      tab_char = "▏",
      smart_indent_cap = false,
    },
    whitespace = {
      remove_blankline_trail = true,
    },
    scope = {
      enabled = false,
      highlight = { "IblScope" },
      show_start = false,
      show_end = false,
    },
  },
}
