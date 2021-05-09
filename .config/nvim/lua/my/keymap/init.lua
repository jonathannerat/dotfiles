local global = require'my.global'
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

	["v|<m-k>"]      = map_cmd([[:m'<-2<CR>`>my`<mzgv`yo`z]]):with_noremap():with_silent(),
	["v|<m-j>"]      = map_cmd([[:m'>+<CR>`<my`>mzgv`yo`z]]):with_noremap():with_silent(),

	["n|Q"]          = map_cmd(''):with_noremap(),
	["n|<space>"]    = map_cmd(''):with_noremap(),
	["n|<leader>cd"] = map_cr('lcd %:h'):with_noremap():with_silent(),
	["n|<leader>cg"] = map_cr('Gcd'):with_noremap():with_silent(),
	["n|<leader>ci"] = map_cr('edit ' .. global.lua_dir .. '/my/init.lua'):with_noremap():with_silent(),
	["n|<leader>cp"] = map_cr('edit ' .. global.lua_dir .. '/my/plugins.lua'):with_noremap():with_silent(),
	["n|<leader>co"] = map_cr('edit ' .. global.lua_dir .. '/my/options.lua'):with_noremap():with_silent(),
	["n|<leader>ck"] = map_cr('edit ' .. global.lua_dir .. '/my/keymap/init.lua'):with_noremap():with_silent(),
	["n|<leader>fb"] = map_cr('Telescope buffers'):with_noremap():with_silent(),
	["n|<leader>ff"] = map_cr('Telescope find_files find_command=fd,-t,f,-t,l,-H'):with_noremap():with_silent(),
	["n|<leader>fF"] = map_cr('Telescope find_files find_command=fd,-t,f,-t,l,-HI'):with_noremap():with_silent(),
	["n|<leader>fh"] = map_cr('Telescope help_tags'):with_noremap():with_silent(),
	["n|<leader>fg"] = map_cr('Telescope git_files'):with_noremap():with_silent(),
	["n|<leader>fs"] = map_cr('Telescope live_grep'):with_noremap():with_silent(),
	["n|<leader>ft"] = map_cr('Telescope treesitter'):with_noremap():with_silent(),
	["n|<leader>gf"] = map_cr('e'):with_noremap():with_silent(),
	["n|<leader>hh"] = map_cr('noh'):with_noremap():with_silent(),
	["n|<leader>ht"] = map_cr([[/\s\+$]]):with_noremap():with_silent(),
	["n|<leader>mp"] = map_cr('MarkdownPreview'):with_noremap():with_silent(),
	["n|<leader>mP"] = map_cr('MarkdownPreviewStop'):with_noremap():with_silent(),
	["n|<leader>n"]  = map_cr('NnnPicker'):with_noremap():with_silent(),
	["n|<leader>N"]  = map_cr([[call nnn#pick('',{'layout':{'window':{'width': 0.9, 'height': 0.6}}})]]):with_noremap():with_silent(),
	["n|<leader>o"]  = map_cr('Obsession .session.vim'):with_noremap():with_silent(),
	["n|<leader>p"]  = map_cmd('<cmd>Packer'):with_noremap():with_silent(),
	["n|<leader>pi"] = map_cr('PackerInstall'):with_noremap():with_silent(),
	["n|<leader>pu"] = map_cr('PackerUpdate'):with_noremap():with_silent(),
	["n|<leader>ps"] = map_cr('PackerSync'):with_noremap():with_silent(),
	["n|<leader>pc"] = map_cr('PackerClean'):with_noremap():with_silent(),
	["n|<leader>q"]  = map_cr('q'):with_noremap():with_silent(),
	["n|<leader>qa"] = map_cr('qa'):with_noremap():with_silent(),
	["n|<leader>Q"]  = map_cr('q!'):with_noremap():with_silent(),
	["n|<leader>Qa"] = map_cr('qa!'):with_noremap():with_silent(),
	["n|<leader>r"]  = map_cr('e %'):with_noremap():with_silent(),
	["n|<leader>sr"] = map_cr('SudaRead'):with_noremap():with_silent(),
	["n|<leader>sw"] = map_cr('SudaWrite'):with_noremap():with_silent(),
	["n|<leader>S"]  = map_cr('Startify'):with_noremap():with_silent(),
	["n|<leader>u"]  = map_cr('UltiSnipsEdit'):with_noremap():with_silent(),
	["n|<leader>w"]  = map_cr('w'):with_noremap():with_silent(),
	["n|<leader>Wf"] = map_cr('split'):with_noremap():with_silent(),
	["n|<M-j>"]      = map_cmd('mz:m+<cr>`z'):with_noremap():with_silent(),
	["n|<M-k>"]      = map_cmd('mz:m-2<cr>`z'):with_noremap():with_silent(),

	["t|<c-m-q>"]    = map_cmd([[<c-\><c-n>]]):with_noremap():with_silent(),
};

bind.nvim_load_mapping(mappings)
