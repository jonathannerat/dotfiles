" Plugins configuration

" vimtex

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=1
let g:vimtex_compiler_progname='nvr'
let g:vimtex_compiler_latexmk = { 'build_dir' : 'build' }
let g:vimtex_quickfix_latexlog = {
\ 'overfull' : 0,
\ 'underfull' : 0,
\ 'packages' : {
\   'default' : 0,
\ },
\}

set conceallevel=1
let g:tex_conceal='abdmg'



" ultisnips
"
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'



" vimwiki
let g:vimwiki_list = [{'path': '~/proj/notes/', 'path_html': '~/proj/notes/_html'}]



" nnn
let g:nnn#set_default_mappings = 0
