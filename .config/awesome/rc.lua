require("awful.autofocus")
local gears = require("gears")
local awful = require("awful")
local naughty = require("naughty")

-- Apply theme before user imports
local beautiful = require("beautiful")
beautiful.init(gears.filesystem.get_configuration_dir() .. "theme.lua")

local keys = require("keys")
local tags = require("tags")
local autostart = require("autostart")
local bar = require("bar")
local rules = require("rules")
local layouts = require("layouts")
local signals = require("signals")


-- Notification icon size
naughty.config.defaults.icon_size = beautiful.notification_icon_size

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(
	function(s)
        -- Wallpaper
        set_wallpaper(s)
		tags.init_tags(s)
		s.bar = bar.bar(s)
    end
)
-- Set keys
root.keys(keys.globalkeys)

-- Set rules
awful.rules.rules = rules.rules
-- Layouts
awful.layout.layouts = {
    layouts.tile,
    layouts.floating,
	layouts.fair,
	layouts.stack,
}
signals.init_signals()
autostart.setup_auto_start()
