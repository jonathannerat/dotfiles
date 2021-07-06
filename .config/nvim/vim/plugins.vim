packadd packer.nvim

lua require'my.plugins'.setup()

" ╭───────────┐
" │ UltiSnips │
" └───────────┘
let g:UltiSnipsEditSplit = 'context'
let g:UltiSnipsExpandTrigger = '<c-space>'
let g:UltiSnipsJumpForwardTrigger = '<c-space>'
let g:UltiSnipsJumpBackwardTrigger = '<c-b>'

" ╭───────────┐
" │ Startify  │
" └───────────┘
let g:startify_lists = [
	\ { 'type': 'sessions', 'header': [' Sessions'] },
	\ { 'type': 'files',    'header': [' MRU'] },
	\ { 'type': 'dir',      'header': [' MRU ' .. getcwd()] }
\ ]

" ╭───────────┐
" │  Lexima   │
" └───────────┘
" Set default rules in synchronously
let g:lexima_no_default_rules = v:true
call lexima#set_default_rules()
let s:rules = [
\ 	{ 'char': '$',    'input_after': '$',              'filetype': ['tex', 'latex'] },
\ 	{ 'char': '$',    'at': '\\%#\\$',    'leave': 1,  'filetype': ['tex', 'latex'] },
\ 	{ 'char': '<BS>', 'at': '\\$\\%#\\$', 'delete': 1, 'filetype': ['tex', 'latex'] },
\ ]

for rule in s:rules
	call lexima#add_rule(rule)
endfor

" ╭───────────┐
" │  Pandoc   │
" └───────────┘
let g:pandoc#formatting#mode = 'h'
let g:pandoc#formatting#textwidth = 100

" ╭─────────────────────┐
" │ Markdown Previewer  │
" └─────────────────────┘
let g:mkdp_open_to_the_world = 1
let g:mkdp_echo_preview_url = 1
let g:mkdp_port = 8007

" ╭──────────────┐
" │ Colorschemes │
" └──────────────┘
let g:tokyonight_style = 'night'
let g:material_style = 'deep ocean'
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_palette = 'material'

" ╭───────────┐
" │    Nnn    │
" └───────────┘
let g:nnn#set_default_mappings = 0
let g:nnn#layout = { 'left': '~20%' }
let g:nnn#action = {
	\ '<c-t>': 'tab split',
	\ '<c-x>': 'split',
	\ '<c-v>': 'vsplit',
\ }

" ╭───────────┐
" │ Firenvim  │
" └───────────┘
let g:firenvim_config = { 'localSettings': {} }

let fc = g:firenvim_config['localSettings']
let fc_site_enable = { 'takeover': 'never', 'priority': 1 }

" enable command line
let fc['.*'] = { 'cmdline': 'neovim', 'takeover': 'never' }
