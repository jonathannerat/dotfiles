local global = require'my.global'
local vim = vim

local vim_options = {
	termguicolors = true,
	showmode = true,
	splitbelow = true,
	splitright = true,
	number = true,
	relativenumber = true,
	scrolloff = 5,
	cursorline = true,
	conceallevel = 1,

	ignorecase = true,
	smartcase = true,
	inccommand='split',
	showmatch = true,

	lazyredraw = true,
	history = 100,

	spelllang = 'en,es',

	expandtab = false,
	tabstop = 2,
	shiftwidth = 2,
	list = true,
	listchars = 'eol:↵,tab:| ,trail:·,extends:…,precedes:…,nbsp:☠',
	fillchars = 'eob:~',

	autoindent = true,
	copyindent = true,
	preserveindent = true,
	wrap = false,
	linebreak = true,

	undofile = true,
	backup = false,
	writebackup = false,
	swapfile = false,
	encoding = 'utf-8',
	fileformats = 'unix,dos,mac',

	timeoutlen = 500,
	completeopt = {
		add = 'menuone,noinsert,noselect'
	},
}

local vim_globals = {
	UltiSnipsEditSplit = 'context',
	UltiSnipsExpandTrigger = '<c-space>',
	UltiSnipsJumpForwardTrigger = '<c-space>',
	UltiSnipsJumpBackwardTrigger = '<c-b>',

	startify_lists = {
		{ type = 'sessions', header = {' Sessions'} },
		{ type = 'files',    header = {' MRU'} },
		{ type = 'dir',      header = {' MRU ' .. vim.fn.getcwd() } },
	},

	lexima_accept_pum_with_enter = 0,

	['pandoc#formatting#mode'] = 'h',
	['pandoc#formatting#textwidth'] = 100,

	mkdp_open_to_the_world = 1,
	mkdp_echo_preview_url = 1,
	mkdp_port = 8007,

	tokyonight_style = 'night',
	material_style = 'deep ocean',
	gruvbox_contrast_dark = 'hard',

	['nnn#set_default_mappings'] = 0,
	['nnn#layout'] = { left = '~20%' },
	['nnn#action'] = {
		['<c-t>'] = 'tab split',
		['<c-x>'] = 'split',
		['<c-v>'] = 'vsplit',
	},
}

for option, value in pairs(vim_options) do
	if type(value) == 'table' then
		if value.add and type(value.add) == 'string' then
			vim.o[option] = vim.o[option] .. ',' .. value.add
		end
	else
		vim.o[option] = value
	end
end

for key, value in pairs(vim_globals) do
	vim.g[key] = value
end
