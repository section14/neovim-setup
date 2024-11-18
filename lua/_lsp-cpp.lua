local lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lsp.clangd.setup {
	cmd = { "clangd", "--background-index" },
	filetypes = {"c", "cpp", "h", "hpp"},
  capabilities = capabilities 
}
