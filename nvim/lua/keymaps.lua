-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
keymap("n", "<leader>pv", "<cmd>Ex<Cr>")

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

keymap("n", "<leader>tn", ":tabnext<CR>", opts)  -- Next tab
keymap("n", "<leader>tp", ":tabprevious<CR>", opts)  -- Previous tab
keymap("n", "<leader>tc", ":tabclose<CR>", opts)  -- Close tab
keymap("n", "<leader>to", ":tabnew<CR>", opts)  -- Open new tab

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- show errors
keymap("n", "<leader>e", vim.diagnostic.open_float, opts)

-- show documentation
vim.keymap.set('n', '<leader>d', vim.lsp.buf.hover, opts)
-- Better paste
keymap("v", "p", '"_dP', opts)

-- Insert --

-- Visual --
-- Stay in indent mode
keymap("v", "H", "<gv", opts)
keymap("v", "L", ">gv", opts)

keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- fix J
keymap("n", "J", "mzJ`z", opts)

-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- disable record-mode
keymap("n","q", "<Nop>")
keymap("v","q", "<Nop>")
keymap("n", "Q", "<Nop>")

-- comment
keymap("n", "<leader>.", "gcc", {remap = true }, opts)
