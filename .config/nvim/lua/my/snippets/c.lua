local u = require'my.util.snippets'
local ls = require'luasnip'
local S = ls.snippet
local d = ls.dynamic_node
local f = ls.function_node
local i = ls.insert_node
local s = ls.snippet_node
local t = ls.text_node

local function get_defguard()
	local filename = vim.fn.expand('%:t')
	filename = filename:gsub('%.(%w+)$', '_%1')
	filename = filename:upper()

	return s(nil, { i(1), i(2, filename) })
end

local c_snippets = {
	skel = [[#include <stdio.h>

int main(int argc, char** arv) {
	${1:printf("Hello world!\n")}
	return 0;
}]],
}

local snippets = {
	S('pragma', {
		t { '#ifndef ' },
		d (1, get_defguard, {}),
		t { '', '#define ' },
		f (u.copy, 1),
		t { '', '' },
		t { '', '' },
		i(2, '// code'),
		t { '', '', '#endif // ' },
		f (u.copy, 1),
	})
}

for trigger, snippet_def in pairs(c_snippets) do
	snippets[#snippets+1] = ls.parser.parse_snippet(trigger, snippet_def)
end

return snippets
