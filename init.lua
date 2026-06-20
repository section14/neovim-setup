--@diagnostic disable: missing-fields

-- INFO: introduction
-- this is a minimal neovim configuration written in lua. this is not meant to
-- be a distribution, but rather a template for you to build upon and/or a
-- reference for how to configure neovim using lua in the latest version.
--
-- TUTOR:
-- if you're completely new to neovim and/or vim, consider going through
-- `:Tutor` inside neovim to get a basic idea of how it works.
--     if you don't know what this means, type the following:
--       - <escape key>
--       - :
--       - Tutor
--       - <enter key>
--
-- LUA:
-- some level of familiarity with lua/programming languages are also expected.
-- if you're new to lua, consider going through the official reference:
--    https://www.lua.org/manual
-- or a more friendly tutorial like:
--    https://learnxinyminutes.com/docs/lua/
-- you can also check out `:h lua-guide` inside neovim for a neovim-specific
-- lua guide.
--
-- DEPENDENCIES:
-- this configuration assumes you have the following tools installed on your
-- system:
--    `git` - for vim builtin package manager. (see `:h vim.pack`)
--    `ripgrep` - for fuzzy finding
--    clipboard tool: xclip/xsel/win32yank - for clipboard sharing between OS and neovim (see `h: clipboard-tool`)
--    a nerdfont (ensure the terminal running neovim is using it)
-- run `:checkhealth` inside neovim to see if your system is missing anything.
--
-- MINIMAL:
-- to say that something is 'minimal' you have to define what variable you're
-- minimizing. this configuration minimizes for lines of code and concepts.
-- to some, this configuration may have too many plugins. for example, using
-- mason.nvim to manage lsp servers will be an unnecessary dependency if the
-- user is already familiar with lsps and is comfortable managing them through
-- their OS package manager. but to someone that isn't familiar with lsp servers
-- this approach wouldn't cover everything needed to have the 'minimum' necessary
-- for lsp + completion + fuzzy finding. to some, fuzzy finding is also a bloated
-- dependency.
-- this configuration is only a starting point/reference. it is expected that
-- the user will change the configuration to suit their needs.


-- INFO: options
-- these change the default neovim behaviours using the 'vim.opt' API.
-- see `:h vim.opt` for more details.
-- run `:h '{option_name}'` to see what they do and what values they can take.
-- for example, `:h 'number'` for `vim.opt.number`.

-- set <space> as the leader key
-- must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- enable true color support
vim.opt.termguicolors = true

-- make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- enable mouse mode, can be useful for resizing splits
vim.opt.mouse = "a"

-- sync clipboard between OS and neovim.
--  remove this option if you want your OS clipboard to remain independent.
--  see `:help 'clipboard'`
-- vim.opt.clipboard = "unnamedplus"

-- save undo history
vim.opt.undofile = true

-- keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- sets how neovim will display certain whitespace characters in the editor.
--  see `:help 'list'`
--  and `:help 'listchars'`
--vim.opt.list = true
--vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣", }
--vim.opt.listchars = { tab = "» ", nbsp = "␣", }

-- enable live preview of substitutions
vim.opt.inccommand = "split"

-- show which line your cursor is on
vim.opt.cursorline = true

-- set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true

-- enable break indent
vim.opt.breakindent = true

-- enable line wrapping
vim.opt.wrap = true

-- formatting
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.textwidth = 100

-- My formating --------------------------------
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true, silent = true })
vim.keymap.set("n", "D", vim.lsp.buf.hover, { noremap = true, silent = true })

-- extended up and down moves
vim.keymap.set("n", "J", "4j", { silent = true })
vim.keymap.set("n", "K", "4k", { silent = true })

-- disable auto comment on new line
vim.api.nvim_create_autocmd('FileType', {
  pattern = "*",
  callback = function()
      vim.opt.formatoptions:remove { "c", "r", "o" }
      vim.opt_local.formatoptions:remove { "c", "r", "o" }
  end
})

-- show cutoff errors in it's own window
vim.keymap.set("n", "sh", function() vim.diagnostic.open_float({scope="line"}) end, { noremap = true, silent = true })

-- Go formatting
vim.api.nvim_create_autocmd('FileType', {
  pattern = "go",
  callback = function()
    vim.keymap.set("n", "F", function() vim.lsp.buf.format({ async = true }) end, { noremap = true, silent = true })
  end,
})

-- END My formating ----------------------------

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = " ",
    },
  },
  virtual_text = true, -- show inline diagnostics
})

-- clear search highlights with <Esc>
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- INFO: colorscheme
vim.pack.add({"https://github.com/navarasu/onedark.nvim"}, {confirm = false})
vim.pack.add { { src = "https://github.com/catppuccin/nvim", name = "catppuccin" } }

require('onedark').setup {
  style = 'dark'
}
require('onedark').load()

vim.cmd.colorscheme("onedark")
--vim.cmd.colorscheme("catppuccin-nvim")

-- INFO: plugins
-- we install plugins with neovim's builtin package manager: vim.pack
-- and then enable/configure them by calling their setup functions.
--
-- (see `:h vim.pack` for more details on how it works)
-- you can press `gx` on any of the plugin urls below to open them in your
-- browser and check out their documentation and functionality.
-- alternatively, you can run `:h {plugin-name}` to read their documentation.
--
-- plugins are then loaded and configured with a call to `setup` functions
-- provided by each plugin. this is not a rule of neovim but rather a convention
-- followed by the community.
-- these setup calls take a table as an agument and their expected contents can
-- vary wildly. refer to each plugin's documentation for details.

