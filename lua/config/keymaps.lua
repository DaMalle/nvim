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

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

keymap("n", "<leader>a", function() mark.add_file() end)
keymap("n", "<C-e>", ui.toggle_quick_menu)

--keymap("n", "<C-1>", function() ui.nav_file(1) end)
--keymap("n", "<C-2>", function() ui.nav_file(2) end)
--keymap("n", "<C-3>", function() ui.nav_file(3) end)
--keymap("n", "<C-4>", function() ui.nav_file(4) end)
--keymap("n", "<C-5>", function() ui.nav_file(5) end)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)


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
-- Plugins --

-- NvimTree
-- keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Comment
--keymap("n", "<leader>.", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
--keymap("x", "<leader>.", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')

vim.keymap.set("n", "Q", "<nop>")
