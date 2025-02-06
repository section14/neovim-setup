local lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp.htmx.setup {
  capabilities = capabilities,
  filetypes = {"html", "templ"}
}
