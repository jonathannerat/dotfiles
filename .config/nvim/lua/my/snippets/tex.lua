local ls = require'luasnip'
local u = require 'my.util.snippets'
local S = ls.snippet
local f = ls.function_node
local t = ls.text_node
local i = ls.insert_node

local parseable_snippets = {
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
\end{document}
]]
}

local snippets = {
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

for trigger, snippet_def in pairs(parseable_snippets) do
	snippets[#snippets+1] = ls.parser.parse_snippet(trigger, snippet_def)
end

return snippets
