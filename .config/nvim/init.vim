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

" save taboo tab names
set sessionoptions+=tabpages,globals



" =====================
" >> TAB INDENT WRAP <<
" =====================

" use spaces instead of tab
set noexpandtab
" spaces for autoindent
set shiftwidth=0
" tab = 2 spaces
set tabstop=2
" show whitespace
set list
set listchars=eol:¬,tab:>·,trail:·
" indent
set autoindent
set copyindent
set preserveindent
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

let mapleader=' '
let maplocalleader='¿'

inoremap jj <Esc>
inoremap kk <Esc>:

vnoremap <M-j> :m'>+<CR>`<my`>mzgv`yo`z
vnoremap <M-k> :m'<-2<CR>`>my`<mzgv`yo`z

nmap <leader>n <Plug>VimwikiIndex 0

nnoremap <Space>      <nop>
nnoremap  Q           <nop>
nnoremap <leader>cd   :lcd %:h<cr>
nnoremap <leader>ci   :exe 'edit' stdpath('config').'/init.vim'<cr>
nnoremap <leader>cp   :exe 'edit' stdpath('config').'/plugins.vim'<cr>
nnoremap <leader>f    :Files<cr>
nnoremap <leader>F    :Files
nnoremap <leader>gf   :e <cfile><cr>
nnoremap <leader>h    :Helptags<cr>
nnoremap <leader>hh   :noh<cr>
nnoremap <leader>ht   /\s\+$<cr>
nnoremap <leader>p    :Plug
nnoremap <leader>pi   :PlugInstall<cr>
nnoremap <leader>pc   :PlugClean<cr>
nnoremap <leader>pu   :PlugUpdate<cr>
nnoremap <leader>q    :q<cr>
nnoremap <leader>qa   :qa<cr>
nnoremap <leader>Q    :q!<cr>
nnoremap <leader>Qa   :qa!<cr>
nnoremap <leader>r    :e %<cr>
nnoremap <leader>s    :so %<cr>
nnoremap <leader>to   :TabooOpen 
nnoremap <leader>tr   :TabooRename 
nnoremap <leader>tR   :TabooReset<cr>
nnoremap <leader>u    :UltiSnipsEdit<cr>
nnoremap <leader>U    :UltiSnipsEdit 
nnoremap <leader>w    :w<cr>
nnoremap <leader>Wf   :split <cfile><cr>
nnoremap <leader>y    :YcmCompleter 
nnoremap <leader>yd   :YcmDiags<cr>

nnoremap <M-j>        mz:m+<cr>`z
nnoremap <M-k>        mz:m-2<cr>`z

cnoremap <c-k> <Up>
cnoremap <c-j> <Down>



augroup writing_file_rules
	autocmd!
	autocmd FileType tex,latex,mail,markdown,vimwiki set textwidth=78
		\ | set spell
		\ | set spelllang=es,en
augroup end
