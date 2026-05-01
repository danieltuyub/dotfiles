
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  enabled = true,
  config = function()
    -- ===============================
    -- 1. Definir configuración común
    -- ===============================
    local util = require("lspconfig.util")
    local on_attach = function(_, bufnr)
      local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
      end

      map("n", "gd", vim.lsp.buf.definition, "Go to definition")
      map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
      map("n", "gr", vim.lsp.buf.references, "References")
      map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")

      map("n", "K", vim.lsp.buf.hover, "Hover")
      map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
      map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")

      map("n", "[d", vim.diagnostic.goto_prev, "Prev diagnostic")
      map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")

      map("n", "<leader>fm", function()
        vim.lsp.buf.format({ async = true })
      end, "Format buffer")
    end

    -- ===============================
    -- 2. Definir capabilities
    -- ===============================
    -- local capabilities = vim.lsp.protocol.make_client_capabilities()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- ===============================
    -- 3. REGISTRAR ruby-lsp con la API NUEVA
    -- ===============================
    vim.lsp.config["ruby_lsp"] = {
      cmd = { "ruby-lsp" },
      on_attach = on_attach,
      capabilities = capabilities,
      root_dir = util.root_pattern("Gemfile", ".git", ".ruby-version")(vim.fn.expand("%:p")),
      init_options = {
        formatter = "auto",
        -- linters = { "rubocop_internal" },
      },
    } 

    -- ===============================
    -- 4. ACTIVAR ruby-lsp automáticamente
    -- ===============================
    vim.lsp.enable("ruby_lsp")

        -- ===============================
    -- 5. REGISTRAR gopls con la API NUEVA
    -- ===============================
    vim.lsp.config["gopls"] = {
      cmd = { "gopls" },
      on_attach = on_attach,
      capabilities = capabilities,
      root_dir = util.root_pattern("go.mod", ".git")(vim.fn.expand("%:p")),
    }

    -- ===============================
    -- 6. ACTIVAR gopls automáticamente
    -- ===============================
    vim.lsp.enable("gopls")
  end,
}

