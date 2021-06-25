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
let g:lexima_accept_pum_with_enter = 0

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
