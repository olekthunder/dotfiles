local gears = require("gears")
local awful = require("awful")

local keynames = require("keynames")


return gears.table.join(
    awful.button(
        {},
        1,
        function(c)
            client.focus = c
            c:raise()
        end
    ),
    awful.button({keynames.modkey}, 1, awful.mouse.client.move),
    awful.button({keynames.modkey}, 3, awful.mouse.client.resize)
)