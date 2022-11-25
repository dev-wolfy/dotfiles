local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require 'wolfy.lsp.lsp-installer'
require('wolfy.lsp.handlers').setup()
require 'wolfy.lsp.null-ls'
