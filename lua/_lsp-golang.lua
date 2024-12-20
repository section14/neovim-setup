local util = require ('lspconfig/util')
local lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lsp.gopls.setup{
	cmd = { "gopls" },
	filetypes = {"go", "gomod", "gowork", "gotmpl" },
	root_dir = util.root_pattern("go.mod", ".git"),
  capabilities = capabilities 
}
