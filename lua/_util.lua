require('nvim-autopairs').setup({
  -- disable_filetype = { "TelescopePrompt" , "vim" },
  map_cr = true, --  map <CR> on insert mode
})

require('nvim-ts-autotag').setup({
  opts = {
    -- Defaults
    enable_close = true, -- Auto close tags
    enable_rename = true, -- Auto rename pairs of tags
    enable_close_on_slash = false -- Auto close on trailing </
  },

  -- Also override individual filetype configs, these take priority.
  -- Empty by default, useful if one of the "opts" global settings
  -- doesn't work well in a specific filetype
  -- per_filetype = {
    -- ["html"] = {
      -- enable_close = false
    -- }
  -- }
})

local highlight = {
  "CursorColumn",
  "Whitespace",
}

local icons = require("utils.icons")
local hooks = require("ibl.hooks")

hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

require('ibl').setup({
  indent = { char = icons.ui.LineMiddle },
  whitespace = {
    remove_blankline_trail = false,
  },
  scope = { enabled = true, show_exact_scope = true },
})

--[[
require("nvim-autopairs.completion.compe").setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true -- it will auto insert `(` after select function or method item
})
]]--

-- this is diagnostics stuff
--[[
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN] = '',
        },
        linehl = {
            [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
            [vim.diagnostic.severity.WARN] = 'WarningMsg',
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = false,
            [vim.diagnostic.severity.WARN] = false,
        },
    },
})
]]--

--[[
local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
]]--

for _, diag in ipairs({ "Error", "Warn", "Info", "Hint" }) do
    vim.fn.sign_define("DiagnosticSign" .. diag, {
        text = "",
        texthl = "DiagnosticSign" .. diag,
        linehl = "",
        numhl = "DiagnosticSign" .. diag,
    })
end

-- vim.diagnostic.config({
  -- prefix = ">>"
-- })

--[[
vim.diagnostic.config({

  --local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

})
  ]]--

--[[
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
--]]
