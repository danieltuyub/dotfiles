local autocmd = vim.api.nvim_create_autocmd

--Abre nvim-tree automáticamente si nvim se abre sobre
--un directorio
autocmd("VimEnter", {
  callback = function()
    local directory = vim.fn.isdirectory(vim.fn.argv(0)) == 1
    if directory then
      vim.cmd("SessionManager load_current_dir_session")
      vim.cmd("NvimTreeOpen")
      vim.cmd("wincmd p") -- change focus to opened file
      --Delay added to wait config complete on init to load i.e. vgit blame
      vim.defer_fn(function()
        if vim.bo.buftype == "" and vim.api.nvim_buf_get_name(0) ~= "" then
          vim.cmd("silent! edit")
        end
      end, 200)
    end
  end,
})

--Colorea de nuevo archivos abiertos en sesiones previas
autocmd("User", {
  pattern = "SessionLoadPost",
  callback = function()
    vim.cmd("silent! bufdo filetype detect")
  end,
})

-- Run gofmt on save

-- local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
-- autocmd("BufWritePre", {
--   pattern = "*.go",
--   callback = function()
--     require('go.format').gofmt()
--   end,
--   group = format_sync_grp,
-- })

-- autocmd("FileType", {
--   pattern = "go",
--   callback = function()
--     vim.opt_local.expandtab = false
--     vim.opt_local.tabstop = 2
--     vim.opt_local.shiftwidth = 2
--     vim.opt_local.softtabstop = 2
--     vim.opt_local.listchars = {
--       tab = "› ",
--     }
--   end,
-- })

