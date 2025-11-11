# Configuración base compartida
vim.g.mapleader = " "

-- Opciones básicas
local opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.termguicolors = true
opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.mouse = a

-- Mejor experiencia en terminales modernos
opt.splitbelow = true
opt.splitright = true
opt.ignorecase = true
opt.smartcase = true
