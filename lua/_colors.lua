-- colorbuddy = require("colorbuddy")
-- colorbuddy.colorscheme("onebuddy")

require('onedark').setup {
  style = 'dark'
}
require('onedark').load()

--[[
require("tokyonight").setup({
  -- use the night style
  style = "night",
  -- disable italic for functions
  styles = {
    functions = {}
  },
  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  on_colors = function(colors)
    -- colors.hint = colors.orange
    -- colors.error = "#ff0000"
  end
})
]]--

--[[
require('material').setup({
  plugins = {
    "nvim-cmp",
    "telescope"
  },

  lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )
})
]]--
