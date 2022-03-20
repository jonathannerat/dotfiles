months = { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" }
wdays = { "Sun", "Mon", "Tue", "Wen", "Thu", "Fri", "Sat" }
widget = {
	plugin = "timer",
	cb = function()
		local d = os.date "*t"
		return string.format(" %s %s %d -  %d:%02d", wdays[d.wday], months[d.month], d.day, d.hour, d.min)
	end,
}
