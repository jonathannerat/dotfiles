local ls = require'luasnip'

local M = {}

function M.setup()
	ls.config.set_config({
		history = true,
	})

	ls.snippets = {
		html = require'my.snippets.html',
		tex  = require'my.snippets.tex',
		lua  = require'my.snippets.lua',
		norg  = require'my.snippets.norg',
	}
end

return M
