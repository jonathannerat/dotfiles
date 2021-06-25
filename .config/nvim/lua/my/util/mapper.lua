local M = {}

local function build_string(inner, prefix, suffix)
	prefix = prefix or '<cmd>'
	suffix = suffix or '<cr>'
	return ('%s%s%s'):format(prefix, inner, suffix)
end

function M.cmd(command, cr)
	return build_string(command, nil, cr)
end

function M.colon(command, cr)
	return build_string(command, ':', cr)
end

function M.raw(command)
	return build_string(command, '', '')
end

function M.bind(mappings)
	for key, rhs in pairs(mappings) do
		local mode, optchars, keymap = string.match(key, "([cinvt])|([ensw]*)|(.*)")
		local options = M.parse_opt_chars(optchars)

		vim.api.nvim_set_keymap(mode, keymap, rhs, options)
	end
end

function M.parse_opt_chars(optchars)
	local o = {
		expr = false,
		noremap = false,
		silent = false,
		nowait = false
	}

	for i = 1, #optchars do
		local c = optchars:sub(i, i)
		if c == 'e' then
			o.expr = true
		elseif c == 'n' then
			o.noremap = true
		elseif c == 's' then
			o.silent = true
		elseif c == 'w' then
			o.nowait = true
		end
	end

	return o
end

return M
