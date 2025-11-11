-- Bootstrap de lazy.nvim
-- Cargar init.vim si existe
local cfg = vim.fn.stdpath('config') .. '/init.vim'
if vim.fn.filereadable(cfg) == 1 then
vim.cmd('source ' .. cfg)
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

-- Carga opciones y plugins
require("options")
require("lazy").setup(require("plugins"))

-- Ajustes por sistema operativo
local sys = vim.loop.os_uname().sysname
if sys == "Darwin" then
    vim.opt.shell = "/bin/zsh"
elseif sys == "Linux" then
    if vim.fn.has("wsl") == 1 then
        vim.opt.shell = "/usr/bin/bash"
    else
        vim.opt.shell = "/bin/zsh"
    end
end

-------------------------------------------------------------
-- 🪟 Navegación, pestañas y buffers
-------------------------------------------------------------

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Limpiar mappings no deseados
vim.keymap.del({ "n", "v", "i", "t" }, "<space>", { silent = true })
pcall(vim.keymap.del, "n", "<C-space>")
pcall(vim.keymap.del, "n", "<leader>n")
pcall(vim.keymap.del, "n", "<leader>m")
pcall(vim.keymap.del, "n", "<leader>pp")

-- Navegación por listas
map("n", "<C-n>", ":lnext<CR>", opts)
map("n", "<C-m>", ":lprevious<CR>", opts)

-- Cerrar ventana actual
map("n", "<leader>c", ":close<CR>", opts)

-- Insertar espacio rápido
map("n", "oo", "o<Esc>", opts)
map("n", "<space><space>", "i <Esc>", opts)

-- Movimiento en insert mode
map("i", "<C-f>", "<Right>", opts)
map("i", "<C-l>", "<Right>", opts)
map("i", "<C-b>", "<Left>", opts)
map("i", "<C-j>", "<Down>", opts)
map("i", "<C-k>", "<Up>", opts)
map("i", "<C-a>", "<Home>", opts)
map("i", "<C-e>", "<End>", opts)
map("i", "<C-d>", "<Delete>", opts)
map("i", "jk", "<Esc>", opts)

-- Pestañas
for i = 1, 9 do
  map("n", "<leader>" .. i, ":tabn" .. i .. "<CR>", opts)
end

-- Terminal
map("t", "<Esc>", [[<C-\><C-n>]], opts)
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    if vim.bo.buftype == "terminal" then
      vim.cmd("startinsert")
    end
  end,
})

-- Abrir terminal abajo
function _G.OpenTerminal()
  vim.cmd("botright split term://zsh")
  vim.cmd("resize 10")
end
map("n", "<C-n>", ":lua OpenTerminal()<CR>", opts)

-- Mover entre paneles desde terminal
map("t", "<C-h>", [[<C-\><C-n><C-w>h]], opts)
map("t", "<C-j>", [[<C-\><C-n><C-w>j]], opts)
map("t", "<C-k>", [[<C-\><C-n><C-w>k]], opts)
map("t", "<A-l>", [[<C-\><C-n><C-w>l]], opts)

-------------------------------------------------------------
-- 📋 Portapapeles
-------------------------------------------------------------
map("n", "<leader>a", "ggvG", opts)
map("v", "<Leader>y", '"+y', opts)
map("v", "<Leader>d", '"+d', opts)
map("n", "<Leader>p", '"+p', opts)
map("n", "<Leader>P", '"+P', opts)
map("v", "<Leader>p", '"+p', opts)
map("v", "<Leader>P", '"+P', opts)

-------------------------------------------------------------
-- 🧪 Go / Vlang
-------------------------------------------------------------
vim.g.gotests_bin = "/Users/venjiang/gopath/bin/gotests"
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.v", "*.vh" },
  command = "setfiletype vlang",
})

-------------------------------------------------------------
-- 🔍 Telescope mappings
-------------------------------------------------------------
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)

-------------------------------------------------------------
-- 🪄 Reordenar líneas fácilmente
-------------------------------------------------------------
map("n", "<C-j>", ":m .+1<CR>==", opts)
map("n", "<C-k>", ":m .-2<CR>==", opts)
map("i", "<C-j>", "<Esc>:m .+1<CR>==gi", opts)
map("i", "<C-k>", "<Esc>:m .-2<CR>==gi", opts)
map("v", "<C-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<C-k>", ":m '<-2<CR>gv=gv", opts)

-------------------------------------------------------------
-- ⏎ Personalización de Enter
-------------------------------------------------------------
map("n", "<CR>", ":noh<CR><CR>", opts)
map("n", "<Enter>", "o<ESC>", opts)
map("n", "<S-Enter>", "O<ESC>", opts)
vim.opt.whichwrap:append("<,>,[,")

-------------------------------------------------------------
-- 🗂️ Folding y COC
-------------------------------------------------------------
vim.opt.foldmethod = "indent"
vim.opt.foldlevelstart = 1
map("i", "<CR>", 'v:lua.MaybeConfirm()', { expr = true, silent = true })
