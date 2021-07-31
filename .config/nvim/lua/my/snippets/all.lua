local ls = require'luasnip'
local u = require 'my.util.snippets'
local S, c, d, f, w, s, t, i = ls.s, ls.c, ls.d, ls.f, ls.w, ls.sn, ls.t, ls.i

local function pairs(l, r)
	return S(l, {
		c(1, {
			s(nil, { t(l), i(1), t(r) }),
			s(nil, { t(l..' '), i(1), t(' '..r)}),
			s(nil, { t { l, '\t' }, i(1), t { '', r } }),
		})
	})
end

return {
	pairs('(', ')'),
	pairs('{', '}'),
	pairs('[', ']')
}
