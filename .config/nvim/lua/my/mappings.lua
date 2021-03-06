local m = require'my.util.mapper'

local M = {}

local mappings = {
	['c|n|<c-j>']       = m.raw('<down>'),
	['c|n|<c-k>']       = m.raw('<up>'),

	["i|ens|<cr>"]      = m.raw("compe#confirm( lexima#expand('<lt>cr>', 'i') )"),
	["i|es|<c-e>"]      = m.raw("luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<c-e>'"),
	["i|es|<c-space>"]  = m.raw("luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<c-space>'"),
	["i|es|<s-tab>"]    = m.raw("v:lua.require'my.functions'.s_tab_complete()"),
	["i|es|<tab>"]      = m.raw("v:lua.require'my.functions'.tab_complete()"),
	["i|ns|<c-b>"]      = m.cmd("lua require'luasnip'.jump(-1)"),
	["i|ns|<c-f>"]      = m.cmd("lua require'luasnip'.jump(1)"),
	["i|ns|<m-j>"]      = m.raw([[<esc>:m .+1<CR>==gi]]),
	["i|ns|<m-k>"]      = m.raw([[<esc>:m .-2<CR>==gi]]),
	["i|n|jj"]          = m.raw('<esc>'),
	["i|n|kk"]          = m.raw('<esc>'),

	["n|ns|<c-t>"]      = m.cmd('tabnew'),
	["n|ns|<leader>N"]  = m.cmd([[call nnn#pick('',{'layout':{'window':{'width': 0.9, 'height': 0.6}}})]]),
	["n|ns|<leader>Q"]  = m.cmd('q!'),
	["n|ns|<leader>Qa"] = m.cmd('qa!'),
	["n|ns|<leader>S"]  = m.cmd('Startify'),
	["n|ns|<leader>cM"] = m.cmd([[exe 'e ' .. stdpath('config') .. '/lua/my/mappings.lua']]),
	["n|ns|<leader>cP"] = m.cmd([[exe 'e ' .. stdpath('config') .. '/lua/my/plugins.lua']]),
	["n|ns|<leader>ca"] = m.cmd([[exe 'e ' .. stdpath('config') .. '/vim/autocmd.vim']]),
	["n|ns|<leader>cd"] = m.cmd('lcd %:h'),
	["n|ns|<leader>ci"] = m.cmd([[exe 'e ' .. stdpath('config') .. '/init.vim']]),
	["n|ns|<leader>cm"] = m.cmd([[exe 'e ' .. stdpath('config') .. '/vim/mappings.vim']]),
	["n|ns|<leader>co"] = m.cmd([[exe 'e ' .. stdpath('config') .. '/vim/options.vim']]),
	["n|ns|<leader>cp"] = m.cmd([[exe 'e ' .. stdpath('config') .. '/vim/plugins.vim']]),
	["n|ns|<leader>fF"] = m.cmd('Telescope find_files find_command=fd,-t,f,-t,l,-HI'),
	["n|ns|<leader>fb"] = m.cmd('Telescope buffers'),
	["n|ns|<leader>ff"] = m.cmd('Telescope find_files find_command=fd,-t,f,-t,l,-H'),
	["n|ns|<leader>fg"] = m.cmd('Telescope git_files'),
	["n|ns|<leader>fh"] = m.cmd('Telescope help_tags'),
	["n|ns|<leader>fl"] = m.cmd('Telescope live_grep'),
	["n|ns|<leader>fs"] = m.cmd('Telescope find_files search_dirs=[ "' .. vim.fn.stdpath('data') .. '/sessions/" ]'),
	["n|ns|<leader>ft"] = m.cmd('Telescope treesitter'),
	["n|ns|<leader>gT"] = m.cmd('tabmove-'),
	["n|ns|<leader>gt"] = m.cmd('tabmove+'),
	["n|ns|<leader>g"]  = m.cmd('Neogit'),
	["n|ns|<leader>gc"] = m.cmd('Neogit commit'),
	["n|ns|<leader>hh"] = m.cmd('noh'),
	["n|ns|<leader>ht"] = m.colon([[/\s\+$]]),
	["n|ns|<leader>mP"] = m.cmd('MarkdownPreviewStop'),
	["n|ns|<leader>mp"] = m.cmd('MarkdownPreview'),
	["n|ns|<leader>n"]  = m.cmd('NnnPicker'),
	["n|ns|<leader>pc"] = m.cmd('PackerClean'),
	["n|n|<leader>p"]   = m.colon('Packer', ''),
	["n|ns|<leader>pi"] = m.cmd('PackerInstall'),
	["n|ns|<leader>pp"] = m.cmd('PackerCompile profile=true'),
	["n|ns|<leader>ps"] = m.cmd('PackerSync'),
	["n|ns|<leader>pu"] = m.cmd('PackerUpdate'),
	["n|ns|<leader>q"]  = m.cmd('q'),
	["n|ns|<leader>qa"] = m.cmd('qa'),
	["n|ns|<leader>r"]  = m.cmd('e %'),
	["n|ns|<leader>sr"] = m.cmd('SudaRead'),
	["n|ns|<leader>sw"] = m.cmd('SudaWrite'),
	["n|ns|<leader>th"] = m.cmd('TSHighlightCapturesUnderCursor'),
	["n|ns|<leader>tp"] = m.cmd('TSPlaygroundToggle'),
	["n|ns|<leader>u"]  = m.cmd('UltiSnipsEdit'),
	["n|ns|<leader>w"]  = m.cmd('w'),
	["n|ns|<leader>xd"] = m.cmd('TroubleToggle lsp_document_diagnostics'),
	["n|ns|<m-j>"]      = m.raw(':m .+1<CR>=='),
	["n|ns|<m-k>"]      = m.raw(':m .-2<CR>=='),
	["n|ns|gR"]         = m.cmd('TroubleToggle lsp_references'),
	["n|n|<space>"]     = m.raw(''),
	["n|n|Q"]           = m.raw(''),

	["s|es|<c-e>"]      = m.raw("luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<c-e>'"),
	["s|es|<s-tab>"]    = m.raw("v:lua.require'my.functions'.s_tab_complete()"),
	["s|es|<tab>"]      = m.raw("v:lua.require'my.functions'.tab_complete()"),
	["s|ns|<c-b>"]      = m.cmd("lua require'luasnip'.jump(-1)"),
	["s|ns|<c-f>"]      = m.cmd("lua require'luasnip'.jump(1)"),
	["s|ns|<c-space>"]  = m.cmd("lua require'luasnip'.expand_or_jump()"),

	["t|ns|<c-m-q>"]    = m.raw([[<c-\><c-n>]]),

	["v|ns|<m-j>"]      = m.raw([[:m '>+1<cr>gv=gv]]),
	["v|ns|<m-k>"]      = m.raw([[:m '<-2<cr>gv=gv]]),
}

function M.setup()
	m.bind(mappings)
end

return M
