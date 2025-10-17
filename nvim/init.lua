-- Check if version is 0.11 or newer
if tonumber(vim.inspect(vim.version().major)) == 0 then
	if tonumber(vim.inspect(vim.version().minor)) < 12 then
		print("not working for nvim >0.12")
		return
	end
end

require("options")
require("keymaps")
require("autocommands")

require("nvim-treesitter").setup({})
require("nvim-treesitter").install({"python", "cpp", "lua", "man"})

local lspconfig = require("lspconfig")
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

-- Example: setup for pyright (Python)
lspconfig.pyright.setup{
  capabilities = capabilities,
}

lspconfig.clangd.setup{
  capabilities = capabilities,
}

vim.lsp.enable({"pyright", "clangd"})

require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    transparent_background = false,
})

vim.cmd.colorscheme "catppuccin"
