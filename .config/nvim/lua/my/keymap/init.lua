
local bind = require'my.keymap.bind'
local map_cr = bind.map_cr
local map_cmd = bind.map_cmd
local map_args = bind.map_args

local mappings = {
	["i|jj"]         = map_cmd('<esc>'):with_noremap(),
	["i|kk"]         = map_cmd('<esc>'):with_noremap(),

	["i|<tab>"]      = map_cmd([[pumvisible() ? "\<c-n>" : "\<tab>"]]):with_expr():with_noremap(),
	["i|<s-tab>"]    = map_cmd([[pumvisible() ? "\<c-p>" : "\<s-tab>"]]):with_expr():with_noremap(),

	["i|<c-space>"]  = map_cmd([[compe#complete()]]):with_expr():with_noremap(),
	["i|<cr>"]       = map_cmd([[compe#confirm(lexima#expand('<lt>cr>', 'i'))]]):with_expr():with_noremap(),
	["i|<c-e>"]      = map_cmd([[compe#close('<c-e>')]]):with_expr():with_noremap(),

	["c|<c-k>"]      = map_cmd('<up>'):with_noremap(),
	["c|<c-j>"]      = map_cmd('<down>'):with_noremap(),

	["v|<m-k>"]      = map_cmd([[:m'<-2<CR>`>my`<mzgv`yo`z]]):with_noremap(),
	["v|<m-j>"]      = map_cmd([[:m'>+<CR>`<my`>mzgv`yo`z]]):with_noremap(),

	["n|Q"]          = map_cmd(''):with_noremap(),
	["n|<space>"]    = map_cmd(''):with_noremap(),
	["n|<leader>cd"] = map_cr('lcd %:h'):with_noremap(),
	["n|<leader>cg"] = map_cr('Gcd'):with_noremap(),
	["n|<leader>ci"] = map_cr([[exe 'edit' . stdpath('config') . '/init.vim']]):with_noremap(),
	["n|<leader>cp"] = map_cr([[exe 'edit' . stdpath('config') . '/plugins.vim']]):with_noremap(),
	["n|<leader>cl"] = map_cr([[exe 'edit' . stdpath('config') . '/lua/init.lua']]):with_noremap(),
	["n|<leader>fb"] = map_cr('Telescope buffers'):with_noremap(),
	["n|<leader>ff"] = map_cr('Telescope find_files find_command=fd,-t,f,-t,l,-H'):with_noremap(),
	["n|<leader>fh"] = map_cr('Telescope help_tags'):with_noremap(),
	["n|<leader>fg"] = map_cr('Telescope git_files'):with_noremap(),
	["n|<leader>fs"] = map_cr('Telescope live_grep'):with_noremap(),
	["n|<leader>F"]  = map_cr('Files'):with_noremap(),
	["n|<leader>gf"] = map_cr('e'):with_noremap(),
	["n|<leader>hh"] = map_cr('noh'):with_noremap(),
	["n|<leader>ht"] = map_cr([[/\s\+$]]):with_noremap(),
	["n|<leader>mp"] = map_cr('MarkdownPreview'):with_noremap(),
	["n|<leader>mP"] = map_cr('MarkdownPreviewStop'):with_noremap(),
	["n|<leader>n"]  = map_cr('NnnPicker'):with_noremap(),
	["n|<leader>o"]  = map_cr('Obsession .session.vim'):with_noremap(),
	["n|<leader>p"]  = map_cmd('<cmd>Packer'):with_noremap(),
	["n|<leader>pi"] = map_cr('PackerInstall'):with_noremap(),
	["n|<leader>pu"] = map_cr('PackerUpdate'):with_noremap(),
	["n|<leader>ps"] = map_cr('PackerSync'):with_noremap(),
	["n|<leader>pc"] = map_cr('PackerClean'):with_noremap(),
	["n|<leader>q"]  = map_cr('q'):with_noremap(),
	["n|<leader>qa"] = map_cr('qa'):with_noremap(),
	["n|<leader>Q"]  = map_cr('q!'):with_noremap(),
	["n|<leader>Qa"] = map_cr('qa!'):with_noremap(),
	["n|<leader>r"]  = map_cr('e %'):with_noremap(),
	["n|<leader>s"]  = map_cr('so %'):with_noremap(),
	["n|<leader>sr"] = map_cr('call SudaRead_keeppos()'):with_noremap(),
	["n|<leader>sw"] = map_cr('SudaWrite'):with_noremap(),
	["n|<leader>u"]  = map_cr('UltiSnipsEdit'):with_noremap(),
	["n|<leader>w"]  = map_cr('w'):with_noremap(),
	["n|<leader>Wf"] = map_cr('split'):with_noremap(),
	["n|<M-j>"]      = map_cmd('mz:m+<cr>`z'):with_noremap(),
	["n|<M-k>"]      = map_cmd('mz:m-2<cr>`z'):with_noremap(),

	["t|<c-m-q>"]    = map_cmd([[<c-\><c-n>]]):with_noremap(),
};

vim.cmd[[ let mapleader=' ' ]]
vim.cmd[[ let localmapleader='\' ]]

bind.nvim_load_mapping(mappings)
