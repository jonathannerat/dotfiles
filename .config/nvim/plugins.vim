" PLUGINS
" =======

" List of installed plugins
" -------------------------

call plug#begin(stdpath('data').'/plugged')
" fancy and light status line
Plug 'itchyny/lightline.vim'
" fork that adds first occurrence line no to status line
Plug '~/proj/lightline-trailing-whitespace'
" base16 themes for lightline
Plug 'mike-hearn/base16-vim-lightline'
" futuristic theme
Plug 'embark-theme/vim'
" redesigned mksession
Plug 'tpope/vim-obsession'
" git integration
Plug 'tpope/vim-fugitive'
" show hex colors
Plug 'norcalli/nvim-colorizer.lua'
" base16 colorschemes for vim
Plug 'chriskempson/base16-vim'
" latex integration
Plug 'lervag/vimtex'
" self explanatory
Plug 'asciidoc/vim-asciidoc'
" per project configuration
Plug 'editorconfig/editorconfig-vim'
" comments
Plug 'tpope/vim-commentary'
" quoting/parenthesizing made simple
Plug 'tpope/vim-surround'
" lua development plugin¬
Plug '~/proj/nlua.nvim'
" nvim lsp starter config¬
Plug 'neovim/nvim-lspconfig'
" async completion framework written in lua¬
Plug 'nvim-lua/completion-nvim'
" wrapper for nvim's lsp diagnostics
Plug 'nvim-lua/diagnostic-nvim'
" auto close parenthesis / brackets / etc
Plug 'cohama/lexima.vim'
" fuzzy file finder¬
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
" neomut config syntax support
Plug 'neomutt/neomutt.vim'
" better support for scss syntax
Plug 'cakebaker/scss-syntax.vim'
" fast file explorer
Plug 'mcchrish/nnn.vim'
" rename tabs
Plug 'gcmt/taboo.vim'
" livescript syntax support
Plug 'gkz/vim-ls'
" a starter page for vim/neovim
Plug 'mhinz/vim-startify'
" treesitter hightlighting¬
Plug 'nvim-treesitter/nvim-treesitter'
" betterer lua syntax
Plug 'tbastos/vim-lua'
call plug#end()



" Plugin Configuration
" --------------------

" VIMTEX
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=1
let g:vimtex_compiler_progname='nvr'
let g:vimtex_compiler_latexmk = {
\ 'build_dir' : 'build',
\ 'background' : 1,
\ 'callback' : 1,
\ 'continuous' : 1,
\ 'executable' : 'latexmk',
\ 'hooks' : [],
\ 'options' : [
\   '-verbose',
\   '-file-line-error',
\   '-synctex=1',
\   '-interaction=nonstopmode',
\ ],
\}
let g:vimtex_imaps_leader = '\'
set conceallevel=1
let g:tex_conceal='abdmg'

" ULTISNIPS
" let g:UltiSnipsEditSplit = 'context'
" let g:UltiSnipsExpandTrigger = '<C-Space>'
" let g:UltiSnipsJumpForwardTrigger = '<C-Space>'
" let g:UltiSnipsJumpBackwardTrigger = '<C-b>'

" VIMWIKI

let default_vimwiki = {
\	'name': 'notes',
\	'path': '~/proj/notes',
\	'path_html': '~/proj/notes/_html',
\	'nested_syntaxes': {
\		'java': 'java',
\		'viml': 'vim',
\	}
\}
let g:vimwiki_key_mappings = { 'global': 0, }
let g:vimwiki_list = [default_vimwiki]

" NNN
" Disable default mappings
let g:nnn#set_default_mappings = 0
let g:nnn#layout = { 'left': '~20%' }
" [nvim only] floating window
" let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
let g:nnn#action = {
	\ '<c-t>': 'tab split',
	\ '<c-x>': 'split',
	\ '<c-v>': 'vsplit' }


" LIGHTLINE
function LightlineObsession()
	return '%{ObsessionStatus(''session:  '', ''session:  '')}'
endfunction

let g:lightline = {}
let lightline#trailing_whitespace#indicator = '•'
let g:lightline.component_expand = {
\ 'trailing': 'lightline#trailing_whitespace#component',
\ 'obsession': 'LightlineObsession' }
let g:lightline.component_type = { 'trailing': 'error', 'obsession': 'warning' }
let g:lightline.active = {
\ 'left': [ [ 'mode', 'paste' ],
\           [ 'readonly', 'filename', 'modified' ] ],
\ 'right': [ [ 'trailing', 'lineinfo' ],
\            [ 'percent' ]]
\ }
let g:lightline.inactive = {
\ 'left': [ [ 'filename' ] ],
\ 'right': [ [ 'lineinfo' ],
\            [ 'percent' ] ] }
let g:lightline.tabline = {
\ 'left': [ [ 'tabs' ] ],
\ 'right': [ [ 'close', 'obsession' ] ] }

" TABOO
let g:taboo_tab_format = ' %m%N:[%d %f] '
let g:taboo_renamed_tab_format = ' %m%N:[%l] '

" diagnostic-nvim
let g:diagnostic_insert_delay = 1
let g:diagnostic_virtual_text_prefix = ' '
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_enable_underline = 0

" vim-startify
let g:startify_lists = [
\ { 'type': 'sessions',  'header': ['  Sessions']       },
\ { 'type': 'files',     'header': ['  MRU']            },
\ { 'type': 'dir',       'header': ['  MRU '. getcwd()] },
\ ]

" completion-nvim
let g:completion_confirm_key = "\<c-y>"
let g:completion_enable_snippet = 'UltiSnips'

" lexima.vim
let g:lexima_accept_pum_with_enter = 0
