" =============
" >> PLUGINS <<
" =============

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

nnoremap <leader>cd :lcd %:h<CR>

" clear highlighting
nnoremap <leader>hh :noh<CR>
" highlight trailing spaces
nnoremap <leader>ht /\s\+$<CR>

nmap <leader>n <Plug>VimwikiIndex 0

nnoremap <leader>ci :exe 'edit' stdpath('config').'/init.vim'<CR>
nnoremap <leader>cp :exe 'edit' stdpath('config').'/plugins.vim'<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>F :Files
nnoremap <leader>gf :e <cfile><cr>
nnoremap <leader>p :Plug
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pc :PlugClean<CR>
nnoremap <leader>pu :PlugUpdate<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>qa :qa<CR>
nnoremap <leader>Q :q!<CR>
nnoremap <leader>Qa :qa!<CR>
nnoremap <leader>r :e %<CR>
nnoremap <leader>s :so %<CR>
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>Wf :split <cfile><cr>
nnoremap <leader>y :YcmCompleter 

inoremap jj <Esc>
inoremap kk <Esc>:

autocmd FileType tex,latex,mail,markdown,vimwiki set textwidth=78
  \ | set spell
  \ | set spelllang=es,en
