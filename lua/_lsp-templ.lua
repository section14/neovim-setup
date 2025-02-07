local lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local templ_format = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local filename = vim.api.nvim_buf_get_name(bufnr)
    local cmd = "templ fmt " .. vim.fn.shellescape(filename)

    vim.fn.jobstart(cmd, {
        on_exit = function()
            -- Reload the buffer only if it's still the current buffer
            if vim.api.nvim_get_current_buf() == bufnr then
                vim.cmd('e!')
            end
        end,
    })
end

local on_attach = function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    -- setup format for templ files
    vim.keymap.set("n", "F", templ_format, opts)
end

lsp.templ.setup {
  on_attach = on_attach,
  capabilities = capabilities 
}
