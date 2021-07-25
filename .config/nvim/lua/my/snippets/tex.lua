local ls = require'luasnip'
local u = require 'my.util.snippets'
local S = ls.snippet
local c = ls.choice_node
local d = ls.dynamic_node
local f = ls.function_node
local s = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node

local tex_snippets = {
	skel = [[\documentclass[a4paper,10pt]{article}

\usepackage[utf8]{inputenc}
\usepackage[spanish]{babel}
\usepackage{graphix}
\usepackage{float}

\author{${1:Jonathan Teran}}
\title{${2:Document Title}}
\date{}

\begin{document}
$0
\end{document}]]
}

local rec_list
rec_list = function()
	return s(nil, {
		c(1, {
			t '',
			s(nil, { t {'', '\t\\item '}, i(1), d(2, rec_list, {}) })
		})
	})
end
local snippets = {
	S('begin', {
		t '\\begin{',
		i(1),
		t { '}', '\t' },
		i(0),
		t { '', '\\end{' },
		f(u.copy, 1),
		t '}'
	}),
	S('list', {
		c(1, {
			s(nil, {
				t { '\\begin{itemize}', '\t\\item ' },
				i(1),
				d(2, rec_list, {}),
				t { '', '\\end{itemize}' }
			}),
			s(nil, {
				t { '\\begin{enumerate}', '\t\\item ' },
				i(1),
				d(2, rec_list, {}),
				t { '', '\\end{enumerate}' }
			})
		})
	})
}

for trigger, snippet_def in pairs(tex_snippets) do
	snippets[#snippets+1] = ls.parser.parse_snippet(trigger, snippet_def)
end

return snippets
