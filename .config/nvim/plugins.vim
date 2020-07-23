" Plugins configuration

" vimtex

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

let g:vimtex_quickfix_latexlog = {
\ 'overfull' : 0,
\ 'underfull' : 0,
\ 'packages' : {
\   'default' : 0,
\ },
\}

let g:vimtex_imaps_leader = '¿'

set conceallevel=1
let g:tex_conceal='abdmg'



" ultisnips
"
let g:UltiSnipsEditSplit = 'context'
let g:UltiSnipsExpandTrigger = '<c-Space>'
let g:UltiSnipsJumpForwardTrigger = '<c-Space>'



" vimwiki
let g:vimwiki_list = [{'path': '~/proj/notes/', 'path_html': '~/proj/notes/_html'}]



" nnn
let g:nnn#set_default_mappings = 0



" lightline
let g:lightline = {}
let lightline#trailing_whitespace#indicator = '•'
let g:lightline.component_expand = { 'trailing': 'lightline#trailing_whitespace#component' }
let g:lightline.component_type = { 'trailing': 'error' }
let g:lightline.active = {
    \ 'left': [ [ 'mode', 'paste' ],
    \           [ 'readonly', 'filename', 'modified' ] ],
    \ 'right': [ [ 'trailing', 'lineinfo' ],
    \            [ 'percent' ],
    \            [ 'fileformat', 'fileencoding', 'filetype' ] ] }
let g:lightline.inactive = {
    \ 'left': [ [ 'filename' ] ],
    \ 'right': [ [ 'lineinfo' ],
    \            [ 'percent' ] ] }
let g:lightline.tabline = {
    \ 'left': [ [ 'tabs' ] ],
    \ 'right': [ [ 'close' ] ] }



" lexima
let g:lexima_map_escape = 'jj'
let b:custom_lexima_rules = [
\ {'char': '$', 'at': '\%#\$', 'leave': 1, 'filetype': ['tex', 'latex']},
\ {'char': '$', 'input_after': '$', 'filetype': ['tex', 'latex']},
\ {'char': '<BS>', 'at': '\$\%#\$', 'delete': 1, 'filetype': ['tex', 'latex']}
\]

for rule in b:custom_lexima_rules
	call lexima#add_rule(rule)
endfor
