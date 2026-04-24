local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Instalar lazy.nvim automáticamente si no existe
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- Carga plugins desde lua/plugins
    { import = "plugins" },
  },
})
