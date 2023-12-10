local lsp = require('lspconfig')

lsp.clangd.setup {
	cmd = { "clangd", "--background-index" },
	filetypes = {"c", "cpp", "h", "hpp"},
}
