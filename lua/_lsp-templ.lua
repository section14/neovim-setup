local lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lsp.templ.setup {
  capabilities = capabilities 
}
