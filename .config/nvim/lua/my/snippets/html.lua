local ls = require'luasnip'
local u = require'my.util.snippets'
local S = ls.snippet
local c = ls.choice_node
local d = ls.dynamic_node
local f = ls.function_node
local i = ls.insert_node
local s = ls.snippet_node
local t = ls.text_node

local html_snippets = {
	skel = [[<!DOCTYPE html>
<html>
<head>
	<title>${1:Title}</title>
	<meta charset="utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrint-to-fit=no"/>
</head>
<body>
	${0:}
</body>]]
}

local snippets = {
	S('script', {
		t '<script',
		c (1, {
			s(nil, {
				t ' src="',
				i(1, 'path/to/file.js'),
				t '">',
			}),
			s(nil, {
				t { '>', '\t' },
				i(1, '// code'),
				t { '', '' },
			})
		}),
		i(0),
		t '</script>',
	}),
	S({ trig='<([%w-_:%.]*)', regTrig=true, wordTrig=true }, {
		d(1, function(args, _, last)
			local tag = args[1].captures[1]
			return s(1, {
				t '<', i(1, tag), t { '>', '\t' },
				last,
				t { '', '</' }, f(u.copy, 1), t '>'
			})
		end, {}, i(0))
	})
}

for trigger, snippet_def in ipairs(html_snippets) do
	snippets[#snippets+1] = ls.parser.parse_snippet(trigger, snippet_def)
end

return snippets
