vim.cmd([[
" Config vim-plug
call plug#begin('~/.local/share/nvim/site/autoload')

" Neovim 0.5+ stuff, clean up later
" Plug 'nvim-treesitter/nvim-treesitter', {'tag': '0.9.1', 'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" LSP
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

" auto-complete
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" dependencies
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
" telescope
Plug 'nvim-telescope/telescope.nvim'

" typescript
Plug 'mhartington/formatter.nvim'

"end Neovim 0.5 stuff

" status bar line
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'nvim-lualine/lualine.nvim'

" nvim tree
Plug 'nvim-tree/nvim-tree.lua'

Plug 'scrooloose/nerdtree'
Plug 'gregsexton/matchtag'

" .editorconfig plugin
Plug 'editorconfig/editorconfig-vim'

" indent plugin
Plug 'windwp/nvim-autopairs'

" autotags plugin
Plug 'windwp/nvim-ts-autotag'

" match tags plugin
Plug 'andymass/vim-matchup'

" themes
" Plug 'rakr/vim-one'
" Plug 'tomasiser/vim-code-dark'
" Plug 'joshdick/onedark.vim'
Plug 'folke/tokyonight.nvim'
Plug 'marko-cerovac/material.nvim'
Plug 'tjdevries/colorbuddy.nvim'
Plug 'Th3Whit3Wolf/onebuddy'
Plug 'navarasu/onedark.nvim'

" dev icons
Plug 'nvim-tree/nvim-web-devicons'

" Initialize plugins
call plug#end()

let g:NERDTreeStatusline = -1
]])

-- nvim tree config
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- NERDTree config

-- shortcuts to telescope commands
vim.keymap.set('n', 'ff', [[<cmd>Telescope find_files<CR>]], { noremap = true, silent = true })
vim.keymap.set('n', 'fg', [[<cmd>Telescope live_grep<CR>]], { noremap = true, silent = true })
vim.keymap.set('n', 'fb', [[<cmd>Telescope buffers<CR>]], { noremap = true, silent = true })
vim.keymap.set('n', 'fh', [[<cmd>Telescope help_tags<CR>]], { noremap = true, silent = true })
vim.keymap.set('n', 'fr', [[<cmd>Telescope resume<CR>]], { noremap = true, silent = true })

