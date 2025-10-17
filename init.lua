vim.opt.backup = false                          -- creates a backup file
vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
vim.opt.cmdheight = 1                           -- more space in the neovim command line for displaying messages
vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.hlsearch = true                         -- highlight all matches on previous search pattern
vim.opt.ignorecase = true                       -- ignore case in search patterns
vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim
vim.opt.pumheight = 10                          -- pop up menu height
vim.opt.showmode = true                         -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 1                         -- always show tabs
vim.opt.smartcase = true                        -- smart case
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false                        -- creates a swapfile
vim.opt.termguicolors = false                   -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true                         -- enable persistent undo
vim.opt.updatetime = 300                        -- faster completion (4000ms default)
vim.opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.shiftwidth = 4                          -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4                             -- insert 2 spaces for a tab
vim.opt.cursorline = true                      -- highlight the current line
vim.opt.number = true                           -- set numbered lines
vim.opt.relativenumber = true
vim.opt.laststatus = 3
vim.opt.showcmd = false
vim.opt.ruler = true
vim.opt.numberwidth = 4                         -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
vim.opt.wrap = false                            -- display lines as one long line
vim.opt.scrolloff = 8                           -- is one of my fav
vim.opt.sidescrolloff = 8
vim.opt.cursorcolumn = false
vim.opt.fillchars.eob=" "
vim.opt.shortmess:append "c"
vim.opt.whichwrap:append("<,>,[,],h,l")
vim.opt.iskeyword:append("-")

vim.pack.add({
    "https://github.com/catppuccin/nvim",
    {src="https://github.com/christoomey/vim-tmux-navigator"},
    {src="https://github.com/windwp/nvim-autopairs"},
    {src="https://github.com/nvim-treesitter/nvim-treesitter"},
    {src="https://github.com/neovim/nvim-lspconfig"},
    {src="https://github.com/hrsh7th/cmp-nvim-lsp"},
    {src="https://github.com/hrsh7th/cmp-buffer"},
    {src="https://github.com/hrsh7th/cmp-path"},
    {src="https://github.com/hrsh7th/cmp-cmdline"},
    {src="https://github.com/hrsh7th/nvim-cmp"},
})


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


----------------------------------------------------

-- Use 'q' to quit from common plugins
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "lir" },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]]
  end,
})


-- Fixes Autocomment
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.cmd "set formatoptions-=cro"
  end,
})

-- Highlight Yanked Text
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
  end,
})


-- remove trailing whitespace
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = {"*"},
    callback = function()
        local save_cursor = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos(".", save_cursor)
    end,
})
require('nvim-autopairs').setup({})
-- require("nvim-treesitter").setup({})
-- require("nvim-treesitter").install({"python", "cpp", "lua", "man"})

-- local lspconfig = require("lspconfig")
local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    window = {},
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
    }, { { name = "buffer" },
    }),
})


-- Optional: cmdline completions
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Enable capabilities for nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_nvim_lsp = require('cmp_nvim_lsp')
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

vim.lsp.enable({"pyright", "clangd"})
vim.lsp.config("*", {capabilities=capabilities})
-- vim.lsp.config("pyright", {capabilities=capabilities})
-- vim.lsp.config("clangd", {capabilities=capabilities})


require("catppuccin").setup({
    flavour = "mocha",
    integrations={cmp=true, treesitter=true},
    transparent_background = false,
})

vim.cmd.colorscheme "catppuccin"
