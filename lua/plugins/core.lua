return {
    {"ThePrimeagen/harpoon"},
    { "nvim-lua/plenary.nvim", lazy = true },
    {
        "rose-pine/nvim",
        name = "rose-pine",
        lazy = false,
        priority = 1000,
        opts = {variant = "main"},

    config = function()
      vim.cmd([[colorscheme rose-pine]])
    end,
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },
}
