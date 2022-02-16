widget = {
	plugin = "pulse",
	cb = function(t)
		if t.mute then
			return "婢 Mute"
		end
		local percent = math.floor((t.cur / t.norm) * 100 + 0.5)
		local icon = percent > 50 and "墳" or (percent > 25 and "奔" or "奄")
		return string.format("%s %3d%%", icon, percent)
	end,
}
