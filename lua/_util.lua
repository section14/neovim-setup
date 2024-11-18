require('nvim-autopairs').setup({
  -- disable_filetype = { "TelescopePrompt" , "vim" },
  map_cr = true, --  map <CR> on insert mode
})

--[[
require("nvim-autopairs.completion.compe").setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true -- it will auto insert `(` after select function or method item
})
]]--

-- this is diagnostics stuff
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
      prefix = "»",
      spacing = 4,
    },
    signs = false,
    update_in_insert = false,
  }
)
