local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "marcus.lsp.lsp-installer"
require("marcus.lsp.handlers").setup()
require "marcus.lsp.null-ls"