-- compe config
-- vim.keymap.set('i', '<C-Space>', [[compe#complete()]], { noremap = true, silent = true, expr = true })
-- vim.keymap.set('i', '<C-e>', [[compe#close(\'<C-e>\')]], { noremap = true, silent = true, expr = true })
-- vim.keymap.set('i', '<C-f>', [[compe#scroll(\'delta\': +4)]], { noremap = true, silent = true, expr = true })
-- vim.keymap.set('i', '<C-d>', [[compe#scroll(\'delta\': -4)]], { noremap = true, silent = true, expr = true })

-- format, go-to definition, hover over description / errors
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true, silent = true })
vim.keymap.set('n', 'D', vim.lsp.buf.hover, { noremap = true, silent = true })
vim.keymap.set('n', 'F', [[<cmd>:Format<CR>]], { noremap = true, silent = true })

-- I don't think you need these anymore
-- syntax on
-- filetype indent plugin on

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.api.nvim_create_autocmd('FileType', {
  pattern = {'*.h', '*.c', '*.cpp'},
  callback = function(ev)
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4 
    vim.opt_local.softtabstop = 4
    vim.opt_local.expandtab = true
  end
})

-- add templ language
vim.filetype.add({ extension = {templ = "templ"} })

vim.cmd([[

" shortcuts to show various Telescope screens
" nnoremap <silent>ff <cmd>Telescope find_files<CR>
" nnoremap <silent>fg <cmd>Telescope live_grep<CR>
" nnoremap <silent>fb <cmd>Telescope buffers<CR>
" nnoremap <silent>fh <cmd>Telescope help_tags<CR>
" nnoremap <silent>fr <cmd>Telescope resume<CR>

" compe config
"" let g:lexima_no_default_rules = v:true
"" call lexima#set_default_rules()
" inoremap <silent><expr> <C-Space> compe#complete()
"" inoremap <silent><expr> <CR>      compe#confirm(lexima#expand('<LT>CR>', 'i'))
" inoremap <silent><expr> <C-e>     compe#close('<C-e>')
" inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
" inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> D  <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> F  <cmd>:Format<CR>


" tabs
" set tabstop=4
" set shiftwidth=4
" set softtabstop=4
" set expandtab

" C, C++
" au FileType c,cpp,h set tabstop=4
" au FileType c,cpp,h set shiftwidth=4
" au FileType c,cpp,h set softtabstop=4
" au FileType c,cpp,h set expandtab

" Go
au FileType go set tabstop=4
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set expandtab
au FileType go nnoremap <silent> F <cmd> lua vim.lsp.buf.format {async = true}<CR>

" Templ
au FileType templ nnoremap <silent> F <cmd> lua vim.lsp.buf.format {async = true}<CR>

" Javascript / html / css
au FileType js,javascript,vue,ts,html,css,typescript,typescriptreact set tabstop=4
au FileType js,javascript,vue,ts,html,css,typescript,typescriptreact set shiftwidth=4
au FileType js,javascript,vue,ts,html,css,typescript,typescriptreact set softtabstop=4
au FileType js,javascript,vue,ts,html,css,typescript,typescriptreact set expandtab

" JS abbreviations

" console.log()
au FileType js,javascript,javascriptreact,vue,ts,typescript,typescriptreact
	\ :iabbrev <buffer> ccc console.log("")<Left><Left><C-R>=Eatchar('\s')<CR>

" console.trace()
au FileType js,javascript,javascriptreact,vue,ts,typescript,typescriptreact
	\ :iabbrev <buffer> cct console.trace()<C-R>=Eatchar('\s')<CR>

" useEffect shortcut for react
au FileType js,javascript,javascriptreact,vue,ts,typescript,typescriptreact
	\ :iabbrev <buffer> uuee useEffect(() => {}, [])<Left><Left><C-R>=Eatchar('\s')<CR>

" PHP
au FileType php set tabstop=4
au FileType php set shiftwidth=4
au FileType php set softtabstop=4
au FileType php set expandtab

" Lua
au FileType lua set tabstop=2
au FileType lua set shiftwidth=2
au FileType lua set softtabstop=2
au FileType lua set expandtab

" yaml
au FileType yml,yaml set tabstop=2
au FileType yml,yaml set shiftwidth=2
au FileType yml,yaml set softtabstop=2
au FileType yml,yaml set expandtab

" JSON
au FileType json set tabstop=4
au FileType json set shiftwidth=4
au FileType json set softtabstop=4
au FileType json set expandtab

" misc
set number relativenumber
set nu rnu
set showmatch
set wildmenu

set laststatus=2

" colors
set t_Co=256
set t_ut=
" colorscheme onedark
" let g:airline_theme='deus'

" highlight line
" hi CursorLineNr guifg=#333333
" set cursorline
" set cursorlineopt=number

" my mappings
" nmap <C-P> :FZF<CR>

" fix first one
nmap zj zt 10<C-y>
nmap <F2> :NERDTree<CR>
" nmap <F2> :NvimTreeToggle<CR>

" make nerdree add node menu one line 
" there's a bug where it won't collapse
let g:NERDTreeMinimalMenu=1

" shortcut for jumping 4 spaces up or down
nmap J 4j
nmap K 4k

" show cutoff errors in it's own window
nnoremap <silent> sh <cmd>lua vim.diagnostic.open_float({scope="line"})<CR>

" I forget what this does
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" Functions
func Eatchar(pat)
	let c = nr2char(getchar(0))
	return (c =~ a:pat) ? '' : c
endfunc
]])

-- Order matters (or does it?)
-- vim.g.material_style = "darker"

-- temp fix for treesitter highlighting 
-- require('_treefix')
require('_nvimtree')

require('_util')
-- require('galaxyline/_space')
require('_treesitter')
require('_telescope')
require('_compe-config')
require('_lualine')

-- LSP
require('_lsp-mason') -- must come first!
require('_lsp-golang')
require('_lsp-templ')
require('_lsp-tsserver')
require('_lsp-html-css')
require('_lsp-htmx')
require('_lsp-tailwind')
require('_lsp-cpp')
require('_lsp-php')

-- Look and feel
require('_colors')
require('_dev-icons')

vim.cmd.colorscheme("onedark")

vim.cmd([[

highlight DiagnosticError ctermfg=1 guibg=#403037 guifg=#e06c75
highlight DiagnosticUnderlineError cterm=underline gui=underline guisp=#713f47

highlight MatchWord ctermfg=yellow guifg=#60D5EF guibg=#2A3942 cterm=underline gui=underline
highlight MatchParen ctermfg=yellow guifg=#F5945C guibg=#343032
]])
