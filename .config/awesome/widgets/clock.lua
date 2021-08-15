local wibox = require("wibox")

local theme = require("theme")
local calendar = require("widgets.calendar")
local beautiful = require("beautiful")


local function clock ()
	local myclock = wibox.widget.textclock(" %a %d %b %H:%M ")

	myclock.font = theme.font
	calendar({today_color = beautiful.calendar_active}):attach(myclock)
	return myclock
end

return clock