" PLUGINS
" =======

" List of installed plugins
" -------------------------

call plug#begin(stdpath('data').'/plugged')
Plug 'junegunn/vim-plug'
" futuristic theme
Plug 'embark-theme/vim', { 'as': 'embark-theme' }
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
" autocomplete plugin for nvim written in lua
Plug 'hrsh7th/nvim-compe'
" auto close parenthesis / brackets / etc
Plug 'cohama/lexima.vim'
" fuzzy file finder¬
Plug 'junegunn/fzf.vim'
" telescope floating picker
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
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
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
" betterer lua syntax
Plug 'tbastos/vim-lua'
" moonscript support for vim
Plug 'leafo/moonscript-vim'
" markdown preview plugin
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
" toml syntax
Plug 'cespare/vim-toml'
" snippets powered by python
Plug 'SirVer/ultisnips'
" helpers for unix
Plug 'tpope/vim-eunuch'
" pandoc integration and utilities
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
" TOML syntax highlighting
Plug 'cespare/vim-toml'
" write on the browser from nvim
Plug 'raghur/vim-ghost', {'do': ':GhostInstall'}
" vala syntax plugin
Plug 'arrufat/vala.vim'
" read / write files with sudo
Plug 'lambdalisue/suda.vim'
" dark theme
Plug 'folke/tokyonight.nvim'
" material dark/light theme¬
Plug 'marko-cerovac/material.nvim'
" statusline
Plug 'hoob3rt/lualine.nvim'
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
\		'viml': 'vim',
\	}
\}
let g:vimwiki_key_mappings = { 'global': 0, }
let g:vimwiki_list = [default_vimwiki]

" NNN
" Disable default mappings
let g:nnn#set_default_mappings = 0
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }
" [nvim only] floating window
" let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
let g:nnn#action = {
	\ '<c-t>': 'tab split',
	\ '<c-x>': 'split',
	\ '<c-v>': 'vsplit' }

" TABOO
let g:taboo_tab_format = ' %m%N:[%d %f] '
let g:taboo_renamed_tab_format = ' %m%N:[%l] '

" vim-startify
let g:startify_lists = [
\ { 'type': 'sessions',  'header': ['  Sessions']       },
\ { 'type': 'files',     'header': ['  MRU']            },
\ { 'type': 'dir',       'header': ['  MRU '. getcwd()] },
\ ]

" lexima.vim
let g:lexima_accept_pum_with_enter = 0

" pandoc-vim
let g:pandoc#formatting#mode = 'h'
let g:pandoc#formatting#textwidth = 100

" markdown-preview.nvim
let g:mkdp_open_to_the_world = 1
let g:mkdp_echo_preview_url = 1
let g:mkdp_port = 8007

" tokyonight
let g:tokyonight_style = 'night'

" material-nvim
let g:material_style = 'deep ocean'
