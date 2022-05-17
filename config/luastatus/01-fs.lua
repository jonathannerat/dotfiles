local paths = {
    { path = "/", label = " ROOT" },
    { path = "/home", label = " HOME" },
    { path = "/srv/media", label = " MEDIA" },
}

local curpath = 1

local function get_paths(t)
	local res = {}

	for _, v in pairs(t) do
		table.insert(res, v.path)
	end

	return res
end

widget = {
	plugin = "fs",
	opts = {
		paths = get_paths(paths),
		period = 60,
	},
	cb = function(t)
		local info = t[paths[curpath].path]
		local str = string.format("%s %.0f%%", paths[curpath].label, (1 - info.avail / info.total) * 100)

		curpath = (curpath % #paths) + 1

		return str
	end,
}
