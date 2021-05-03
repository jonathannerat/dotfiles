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
	listchars = "eol:↵,tab:| ,trail:·,extends:…,precedes:…,nbsp:☠",
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
	completeopt = 'menuone,noinsert,noselect',
}

for option, value in pairs(vim_options) do
	vim.o[option] = value
end
