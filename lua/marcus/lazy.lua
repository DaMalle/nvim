local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "nvim-lua/plenary.nvim",
  "numToStr/Comment.nvim",
  "JoosepAlviste/nvim-ts-context-commentstring",
  "christoomey/vim-tmux-navigator",
  "navarasu/onedark.nvim",

  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "saadparwaiz1/cmp_luasnip",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",
  "L3MON4D3/LuaSnip",
  "rafamadriz/friendly-snippets",
  "neovim/nvim-lspconfig",
  "williamboman/nvim-lsp-installer",
  "jose-elias-alvarez/null-ls.nvim",
  "nvim-treesitter/nvim-treesitter",
  "ThePrimeagen/harpoon",
  })
