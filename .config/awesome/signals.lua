local awful = require("awful")
local theme = require("theme")
local utils = require("utils")
local gears = require("gears")
local wibox = require("wibox")

local function init_signals()
	-- Signal function to execute when a new client appears.
	client.connect_signal(
		"manage",
		function(c)
			-- Set the windows at the slave,
			-- i.e. put it at the end of others instead of setting it master.
			if not awesome.startup then
				awful.client.setslave(c)
			end

			if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
				-- Prevent clients from being unreachable after screen count changes.
				(awful.placement.no_offscreen + awful.placement.no_overlap)(c)
			end

			-- Configure windows
			-- TODO: move to rules
			if c.fullscreen then
				awful.placement.top_left(c)
			elseif c.floating or c.first_tag.layout.name == "floating" then
				utils.placement.placement_centered(c)
			end
		end
	)

	-- Handle client.floating property change. Also sent when client is created
	client.connect_signal(
		"property::floating",
		function (c)
			if c.floating and not c.fullscreen then
				(awful.placement.no_offscreen + awful.placement.centered)(
					c, { honor_workarea=true, }
				)
			end
		end
	)

	-- Add a titlebar if titlebars_enabled is set to true in the rules.
	client.connect_signal(
		"request::titlebars",
		function(c)
			-- buttons for the titlebar
			local buttons =
				gears.table.join(
				awful.button(
					{},
					1,
					function()
						c:emit_signal("request::activate", "titlebar", {raise = true})
						awful.mouse.client.move(c)
					end
				),
				awful.button(
					{},
					3,
					function()
						c:emit_signal("request::activate", "titlebar", {raise = true})
						awful.mouse.client.resize(c)
					end
				)
			)

			local my_titlebar = awful.titlebar(c, nil)
			my_titlebar:setup {
				{
					-- Left
					awful.titlebar.widget.iconwidget(c),
					buttons = buttons,
					layout = wibox.layout.fixed.horizontal
				},
				{
					-- Middle
					{
						-- Title
						align = "center",
						widget = awful.titlebar.widget.titlewidget(c)
					},
					buttons = buttons,
					layout = wibox.layout.flex.horizontal
				},
				{
					-- Right
					awful.titlebar.widget.maximizedbutton(c),
					awful.titlebar.widget.closebutton(c),
					layout = wibox.layout.fixed.horizontal()
				},
				layout = wibox.layout.align.horizontal
			}
		end
	)
	client.connect_signal(
		"focus",
		function(c)
			c.border_color = theme.border_focus
		end
	)
	client.connect_signal(
		"unfocus",
		function(c)
			c.border_color = theme.border_normal
		end
	)
end

return { init_signals = init_signals }
