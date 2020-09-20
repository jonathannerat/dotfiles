" PLUGINS
" =======

" List of installed plugins
" -------------------------

call plug#begin(stdpath('data').'/plugged')
" fancy and light status line
Plug 'itchyny/lightline.vim'
" like original but adds first ocurrence line no to ststua line
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
" shows undos in a tree
Plug 'mbbill/undotree'
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
" auto close parenthesis / brackets / etc
Plug 'Townk/vim-autoclose'
" fuzzy finder
Plug 'junegunn/fzf.vim'
" better javascript support (+jsx)
Plug 'pangloss/vim-javascript'
" better typescript support (+tsx)
Plug 'HerringtonDarkholme/yats.vim'
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
let g:vimtex_imaps_leader = '¿'
set conceallevel=1
let g:tex_conceal='abdmg'


" ULTISNIPS
let g:UltiSnipsEditSplit = 'context'
let g:UltiSnipsExpandTrigger = '<C-Space>'
let g:UltiSnipsJumpForwardTrigger = '<C-Space>'
let g:UltiSnipsJumpBackwardTrigger = '<C-b>'

" VIMWIKI

let default_vimwiki = {
\	'name': 'notes',
\	'path': '~/proj/notes',
\	'path_html': '~/proj/notes/_html',
\	'nested_syntaxes': {
\		'java': 'java',
\	}
\}

let g:vimwiki_key_mappings = { 'global': 0, }

let g:vimwiki_list = [default_vimwiki]



" NNN
" Disable default mappings
let g:nnn#set_default_mappings = 0
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
\	'trailing': 'lightline#trailing_whitespace#component',
\	'obsession': 'LightlineObsession' }
let g:lightline.component_type = { 'trailing': 'error', 'obsession': 'warning' }
let g:lightline.active = {
\ 'left': [ [ 'mode', 'paste' ],
\           [ 'readonly', 'filename', 'modified' ] ],
\ 'right': [ [ 'obsession', 'trailing', 'lineinfo' ],
\            [ 'percent' ],
\            [ 'fileformat', 'fileencoding', 'filetype' ] ] }
let g:lightline.inactive = {
\ 'left': [ [ 'filename' ] ],
\ 'right': [ [ 'lineinfo' ],
\            [ 'percent' ] ] }
let g:lightline.tabline = {
\ 'left': [ [ 'tabs' ] ],
\ 'right': [ [ 'close' ] ] }


" YOUCOMPLETEME
let g:ycm_clangd_binary_path = "/usr/bin/clangd"
let g:ycm_always_populate_location_list = 1
let g:ycm_semantic_triggers = {
\ 'css': [ 're!^', 're!^\s+', ': ' ],
\ 'scss': [ 're!^', 're!^\s+', ': ' ],
\}

