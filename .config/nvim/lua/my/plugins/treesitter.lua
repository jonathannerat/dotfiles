local M = {}

M.parsers = {
	norg = {
		install_info = {
			url = 'https://github.com/vhyrro/tree-sitter-norg',
			files = { 'src/parser.c' },
			branch = 'main'
		}
	}
}

M.setup_config = {
	ensure_installed = "maintained",
	highlight = { enable = true, },
	incremental_selection = { enable = true, },
	indent = { enable = true, },
	playground = { enable = true },
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
			}
		}
	}
	}

M.config = function()
	local parser_configs = require'nvim-treesitter.parsers'.get_parser_configs()

	for parser, config in pairs(M.parsers) do
		parser_configs[parser] = config
	end

	require'nvim-treesitter.configs'.setup(M.setup_config)
end

return M
