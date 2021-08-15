local awful = require("awful")
local wibox = require("wibox")


return {
	hotkeys_popup = require("awful.hotkeys_popup").widget,
	keyboard_layout = awful.widget.keyboardlayout,
	clock = require("widgets.clock"),
	prompt = awful.widget.prompt,
	layoutbox = require("widgets.layoutbox"),
	taglist = require("widgets.taglist"),
	systray = wibox.widget.systray,
}