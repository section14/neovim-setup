local lsp = require('lspconfig')
local fmt = require('formatter')

lsp.tsserver.setup{
    on_attach = function(client, bufnr)

		-- thignh
		client.resolved_capabilities.document_formatting = false
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
