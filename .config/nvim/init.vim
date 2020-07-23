" =============
" >> PLUGINS <<
" =============

call plug#begin(stdpath('data').'/plugged')

" fancy and light status line
Plug 'itchyny/lightline.vim'
Plug 'jonathannerat/lightline-trailing-whitespace'
" base16 themes for lightline
Plug 'mike-hearn/base16-vim-lightline'
" redredesigned mksession
Plug 'tpope/vim-obsession'
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
Plug 'mbbill/undotree'
" file prompt using nnn
Plug 'mcchrish/nnn.vim'
" per projet configuration
Plug 'editorconfig/editorconfig-vim'
" personal wiki for vim
Plug 'vimwiki/vimwiki'
" comments
Plug 'tpope/vim-commentary'
" quoting/parenthesizinv made simple
Plug 'tpope/vim-surround'
" A code completition engine for Vim
Plug 'ycm-core/YouCompleteMe'
" python ide
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
" Auto close parentheses and repeat by dot dot dot...
Plug 'cohama/lexima.vim'
call plug#end()

" Plugins configuration
exe 'source' stdpath('config').'/plugins.vim'
"
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
" open splits below if horizontal, or right if vertical
set splitbelow splitright
" show line number
set number
" any other line besides curren as a relative number
set relativenumber
" lines between cursor and top-bottom borders
set scrolloff=5
" highlight current line
set cursorline

" while searching:
set ignorecase
set smartcase  " override ignorecase if uppercase chars present
" show matching bracket
set showmatch

" don't redraw while performing macros
set lazyredraw

" 10000 default is too much
set history=100

" window splitting rules
set splitbelow
set splitright



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
set undofile
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
nnoremap <leader>r :e %<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>
nnoremap <leader>c :exe 'edit' stdpath('config').'/init.vim'<CR>
nnoremap <leader>s :so %<CR>
nnoremap <leader>n <Plug>VimwikiIndex 0<CR>
nnoremap <leader>e :NnnPicker<CR>
nnoremap <leader>f :Files<CR>


inoremap jj <Esc>
inoremap kk <Esc>:


autocmd FileType tex,latex,mail,markdown,vimwiki set textwidth=78
  \ | set spell
  \ | set spelllang=es,en
