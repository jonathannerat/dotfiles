" =============
" >> General <<
" =============

" how many lines of history Vim has to remember
set history=500

" reload file when changed from outside
set autoread
au FocusGained,BufEnter * checktime

" for extra keybinds
let mapleader=","

" fast save
nmap <leader>w :w!<cr>

" :W sudo save
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!



" =============
" >> Plugins <<
" =============

call plug#begin('~/.vim/plugged')

Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'lilydjwg/colorizer'
Plug 'asciidoc/vim-asciidoc'
Plug 'mattn/emmet-vim'

call plug#end()



" ============
" >> Vim UI <<
" ============

" 7 lines to the cursor - when moving vertically using j/k
set so=5

" turn on wild menu
set wildmenu

" ignore compiled files and git files
set wildignore=*.o,*~,*.pyc,*.class
set wildignore+=*/.git/*

" always show current position
set ruler

" show line numbers
set number

" height of command bar
set cmdheight=1

" hide bugger when abandoned
set hid

" fix backspace
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" ignore case when searching
set ignorecase

" when searching be smart about cases
set smartcase

" highlight search results
set hlsearch

" incremental search
set incsearch


" performance: don't redraw while executing macros
set lazyredraw

" for regexp
set magic

" show matching brackets when text indicator is over them
set showmatch

" blink interval (in 1/10 seconds)
set mat=2

" no error sounds
set noerrorbells
set novisualbell
set t_vb =
set tm=500



" ====================
" >> Colors & Fonts <<
" ====================

" enable syntax highlighting
syntax enable
set background=dark
colorscheme onedark
highlight Normal guibg=NONE ctermbg=NONE
let g:airline_theme="onedark"
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
set encoding=utf-8

" unix as standard file type
set ffs=unix,dos,mac



" =========================
" >> Files, backups undo <<
" =========================

set nobackup
set nowb
set noswapfile



" ========================
" >> Text, tab & indent <<
" ========================

" use spaces instead of tabs
set expandtab

" be smart with tabs
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" linebreak on 500 chars
set lbr
set tw=500

set ai " auto-indent
set si " smart-indent
set wrap "wrap lines



" =================
" >> Visual mode <<
" =================

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>



" ====================================
" >> Moving, tabs, windows, buffers <<
" ====================================

" disable highlight on <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/



" =================
" >> Status line <<
" =================

" Always show the status line
set laststatus=2



" ===================
" >> Edit Mappings <<
" ===================

" Move a line of text using ALT+[jk] or Command+[jk] on mac
" Using <Esc>_key_ instead of <M-_key_> because of some problem with urxvt:
" Read more [here](https://unix.stackexchange.com/questions/199683/alt-mappings-for-vim-in-urxvt)
nmap <Esc>j mz:m+<cr>`z
nmap <Esc>k mz:m-2<cr>`z
vmap <Esc>j :m'>+<cr>`<my`>mzgv`yo`z
vmap <Esc>k :m'<-2<cr>`>my`<mzgv`yo`z

" toggle colorizer to preview hex colors
nmap <leader>ct <Plug>Colorizer

" fuck ex mode
nnoremap Q <Nop>


" ===================
" >> Helper functions
" ===================
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
