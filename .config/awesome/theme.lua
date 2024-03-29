local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local gfs = require("gears.filesystem")

local utils = require("utils")


local dpi = xresources.apply_dpi

local themes_path = gfs.get_themes_dir()
local config_dir = gfs.get_configuration_dir()

local theme = {}

theme.font = "Roboto 9"
theme.taglist_font = "Font Awesome 6 Free"

-- local function opaque(color, opacity)
--     if string.len(color) ~= 7 then
--         return color
--     end
--     return color .. string.format("%x", tostring(math.floor(opacity * 255)))
-- end

local color_scheme = {}
color_scheme.black = "#312C39"
color_scheme.gray = "#D9D7C9"
color_scheme.white = "#FFFFFF"
color_scheme.red = "#FF6633"
color_scheme.blue = "#77BED2"
color_scheme.orange = "#FBA605"

theme.bg_normal = color_scheme.black
theme.bg_focus = color_scheme.black
theme.bg_urgent = color_scheme.black
theme.fg_normal = color_scheme.gray
theme.fg_focus = color_scheme.white
theme.fg_urgent = color_scheme.red
theme.border_normal = color_scheme.black
theme.border_focus = utils.beautiful.lighten_hex_color(
	color_scheme.black, 0.15
)
theme.taglist_bg_focus = color_scheme.black
theme.taglist_fg_focus = color_scheme.orange
theme.tasklist_fg_normal = color_scheme.gray
theme.tasklist_fg_focus = color_scheme.blue
theme.titlebar_bg_normal = color_scheme.black
theme.titlebar_bg_focus = utils.beautiful.lighten_hex_color(
	color_scheme.black, 0.15
)

theme.border_width = dpi(2)
theme.notification_icon_size = 64
theme.titlebar_size = dpi(18)

theme.window_width = 1200
theme.window_height = 800

-- Hotkeys popup
theme.hotkeys_modifiers_fg = color_scheme.blue
-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]

-- Widgets
theme.calendar_active = color_scheme.red

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path .. "default/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width = dpi(100)

-- Define the image to load
theme.wallpaper = config_dir .. "static/awesome-wallpaper.jpg"

-- Layout icons
theme.layout_fairh = themes_path .. "default/layouts/fairhw.png"
theme.layout_fairv = themes_path .. "default/layouts/fairvw.png"
theme.layout_floating = themes_path .. "default/layouts/floatingw.png"
theme.layout_magnifier = themes_path .. "default/layouts/magnifierw.png"
theme.layout_max = themes_path .. "default/layouts/maxw.png"
theme.layout_fullscreen = themes_path .. "default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path .. "default/layouts/tilebottomw.png"
theme.layout_tileleft = themes_path .. "default/layouts/tileleftw.png"
theme.layout_tile = themes_path .. "default/layouts/tilew.png"
theme.layout_tiletop = themes_path .. "default/layouts/tiletopw.png"
theme.layout_spiral = themes_path .. "default/layouts/spiralw.png"
theme.layout_dwindle = themes_path .. "default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path .. "default/layouts/cornernww.png"
theme.layout_cornerne = themes_path .. "default/layouts/cornernew.png"
theme.layout_cornersw = themes_path .. "default/layouts/cornersww.png"
theme.layout_cornerse = themes_path .. "default/layouts/cornersew.png"

theme.titlebar_minimize_button_normal = themes_path.."default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = themes_path.."default/titlebar/minimize_focus.png"

theme.titlebar_close_button_normal = themes_path .. "default/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = themes_path .. "default/titlebar/close_focus.png"

theme.titlebar_floating_button_normal_inactive = themes_path .. "default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = themes_path .. "default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path .. "default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = themes_path .. "default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path .. "default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path .. "default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path .. "default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active = themes_path .. "default/titlebar/maximized_focus_active.png"

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = "Arc"

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
