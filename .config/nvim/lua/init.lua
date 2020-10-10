-- colors in buffer
require'colorizer'.setup(nil, { css=true })

local nvim_lsp = require'nvim_lsp'
local on_attach = function(_, bufnr)
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
	require'diagnostic'.on_attach()
	require'completion'.on_attach()

	-- Mappings.
	local opts = { noremap=true, silent=true }
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>E', '<cmd>lua vim.lsp.util.show_line_diagnostics()<cr>', opts)
end

local servers = {'tsserver', 'cssls', 'vimls', 'sumneko_lua'}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
  }
end

-- -- custom setup for sumneko_lua
-- require'nlua.lsp.nvim'.setup(nvim_lsp, {
-- 	on_attach = on_attach,
-- })

require'nvim-treesitter.configs'.setup {
	-- Modules and its options go here
	highlight = { enable = true },
	textobjects = { enable = true },
	-- incremental_selection = { enable = true },
	-- refactor = {
	-- 	highlight_definitions = { enable = true },
	-- 	smart_rename = { enable = true },
	-- 	navigation = { enable = true },
	-- },
}
