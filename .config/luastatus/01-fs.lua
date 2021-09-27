paths = {
    ['/']          = { order = 1, label = ' ROOT' },
    ['/home']      = { order = 2, label = ' HOME' },
    ['/srv/media'] = { order = 3, label = ' MEDIA' }
}

keys = function(t)
    local res = {}

    for k, _ in pairs(t) do
        table.insert(res, k)
    end

    return res
end

widget = {
    plugin = 'fs',
    opts = {
        paths = keys(paths),
    },
    cb = function(t)
        local res = {}
        for k, v in pairs(t) do
            res[paths[k].order] = string.format('%s %.0f%%', paths[k].label,
                (1 - v.avail / v.total) * 100)
        end
        return res
    end,
}
