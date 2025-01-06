require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-S-d>"] = require('telescope.actions').delete_buffer
      }
    },
    file_ignore_patterns = {
      "%.lock"
    }
  }
}
