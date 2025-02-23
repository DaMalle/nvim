return {
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      config = function()
        require("ts_context_commentstring").setup({
                enable_autocmd = false,
        })
    end,
    },
    {
      "numToStr/Comment.nvim",
      config = function()
        require("Comment").setup({
                toggler = {
                    line = "<leader>.",  -- Use <leader>/ for single-line comments
                    block = "<leader>,", -- Use <leader>? for block comments
                },
                opleader = {line = "<leader>.", block = "<leader>,"},
                pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
        })
    end,
    },
}

