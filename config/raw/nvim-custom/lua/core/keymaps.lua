local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<Space>", "<Nop>", opts)
vim.g.mapleader = ","

--Seleccionar todo
map({ "n", "v" }, "<leader>a", "ggVG", { desc = "Select all" })

-- Guardar cambios
map("n", "<leader>s", ":w<CR>", opts)
map("n", "<leader>sa", ":wa<CR>", opts)
map("n", "<leader>qa", ":qa<CR>", opts)

-- Cerrar ventana actual
map("n", "<leader>c", ":close<CR>", opts)

-- Session manager
map("n", "<leader>sl", "<cmd>SessionManager load_last_session<CR>", opts)
map("n", "<leader>ss", "<cmd>SessionManager save_current_session<CR>", opts)
map("n", "<leader>sd", "<cmd>SessionManager delete_session<CR>", opts)
map("n", "<leader>sf", "<cmd>SessionManager load_session<CR>", opts)

-- Enter para borrar highline de resultados de búsqueda
map("n", "<CR>", ":noh<CR>", opts)

-- Reordenar filas fácilmente
map("n", "<C-j>", ":m .+1<CR>==", opts)
map("n", "<C-k>", ":m .-2<CR>==", opts)
map("i", "<C-j>", "<Esc>:m .+1<CR>==gi", opts)
map("i", "<C-k>", "<Esc>:m .-2<CR>==gi", opts)
map("v", "<C-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<C-k>", ":m '<-2<CR>gv=gv", opts)

-- Insertar espacio
map("n", "<space><space>", "i <Esc>", opts)

-- Cambiar ando de split con option+arrow
-- map("n", "<M-Right>", "<C-w>2<", opts)
-- map("n", "<M-Left>", "<C-w>2>", opts)
-- map("n", "<M-Up>", "<C-w>2+", opts)
-- map("n", "<M-Down>", "<C-w>2-", opts)

-- aumentar/disminuir ancho
map("n", "<M-Right>", ":vertical resize +2<CR>", opts)
map("n", "<M-Left>",  ":vertical resize -2<CR>", opts)
-- aumentar/disminuir alto
map("n", "<M-Up>",    ":resize +2<CR>", opts)
map("n", "<M-Down>",  ":resize -2<CR>", opts)

-- Tabs
map("v", "<Tab>", ">gv", { desc = "Indent right and keep selection" })
map("v", "<S-Tab>", "<gv", { desc = "Indent left and keep selection" })

-- map("n", "<Tab>", ">>", { desc = "Indent line" })
-- map("n", "<S-Tab>", "<<", { desc = "Unindent line" })

-- Palabra anterior/siguiente
map("i", "<M-Left>", "<C-o>b", { desc = "Word left (insert mode)" })
map("i", "<M-Right>", "<C-o>w", { desc = "Word right (insert mode)" })
--------------- funciones ------------------

-- Saltar a linea anterior/siguiente en modo inserción
map("i", "<S-CR>", "<C-o>o", { noremap = true })

