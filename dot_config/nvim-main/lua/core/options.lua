local opt = vim.opt

opt.number = true -- muestra los números de línea
opt.relativenumber = false -- no cambian los números de línea
opt.hidden = true
opt.ignorecase = true
opt.smartcase = true
opt.termguicolors = true
opt.expandtab = true
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2
opt.wrap = true
opt.clipboard = "unnamedplus" -- guarda y, yy, x, etc en clipboard de sistema
opt.whichwrap:append("<,>,[,]") -- moverse con left/right entre líneas
opt.signcolumn = "yes"
opt.mouse = a
opt.cursorline = true

-- Folding
opt.foldenable = false
opt.foldmethod = "indent"
opt.foldlevelstart = 1

-- Mejor experiencia en terminales modernos
opt.splitbelow = true
opt.splitright = true
opt.ignorecase = true
opt.smartcase = true
-- vim.g.editorconfig = false

--Tiempo sin tecleo para que se detone el evento CursorHold
opt.updatetime = 500

-- Mostrar símbolos especiales
opt.list = true
opt.listchars = {
  eol = "↴",
  trail = "·",
  tab = "  ",
}

