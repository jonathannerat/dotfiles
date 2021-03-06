local m = require'my.util.mapper'
local f = require'my.util.functions'

local lualsp_path = os.getenv('HOME') .. '/.local/src/lua-language-server/'

local M = {}

M.lsp_servers = {
	tsserver = {},
	cssls = {},
	vimls = {},
	ccls = {},
	bashls = {},
	pyls = {},
	rust_analyzer = {},
	solargraph = {},
	sumneko_lua = require'my.lua_lsp',
	jsonls = {
		cmd = { 'json-languageserver', '--stdio' }
	},
	texlab = {},
}

M.lsp_servers.sumneko_lua.cmd = {
	lualsp_path .. 'bin/Linux/lua-language-server',
	'-E',
	lualsp_path .. 'main.lua'
}

M.lsp_signature_config = {
	bind = true,
	doc_lines = 2,
	hint_enable = false,
	handler_opts = {
		border = 'single',
	}
}

M.default_mappings = {
	['n|ns|gD']         = m.cmd('lua vim.lsp.buf.declaration()'),
	['n|ns|gd']         = m.cmd('lua vim.lsp.buf.definition()'),
	['n|ns|K']          = m.cmd('lua vim.lsp.buf.hover()'),
	['n|ns|gi']         = m.cmd('lua vim.lsp.buf.implementation()'),
	['n|ns|<C-k>']      = m.cmd('lua vim.lsp.buf.signature_help()'),
	['n|ns|<leader>wa'] = m.cmd('lua vim.lsp.buf.add_workspace_folder()'),
	['n|ns|<leader>wr'] = m.cmd('lua vim.lsp.buf.remove_workspace_folder()'),
	['n|ns|<leader>wl'] = m.cmd('lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))'),
	['n|ns|<leader>D']  = m.cmd('lua vim.lsp.buf.type_definition()'),
	['n|ns|<leader>rn'] = m.cmd('lua vim.lsp.buf.rename()'),
	['n|ns|<leader>ca'] = m.cmd('lua vim.lsp.buf.code_action()'),
	['n|ns|gr']         = m.cmd('lua vim.lsp.buf.references()'),
	['n|ns|<leader>e']  = m.cmd('lua vim.lsp.diagnostic.show_line_diagnostics()'),
	['n|ns|[d']         = m.cmd('lua vim.lsp.diagnostic.goto_prev()'),
	['n|ns|]d' ]        = m.cmd('lua vim.lsp.diagnostic.goto_next()'),
	['n|ns|<leader>dd'] = m.cmd('lua vim.lsp.diagnostic.set_loclist()'),
}

function M.config()
	local lspconfig = require'lspconfig'
	local on_attach = function(client, bufnr)
		-- share this instance for all buffers
		local mappings = M.default_mappings

		if client.resolved_capabilities.document_formatting then
			-- create a copy for a specific buffer if it has more capabilities
			mappings = f.shallowcopy(M.default_mappings)
			mappings['n|ns|<leader>f'] = m.cmd('lua vim.lsp.buf.formatting()')
		end

		if client.resolved_capabilities.document_range_formatting then
			-- only create one copy
			mappings = mappings == M.default_mappings and f.shallowcopy(M.default_mappings) or mappings
			mappings['v|ns|<leader>f'] = m.cmd('lua vim.lsp.buf.range_formatting()')
		end

		m.bind(mappings, bufnr)

		require'lsp_signature'.on_attach(M.lsp_signature_config)
	end

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	capabilities.textDocument.completion.completionItem.resolveSupport = {
		properties = {
			'documentation',
			'detail',
			'additionalTextEdits',
		}
	}

	for lsp, config in pairs(M.lsp_servers) do
		if not config.on_attach    then config.on_attach    = on_attach end
		if not config.capabilities then config.capabilities = capabilities end

		lspconfig[lsp].setup(config)
	end
end

return M
