local util = require ('lspconfig/util')
local lsp = require('lspconfig')
lsp.gopls.setup{
	cmd = { "gopls" },
	filetypes = {"go", "gomod" },
	root_dir = util.root_pattern("go.mod", ".git"),
}
