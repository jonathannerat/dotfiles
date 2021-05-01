-- colors in buffer
require'colorizer'.setup(nil, { css=true })

local lspconfig = require'lspconfig'
local on_attach = function(client, bufnr)
	local opts = { noremap=true, silent=true }
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	-- Mappings
	buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
	buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
	buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
	buf_set_keymap('n', '<leader>dd', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

	if client.resolved_capabilities.document_formatting then
		buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	end

	if client.resolved_capabilities.document_range_formatting then
		buf_set_keymap("v", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
	end
end

local servers = {
	tsserver = {},
	cssls = {},
	vimls = {},
	ccls = {},
	bashls = {},
	pyls = {},
	rust_analyzer = {},
	solargraph = {},
	sumneko_lua = {
		cmd = {
			"/home/jonathan/.local/src/lua-language-server/bin/Linux/lua-language-server",
			"-E",
			"/home/jonathan/.local/src/lua-language-server/main.lua"
		}
	},
	jsonls = {
		cmd = { 'json-languageserver', '--stdio' }
	},
	efm = {
		cmd = {
			"efm-langserver",
			"-c",
			"/home/jonathan/.config/efm-langserver/config.yaml",
		},
		init_options = { documentFormatting = true },
	},
	texlab = {},
}

for lsp, config in pairs(servers) do
	if not config.on_attach then config.on_attach = on_attach end
	lspconfig[lsp].setup(config)
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		signs = true,
		virtual_text = false,
	}
)

require'nvim-treesitter.configs'.setup {
	ensure_installed = "maintained",
	-- Modules
	highlight = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
	}
}

require'telescope'.setup{
	defaults = {
		file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
		grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
	}
}

require'compe'.setup {
	enabled = true,
	autocomplete = true,
	source = {
		path = true,
		buffer = true,
		calc = true,
		nvim_lsp = true,
		nvim_lua = true,
		ultisnips = true,
	}
}

require'lualine'.setup {
	options = {
		theme = 'tokyonight'
	}
}
