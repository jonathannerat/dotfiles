local m = require'my.util.mapper'

local M = {}

local mappings = {
	['c|n|<c-j>']       = m.raw('<down>'),
	['c|n|<c-k>']       = m.raw('<up>'),

	["i|n|jj"]          = m.raw('<esc>'),
	["i|n|kk"]          = m.raw('<esc>'),
	["i|en|<c-e>"]      = m.cmd([[compe#close('<c-e>')]]),
	["i|en|<c-space>"]  = m.cmd([[compe#complete()]]),
	["i|en|<cr>"]       = m.cmd([[compe#confirm( lexima#expand('<lt>cr>', 'i') )]]),
	["i|en|<s-tab>"]    = m.raw([[pumvisible() ? '<c-p>' : '<s-tab>']]),
	["i|en|<tab>"]      = m.raw([[pumvisible() ? '<c-n>' : '<tab>']]),
	["i|ns|<m-j>"]      = m.raw([[<esc>:m .+1<CR>==gi]]),
	["i|ns|<m-k>"]      = m.raw([[<esc>:m .-2<CR>==gi]]),

	["n|ns|<c-t>"]      = m.cmd('tabnew'),
	["n|ns|<m-j>"]      = m.raw(':m .+1<CR>=='),
	["n|ns|<m-k>"]      = m.raw(':m .-2<CR>=='),
	["n|ns|<leader>N"]  = m.cmd([[call nnn#pick('',{'layout':{'window':{'width': 0.9, 'height': 0.6}}})]]),
	["n|ns|<leader>Q"]  = m.cmd('q!'),
	["n|ns|<leader>Qa"] = m.cmd('qa!'),
	["n|ns|<leader>S"]  = m.cmd('Startify'),
	["n|ns|<leader>cd"] = m.cmd('lcd %:h'),
	["n|ns|<leader>cg"] = m.cmd('Gcd'),
	["n|ns|<leader>ci"] = m.cmd([[exe 'e ' .. stdpath('config') .. '/init.vim']]),
	["n|ns|<leader>co"] = m.cmd([[exe 'e ' .. stdpath('config') .. '/vim/options.vim']]),
	["n|ns|<leader>cm"] = m.cmd([[exe 'e ' .. stdpath('config') .. '/vim/mappings.vim']]),
	["n|ns|<leader>cM"] = m.cmd([[exe 'e ' .. stdpath('config') .. '/lua/my/mappings.lua']]),
	["n|ns|<leader>cp"] = m.cmd([[exe 'e ' .. stdpath('config') .. '/vim/plugins.vim']]),
	["n|ns|<leader>cP"] = m.cmd([[exe 'e ' .. stdpath('config') .. '/lua/my/plugins.lua']]),
	["n|ns|<leader>fF"] = m.cmd('Telescope find_files find_command=fd,-t,f,-t,l,-HI'),
	["n|ns|<leader>fb"] = m.cmd('Telescope buffers'),
	["n|ns|<leader>ff"] = m.cmd('Telescope find_files find_command=fd,-t,f,-t,l,-H'),
	["n|ns|<leader>fg"] = m.cmd('Telescope git_files'),
	["n|ns|<leader>fh"] = m.cmd('Telescope help_tags'),
	["n|ns|<leader>fs"] = m.cmd('Telescope live_grep'),
	["n|ns|<leader>ft"] = m.cmd('Telescope treesitter'),
	["n|ns|<leader>gf"] = m.cmd('e'),
	["n|ns|<leader>gt"] = m.cmd('tabmove+'),
	["n|ns|<leader>gT"] = m.cmd('tabmove-'),
	["n|ns|<leader>hh"] = m.cmd('noh'),
	["n|ns|<leader>ht"] = m.colon([[/\s\+$]]),
	["n|ns|<leader>lg"] = m.cmd('LazyGit'),
	["n|ns|<leader>lG"] = m.cmd('LazyGitConfig'),
	["n|ns|<leader>mP"] = m.cmd('MarkdownPreviewStop'),
	["n|ns|<leader>mp"] = m.cmd('MarkdownPreview'),
	["n|ns|<leader>n"]  = m.cmd('NnnPicker'),
	["n|ns|<leader>o"]  = m.cmd('Obsession .session.vim'),
	["n|ns|<leader>p"]  = m.cmd('Packer', ''),
	["n|ns|<leader>pc"] = m.cmd('PackerClean'),
	["n|ns|<leader>pi"] = m.cmd('PackerInstall'),
	["n|ns|<leader>ps"] = m.cmd('PackerSync'),
	["n|ns|<leader>pu"] = m.cmd('PackerUpdate'),
	["n|ns|<leader>q"]  = m.cmd('q'),
	["n|ns|<leader>qa"] = m.cmd('qa'),
	["n|ns|<leader>r"]  = m.cmd('e %'),
	["n|ns|<leader>sr"] = m.cmd('SudaRead'),
	["n|ns|<leader>sw"] = m.cmd('SudaWrite'),
	["n|ns|<leader>u"]  = m.cmd('UltiSnipsEdit'),
	["n|ns|<leader>w"]  = m.cmd('w'),
	["n|n|<space>"]     = m.raw(''),
	["n|n|Q"]           = m.raw(''),

	["t|ns|<c-m-q>"]    = m.raw([[<c-\><c-n>]]),

	["v|ns|<m-j>"]      = m.raw([[:m '>+1<cr>gv=gv]]),
	["v|ns|<m-k>"]      = m.raw([[:m '<-2<cr>gv=gv]]),
}

function M.setup()
	m.bind(mappings)
end

return M
