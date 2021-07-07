local ls = require'luasnip'
local u = require 'my.util.snippets'
local S = ls.snippet
local f = ls.function_node
local t = ls.text_node
local i = ls.insert_node


return {
	S('begin', {
		t '\\begin{',
		i(1),
		t { '}', '\t' },
		i(0),
		t { '', '\\end{' },
		f(u.copy, 1),
		t '}'


	})
}
