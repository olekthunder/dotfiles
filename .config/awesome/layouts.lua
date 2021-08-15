local awful = require("awful")


return {
    tile = awful.layout.suit.tile,
    floating = awful.layout.suit.floating,
    fair = awful.layout.suit.fair,
    fullscreen = awful.layout.suit.max.fullscreen,
	maximized = awful.layout.suit.max,
	stack = awful.layout.stack,
}