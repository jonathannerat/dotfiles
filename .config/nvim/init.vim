" =============
" >> PLUGINS <<
" =============

call plug#begin(stdpath('data').'/plugged')

" fancy and light status line
Plug 'itchyny/lightline.vim'
" base16 themes for lightline
Plug 'mike-hearn/base16-vim-lightline'
" git integration
Plug 'tpope/vim-fugitive'
" show hex colors
Plug 'lilydjwg/colorizer'
" base16 themes for vim
Plug 'chriskempson/base16-vim'
" latex integration
Plug 'lervag/vimtex'
" awesome snippets
Plug 'SirVer/ultisnips'
" self explanatory
Plug 'asciidoc/vim-asciidoc'
Plug 'mattn/emmet-vim'
Plug 'mbbill/undotree'
" file prompt using nnn
Plug 'mcchrish/nnn.vim'
" per projet configuration
Plug 'editorconfig/editorconfig-vim'
" personal wiki for vim
Plug 'vimwiki/vimwiki'
call plug#end()

" Plugins configuration
exe 'source' stdpath('config').'/plugins.vim'
"
exe 'source' stdpath('config').'/functions.vim'

" move settings likely to change regurlarly here (such as colorscheme and the
" like, to keep git history clean)
exe 'source' stdpath('config').'/custom.vim'



" ============
" >> COLORS <<
" ============

syntax enable
set termguicolors


" =============
" >> GENERAL <<
" =============

" hide "-- INSERT --" from status line, use lightline instead
set noshowmode
" show line number
set number
" any other line besides curren as a relative number
set relativenumber
" lines between cursor and top-bottom borders
set scrolloff=5

" while searching: 
set ignorecase
set smartcase  " override ignorecase if uppercase chars present
" show matching bracket
set showmatch

" don't redraw while performing macros
set lazyredraw

" 10000 default is too much
set history=100



" =====================
" >> TAB INDENT WRAP <<
" =====================

" use spaces instead of tab
set noexpandtab
" spaces for autoindent
set shiftwidth=2
" tab = 2 spaces
set tabstop=2
" show whitespace
set list
set listchars=eol:¬,tab:>·,trail:·
" indent
set autoindent
set smartindent
" wrap line
set wrap
" break long lines
set linebreak



" ===========
" >> FILES <<
" ===========

" use git instead
set nobackup
set nowritebackup
set noswapfile

set encoding=utf-8
set fileformats=unix,dos,mac



" =================
" >> KEYBINDINGS <<
" =================

" (ms) time to wait for mapped sequences
set timeoutlen=500

let mapleader=','
let maplocalleader='¿'

nmap <M-j> mz:m+<CR>`z
nmap <M-k> mz:m-2<CR>`z
vmap <M-j> :m'>+<CR>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<CR>`>my`<mzgv`yo`z

" disable exmode
nnoremap Q <NOP>

map <leader>cd :lcd %:h<CR>

" clear highlighting
map <leader>hh :noh<CR>
" highlight trailing spaces
map <leader>ht /\s\+$<CR>
" reload file
map <leader>r :e %<CR>
map <leader>w :w<CR>
map <leader>q :q<CR>
map <leader>Q :q!<CR>
map <leader>cf :exe 'edit' stdpath('config').'/init.vim'<CR>
map <leader>so :so %<CR>
nmap <leader>n <Plug>VimwikiIndex 0<CR>
nmap <leader>e :NnnPicker<CR>
nmap <leader>f :Files<CR>

autocmd FileType tex,latex,mail,markdown set textwidth=78
  \ | set spell
  \ | set spelllang=es,en
