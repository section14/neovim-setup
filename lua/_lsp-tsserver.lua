local lsp = require('lspconfig')
local fmt = require('formatter')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lsp.ts_ls.setup{
    on_attach = function(client, bufnr)

		-- this does something
		-- client.server_capabilities.documentFormattingProvider = false
    capabilities = capabilities 
    end
}

fmt.setup({
	logging = true,
	filetype = {
		javascript = {
			-- prettierd
			function()
				return {
					exe = "prettierd",
					-- args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
					args = {vim.api.nvim_buf_get_name(0)},
					stdin = true
				}
			end
    },

		javascriptreact = {
			-- prettierd
			function()
				return {
					exe = "prettierd",
					args = {vim.api.nvim_buf_get_name(0)},
					stdin = true
				}
			end
    },

		typescript = {
			-- prettierd
			function()
				return {
					exe = "prettierd",
					args = {vim.api.nvim_buf_get_name(0)},
					stdin = true
				}
			end
    },
		
		typescriptreact = {
			-- prettierd
			function()
				return {
					exe = "prettierd",
					args = {vim.api.nvim_buf_get_name(0)},
					stdin = true
				}
			end
    },

		html = {
			-- prettierd
			function()
				return {
					exe = "prettierd",
					args = {vim.api.nvim_buf_get_name(0)},
					stdin = true
				}
			end
    },
		
		css = {
			-- prettierd
			function()
				return {
					exe = "prettierd",
					args = {vim.api.nvim_buf_get_name(0)},
					stdin = true
				}
			end
    },

		vue = {
			-- prettierd
			function()
				return {
					exe = "prettierd",
					args = {vim.api.nvim_buf_get_name(0)},
					stdin = true
				}
			end
    },

		yaml = {
			-- prettierd
			function()
				return {
					exe = "prettierd",
					args = {vim.api.nvim_buf_get_name(0)},
					stdin = true
				}
			end
    },
	}
})
