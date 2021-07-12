local ls = require'luasnip'
local S = ls.snippet
local c = ls.choice_node
local d = ls.dynamic_node
local i = ls.insert_node
local s = ls.snippet_node
local t = ls.text_node

local function get_repo_from_clipboard()
	local clipboard = vim.fn.getreg("+", 1)
	local content = string.match(clipboard, 'https?://github.com/([%w-_%.]*/[%w-_%.]*)')

	return s(nil, { i(1, content or 'username/repository') })
end

return {
	S('pplug', {
		c(1, {
			s(nil, {
				t "'",
				d(1, get_repo_from_clipboard, {}),
				t "',",
			}),
			s(nil, {
				t { '{', "\t'" },
				d(1, get_repo_from_clipboard, {}),
				t { "'", '},' },
			}),
			s(nil, {
				t "['",
				d(1, get_repo_from_clipboard, {}),
				t "'] = {",
				t { '', '\t' }, i(2),
				t { '', "}," },
			})
		}),
	})
}
