local awful = require("awful")
local wibox = require("wibox")

local widgets = require("widgets")


local function bar(s)
	local mybar = awful.wibar({
		screen = s,
		position = "top",
		type = "dock"
	})

	-- Add widgets to the wibox
	mybar:setup({
		{
			-- Left widgets
			layout = wibox.layout.fixed.horizontal,
			tasklist_disable_icon = true,
			widgets.taglist(s),  -- unique per each screen
			widgets.prompt(s),  -- unique per each scren
		},
		nil, -- Middle widget
		{
			-- Right widgets
			layout = wibox.layout.fixed.horizontal,
			widgets.keyboard_layout(),
			widgets.clock(),
			widgets.layoutbox(s), -- unique per each screen
		},
		layout = wibox.layout.align.horizontal,
	})

	return mybar
end

return { bar = bar }