-- Treesitter --------------------------
vim.pack.add({ {src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main"} }, { confirm = false })

local treesitter = require("nvim-treesitter")

treesitter.install({
  "c",
  "cpp",
  "css",
  "go",
  "lua",
  "tsx",
  "javascript",
  "typescript",
  "vimdoc",
  "vim",
  "json",
  "markdown",
  "html",
  "http",
  "php",
  "regex",
  "markdown_inline",
  "yaml",
  "ini",
  "gomod",
  "gosum",
  "gowork",
  "sql",
})

-- equivalent to :TSUpdate
require("nvim-treesitter.install").update("all")

require("nvim-treesitter.config").setup({
  ensure_installed = {"c", "cpp", "lua", "javascript", "typescript", "tsx", "go", "php", "html", "css", "vim", "vimdoc", "markdown"},
  highlight = { enable = true },
  indent = { enable = true },
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    "c",
    "cpp",
    "css",
    "go",
    "gomod",
    "gosum",
    "html",
    "javascript",
    "javascriptreact",
    "lua",
    "php",
    "sql",
    "typescript",
    "typescriptreact",
    "yaml",
    "yml",
  },
  callback = function() vim.treesitter.start() end,
})

-- INFO: completion engine
vim.pack.add({ 'https://github.com/saghen/blink.lib' }) -- I added this
vim.pack.add({ "https://github.com/saghen/blink.cmp" }, { confirm = false })

require("blink.cmp").setup({
  completion = {
    documentation = {
      auto_show = true,
    },
  },

  -- default blink keymaps
  keymap = {
    ['<CR>'] = { 'accept', 'fallback' },
    ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
    ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

    ['<C-y>'] = { 'select_and_accept', 'fallback' },
    ['<C-e>'] = { 'cancel', 'fallback' },
    ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },

    ['<Tab>'] = { 'snippet_forward', 'fallback' },
    ['<S-Tab>'] = { 'snippet_backward', 'fallback' },

    ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
    ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

    ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
  },

  fuzzy = {
    implementation = "lua",
  },
})

-- INFO: lsp server installation and configuration

-- lsp servers we want to use and their configuration
-- see `:h lspconfig-all` for available servers and their settings
local lsp_servers = {
  lua_ls = {
    -- https://luals.github.io/wiki/settings/ | `:h nvim_get_runtime_file`
    Lua = { workspace = { library = vim.api.nvim_get_runtime_file("lua", true) }, },
  },
  -- clangd = {},
  -- rust_analyzer = {},
  -- gopls = {},
}

vim.pack.add({
  --"https://github.com/neovim/nvim-lspconfig", -- default configs for lsps

  -- NOTE: if you'd rather install the lsps through your OS package manager you
  -- can delete the next three mason-related lines and their setup calls below.
  -- see `:h lsp-quickstart` for more details.
  "https://github.com/mason-org/mason.nvim",                     -- package manager
 -- "https://github.com/mason-org/mason-lspconfig.nvim",           -- lspconfig bridge
  -- "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" -- auto installer
}, { confirm = false })

require("mason").setup()

-- enable LSP's -------------------------------------------------
vim.lsp.enable("clangd")
vim.lsp.enable("gopls")
vim.lsp.enable("vtsls")

-- Formatter (used for js / ts for now) --------------------------
vim.pack.add({"https://github.com/stevearc/conform.nvim"})

require("conform").setup({
  formatters_by_ft = {
    -- Conform will run the first available formatter
    css = { "prettierd", "prettier", stop_after_first = true },
    html = { "prettierd", "prettier", stop_after_first = true },
    javascript = { "prettierd", "prettier", stop_after_first = true },
    typescript = { "prettierd", "prettier", stop_after_first = true },
    javascriptreact = { "prettierd", "prettier", stop_after_first = true },
    typescriptreact = { "prettierd", "prettier", stop_after_first = true },
  },
})

vim.keymap.set("n", "F", function() require("conform").format() end, { noremap = true })

-- INFO: fuzzy finder
vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",        -- library dependency
  "https://github.com/nvim-tree/nvim-web-devicons",  -- icons (nerd font)
  "https://github.com/nvim-telescope/telescope.nvim" -- the fuzzy finder
}, { confirm = false })

require("telescope").setup({})

local pickers = require("telescope.builtin")

-- NEOTree
vim.pack.add({
  {
    src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
    version = vim.version.range('3')
  },
  -- dependencies
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/MunifTanjim/nui.nvim",
  -- optional, but recommended
  "https://github.com/nvim-tree/nvim-web-devicons",
})

vim.keymap.set("n", "<F2>", "<Cmd>Neotree<CR>")

-- Telescope Keybindings --
-- other options available: builtin, grep_string, help_tags, man_pages
vim.keymap.set('n', 'ff', pickers.find_files, { noremap = true, silent = true })
vim.keymap.set('n', 'fg', pickers.live_grep, { noremap = true, silent = true })
vim.keymap.set('n', 'fb', pickers.buffers, { noremap = true, silent = true })
vim.keymap.set('n', 'fh', pickers.help_tags, { noremap = true, silent = true })
vim.keymap.set('n', 'fr', pickers.resume, { noremap = true, silent = true })

-- INFO: keybinding helper
vim.pack.add({ "https://github.com/folke/which-key.nvim" }, { confirm = false })

require("which-key").setup({
  spec = {
    { "<leader>s", group = "[S]earch", icon = { icon = "", color = "green", }, },
  }
})

-- uncomment to enable automatic plugin updates
-- vim.pack.update()
