local global = require'my.global'
local vim = vim

local options = {
	o = {
		['completeopt +='] = { sep=',', 'menuone', 'noinsert', 'noselect' },
		['shortmess +='] = 'c',
		autoindent = true,
		background = 'dark',
		backup = false,
		copyindent = true,
		encoding = 'utf-8',
		expandtab = false,
		fileformats = 'unix,dos,mac',
		fillchars = 'eob:~',
		history = 100,
		ignorecase = true,
		inccommand='split',
		lazyredraw = true,
		listchars = 'eol:↵,tab:| ,trail:·,extends:…,precedes:…,nbsp:☠',
		preserveindent = true,
		scrolloff = 5,
		shiftwidth = 2,
		showmatch = true,
		showmode = false,
		smartcase = true,
		spelllang = 'en,es',
		splitbelow = true,
		splitright = true,
		swapfile = false,
		tabstop = 2,
		termguicolors = true,
		timeoutlen = 500,
		undofile = true,
		writebackup = false,
	},
	wo = {
		conceallevel = 1,
		cursorline = true,
		linebreak = true,
		list = true,
		number = true,
		relativenumber = true,
		wrap = false,
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

	mapleader = ' ',
	localmapleader = '\\',
	['nnn#set_default_mappings'] = 0,
	['nnn#layout'] = { left = '~20%' },
	['nnn#action'] = {
		['<c-t>'] = 'tab split',
		['<c-x>'] = 'split',
		['<c-v>'] = 'vsplit',
	},
}

for context, group in pairs(options) do
	for key, value in pairs(group) do
		local option, operation = key:match('(%a+)%s*(%g*)')
		local old_value = vim[context][option]
		local new_value

		if not(operation and #operation > 0) then
			new_value = value
		elseif operation == "+=" then
			if type(value) == 'table' then
				local sep = value.sep or ''
				new_value = old_value .. sep ..  table.concat(value, sep)
			else
				new_value = old_value .. value
			end
		end

		vim[context][option] = new_value
	end
end

for key, value in pairs(vim_globals) do
	vim.g[key] = value
end
vim.cmd[[
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
]]
