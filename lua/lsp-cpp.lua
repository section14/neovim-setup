local lsp = require('lspconfig')

lsp.clangd.setup {
	cmd = { "clangd-12", "--background-index" },
	filetypes = {"c", "cpp", "h", "hpp"},
}
