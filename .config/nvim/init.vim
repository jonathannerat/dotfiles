function s:stdsource(relpath)
	exe 'source ' .. stdpath('config') .. '/' .. a:relpath
endfunction

call s:stdsource('setup.lua')

call s:stdsource('vim/options.vim')
call s:stdsource('vim/plugins.vim')
call s:stdsource('vim/mappings.vim')

colorscheme gruvbox-material
