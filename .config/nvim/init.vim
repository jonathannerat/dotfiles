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
set inccommand=split
" show matching bracket
set showmatch

" don't redraw while performing macros
set lazyredraw

" 10000 default is too much
set history=100

" save taboo tab names
set sessionoptions+=tabpages,globals

" languages
set spelllang=en,es



" =====================
" >> TAB INDENT WRAP <<
" =====================

" use spaces instead of tab
set noexpandtab
" tab = 2 spaces
set tabstop=2
set shiftwidth=2
" show whitespace
set list
set listchars=eol:↵,tab:\|\ ,trail:·,extends:…,precedes:…,nbsp:☠
set fillchars=eob:~

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

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

let mapleader=' '
let maplocalleader='\'

inoremap jj <Esc>
inoremap kk <Esc>

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

cnoremap <C-k> <Up>
cnoremap <C-j> <Down>

" move highlighted lines up and down
vnoremap <M-j> :m'>+<CR>`<my`>mzgv`yo`z
vnoremap <M-k> :m'<-2<CR>`>my`<mzgv`yo`z

nmap <leader>vm <Plug>VimwikiIndex 0

nnoremap  Q           <nop>
nnoremap <Space>      <nop>
nnoremap <leader>b    <cmd>Buffers<cr>
nnoremap <leader>cd   <cmd>lcd %:h<cr>
nnoremap <leader>cg   <cmd>Gcd<cr>
nnoremap <leader>ci   <cmd>edit ~/.local/src/dotfiles/.config/nvim/init.vim<cr>
nnoremap <leader>cp   <cmd>edit ~/.local/src/dotfiles/.config/nvim/plugins.vim<cr>
nnoremap <leader>dd   <cmd>OpenDiagnostic<cr>
nnoremap <leader>dn   <cmd>NextDiagnosticCycle<cr>
nnoremap <leader>dp   <cmd>PrevDiagnosticCycle<cr>
nnoremap <leader>e    <cmd>NnnPicker<cr>
nnoremap <leader>f    <cmd>Files<cr>
nnoremap <leader>F    :Files<space>
nnoremap <leader>gf   <cmd>e <cfile><cr>
nnoremap <leader>h    <cmd>Helptags<cr>
nnoremap <leader>hh   <cmd>noh<cr>
nnoremap <leader>ht   /\s\+$<cr>
nnoremap <leader>n    <cmd>NERDTreeToggle<cr>
nnoremap <leader>ng   <cmd>NERDTreeVCS<cr>
nnoremap <leader>nc   <cmd>NERDTreeCWD<cr>
nnoremap <leader>o    <cmd>Obsession .session.vim<cr>
nnoremap <leader>p    :Plug
nnoremap <leader>pi   <cmd>PlugInstall<cr>
nnoremap <leader>pc   <cmd>PlugClean<cr>
nnoremap <leader>pu   <cmd>PlugUpdate<cr>
nnoremap <leader>q    <cmd>q<cr>
nnoremap <leader>qa   <cmd>qa<cr>
nnoremap <leader>Q    <cmd>q!<cr>
nnoremap <leader>Qa   <cmd>qa!<cr>
nnoremap <leader>r    <cmd>e %<cr>
nnoremap <leader>s    <cmd>so %<cr>
nnoremap <leader>S    <cmd>Startify<cr>
nnoremap <leader>to   :TabooOpen<space>
nnoremap <leader>tr   :TabooRename<space>
nnoremap <leader>tR   <cmd>TabooReset<cr>
nnoremap <leader>w    <cmd>w<cr>
nnoremap <leader>W    <cmd>w !sudo tee %<cr>
nnoremap <leader>Wf   <cmd>split <cfile><cr>

" move curren line up and down
nnoremap <M-j>        mz:m+<cr>`z
nnoremap <M-k>        mz:m-2<cr>`z

tnoremap <C-M-q> <C-\><C-n>

exe 'luafile' stdpath('config') . '/lua/init.lua'
exe 'luafile' stdpath('config') . '/lua/plugins.lua'

augroup writing_file_rules
	autocmd!
	autocmd FileType tex,latex,mail,markdown,vimwiki set textwidth=78
		\ | set spell
augroup end
