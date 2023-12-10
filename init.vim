" Config vim-plug
call plug#begin('~/.local/share/nvim/site/autoload')

" Neovim 0.5+ stuff, clean up later
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

" dependencies
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
" telescope
Plug 'nvim-telescope/telescope.nvim'

" typescript
Plug 'mhartington/formatter.nvim'

"end Neovim 0.5 stuff

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}

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

" themes
Plug 'rakr/vim-one'
Plug 'tomasiser/vim-code-dark'
Plug 'joshdick/onedark.vim'
Plug 'tjdevries/colorbuddy.vim'
Plug 'Th3Whit3Wolf/onebuddy'

" dev icons
Plug 'nvim-tree/nvim-web-devicons'

" Initialize plugins
call plug#end()

" nvim tree config
lua vim.g.loaded_netrw = 1
lua vim.g.loaded_netrwPlugin = 1

" shortcuts to show various Telescope screens
nnoremap <silent>ff <cmd>Telescope find_files<CR>
nnoremap <silent>fg <cmd>Telescope live_grep<CR>
nnoremap <silent>fb <cmd>Telescope buffers<CR>
nnoremap <silent>fh <cmd>Telescope help_tags<CR>
nnoremap <silent>fr <cmd>Telescope resume<CR>

" compe config
" let g:lexima_no_default_rules = v:true
" call lexima#set_default_rules()
inoremap <silent><expr> <C-Space> compe#complete()
" inoremap <silent><expr> <CR>      compe#confirm(lexima#expand('<LT>CR>', 'i'))
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> D  <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> F  <cmd>:Format<CR>

syntax on

filetype indent plugin on

" tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Go
au FileType go set tabstop=4
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set expandtab
au FileType go nnoremap <silent> F <cmd> lua vim.lsp.buf.format {async = true}<CR>

" Javascript / html / css
au FileType js,javascript,vue,ts,html,css,typescript,typescriptreact set tabstop=4
au FileType js,javascript,vue,ts,html,css,typescript,typescriptreact set shiftwidth=4
au FileType js,javascript,vue,ts,html,css,typescript,typescriptreact set softtabstop=4
au FileType js,javascript,vue,ts,html,css,typescript,typescriptreact set expandtab

" JS abbreviations

" console.log()
au FileType js,javascript,vue,ts,typescript,typescriptreact
	\ :iabbrev <buffer> ccc console.log("")<Left><Left><C-R>=Eatchar('\s')<CR>

" console.trace()
au FileType js,javascript,vue,ts,typescript,typescriptreact
	\ :iabbrev <buffer> cct console.trace()<C-R>=Eatchar('\s')<CR>

" useEffect shortcut for react
au FileType js,javascript,vue,ts,typescript,typescriptreact
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
let g:airline_theme='deus'
highlight DiagnosticError ctermfg=1 guibg=#403037 guifg=#e06c75
highlight DiagnosticUnderlineError cterm=underline gui=underline guisp=#713f47

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

" temp fix for treesitter highlighting 
:luafile ~/.config/nvim/lua/_treefix.lua
:luafile ~/.config/nvim/lua/_nvimtree.lua

" LSP
:luafile ~/.config/nvim/lua/_lsp-golang.lua
:luafile ~/.config/nvim/lua/_lsp-tsserver.lua
:luafile ~/.config/nvim/lua/_lsp-html-css.lua
:luafile ~/.config/nvim/lua/_lsp-vue.lua
:luafile ~/.config/nvim/lua/_lsp-cpp.lua
:luafile ~/.config/nvim/lua/_lsp-php.lua

:luafile ~/.config/nvim/lua/_util.lua
" :luafile ~/.config/nvim/lua/galaxyline/_space.lua
:luafile ~/.config/nvim/lua/_treesitter.lua
:luafile ~/.config/nvim/lua/_telescope.lua
:luafile ~/.config/nvim/lua/_compe-config.lua

" Look and feel
:luafile ~/.config/nvim/lua/_colors.lua
:luafile ~/.config/nvim/lua/_dev-icons.lua

" Functions
func Eatchar(pat)
	let c = nr2char(getchar(0))
	return (c =~ a:pat) ? '' : c
endfunc
