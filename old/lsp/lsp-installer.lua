local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

local servers = {
  "clangd",
  "lua_ls",
  "cssls",
  "html",
  "ts_ls",
  "pyright",
  "bashls",
  "jsonls",
  "yamlls",
  "gopls"
}

--lsp_installer.setup(
--    automatic_installation = True,
--)
--
--local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
--if not lspconfig_status_ok then
--  return
--end
--
--local opts = {}
--
--for _, server in pairs(servers) do
--  opts = {
--    on_attach = require("marcus.lsp.handlers").on_attach,
--    capabilities = require("marcus.lsp.handlers").capabilities,
--  }
--
--  if server == "lua_ls" then
--    local sumneko_opts = require "marcus.lsp.settings.sumneko_lua"
--    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
--  end
--
--  if server == "pyright" then
--    local pyright_opts = require "marcus.lsp.settings.pyright"
--    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
--  end
--
--  lspconfig[server].setup(opts)
--end
