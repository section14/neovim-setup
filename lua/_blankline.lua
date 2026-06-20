local highlight = {
  "Whitespace",
}

local icons = require("utils.icons")
local hooks = require("ibl.hooks")

hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
vim.api.nvim_set_hl(0, 'CurrentScope', { fg = "#4F5665" })

require('ibl').setup({
  indent = { 
    --highlight = highlight,
    char = icons.ui.LineMiddle 
  },
  whitespace = {
    --highlight = highlight,
    remove_blankline_trail = false,
  },
  scope = { 
    enabled = true, 
    highlight = "CurrentScope",
    show_exact_scope = true, 
    show_start = false, 
    show_end = false,
  },
})

