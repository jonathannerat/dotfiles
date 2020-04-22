" =============
" >> PLUGINS <<
" =============

call plug#begin(stdpath('data').'/plugged')
3
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'lilydjwg/colorizer'
Plug 'asciidoc/vim-asciidoc'
Plug 'mattn/emmet-vim'
Plug 'mbbill/undotree'
Plug 'chriskempson/base16-vim'
Plug 'mike-hearn/base16-vim-lightline'
Plug 'tpope/vim-fugitive'
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'

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
set expandtab
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

nmap <M-j> mz:m+<CR>`z
nmap <M-k> mz:m-2<CR>`z
vmap <M-j> :m'>+<CR>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<CR>`>my`<mzgv`yo`z

" disable exmode
nnoremap Q <NOP>

map <leader>cd :lcd %:h<CR>


autocmd FileType tex,latex set textwidth=78
autocmd BufWritePost,FileWritePost *.tex,*.latex call CompileLatex()
