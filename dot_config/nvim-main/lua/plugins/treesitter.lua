return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  branch = "master",
  config = function()
    local function prefer_builtin_queries(lang)
      local query_dir = vim.env.VIMRUNTIME .. "/queries/" .. lang
      for _, path in ipairs(vim.fn.globpath(query_dir, "*.scm", false, true)) do
        local query_name = vim.fn.fnamemodify(path, ":t:r")
        local ok, lines = pcall(vim.fn.readfile, path)
        if ok then
          vim.treesitter.query.set(lang, query_name, table.concat(lines, "\n"))
        end
      end
    end

    for _, lang in ipairs({ "lua", "vim", "markdown", "markdown_inline" }) do
      prefer_builtin_queries(lang)
    end

    require("nvim-treesitter.configs").setup({
      -- Lenguajes que quieres tener instalados
      ensure_installed = {
        "javascript", -- Node (JS)
        "typescript",
        "tsx", -- TSX/React, por si acaso
        "go",
        "html",
        "ruby",
        "terraform",
        "hcl", -- Terraform usa también HCL
        "json",
        "yaml",
      },
      sync_install = true, -- Forzar instalación síncrona para evitar archivos corruptos
      auto_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
        disable = { "ruby" },
      },
    })
  end,
}
