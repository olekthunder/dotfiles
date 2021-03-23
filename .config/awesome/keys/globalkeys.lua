local gears = require("gears")
local awful = require("awful")
local naughty = require("naughty")

local tags = require("tags")
local keynames = require("keynames")
local widgets = require("widgets")
local apps = require("apps")


local globalkeys =
    gears.table.join(
    awful.key(
		{keynames.modkey},
		"h",
		widgets.hotkeys_popup.show_help,
		{description = "Show help", group = "awesome"}
	),
    awful.key(
        {keynames.modkey},
        "j",
        function()
            awful.client.focus.byidx(-1)
        end,
        {description = "Focus client by index (left)", group = "client"}
    ),
    awful.key(
        {keynames.modkey},
        "k",
        function()
            awful.client.focus.byidx(1)
        end,
        {description = "Focus client by index (right)", group = "client"}
    ),
    awful.key(
        {keynames.modkey},
        keynames.right,
        function()
            awful.client.focus.bydirection("right")
        end,
        {description = "Focus client to the right", group = "client"}
    ),
    awful.key(
        {keynames.modkey},
        keynames.left,
        function()
            awful.client.focus.bydirection("left")
        end,
        {description = "Focus client to the left", group = "client"}
    ),
    awful.key(
        {keynames.modkey},
        keynames.up,
        function()
            awful.client.focus.bydirection("up")
        end,
        {description = "Focus client above focused", group = "client"}
    ),
    awful.key(
        {keynames.modkey},
        "Down",
        function()
            awful.client.focus.bydirection("down")
        end,
        {description = "Focus client below focused", group = "client"}
    ),
    -- Layout manipulation
    awful.key(
        {keynames.modkey, keynames.shift},
        keynames.right,
        function()
            awful.client.swap.bydirection("right")
        end,
        {description = "Swap with client right", group = "client"}
    ),
    awful.key(
        {keynames.modkey, keynames.shift},
        keynames.left,
        function()
            awful.client.swap.bydirection("left")
        end,
        {description = "Swap with client left", group = "client"}
    ),
    awful.key(
        {keynames.modkey, keynames.shift},
        keynames.up,
        function()
            awful.client.swap.bydirection("up")
        end,
        {description = "Swap with client up", group = "client"}
    ),
    awful.key(
        {keynames.modkey, keynames.shift},
        keynames.down,
        function()
            awful.client.swap.bydirection("down")
        end,
        {description = "Swap with client down", group = "client"}
    ),
    -- Resizing windows
    awful.key(
        {keynames.modkey, keynames.control},
        keynames.right,
        function()
            awful.tag.incmwfact(0.01)
        end,
        {description = "Increase master width", group = "client"}
    ),
    awful.key(
        {keynames.modkey, keynames.control},
        keynames.left,
        function()
            awful.tag.incmwfact(-0.01)
        end,
        {description = "Decrease master width", group = "client"}
    ),
    awful.key(
        {keynames.modkey, keynames.control},
        keynames.up,
        function()
            awful.client.incwfact(0.01)
        end,
        {description = "Increase client height", group = "client"}
    ),
    awful.key(
        {keynames.modkey, keynames.control},
        keynames.down,
        function()
            awful.client.incwfact(-0.01)
        end,
        {description = "Decrease client height", group = "client"}
    ),
    awful.key(
        {keynames.modkey, keynames.control},
        "0",
        function()
            local t = awful.screen.focused().selected_tag
            t.master_width_factor = 1 / (t.column_count + 1) -- Why +1? Idk
            local clients = t:clients()
            for i, c in ipairs(clients) do
                awful.client.setwfact(1 / awful.client.idx(c).num, c)
            end
        end,
        {description = "Restore original layout", group = "client"}
    ),
    --  Misc
    awful.key(
        {keynames.modkey},
        "Return",
        apps.open_terminal,
        {description = "Open a terminal", group = "launcher"}
    ),
    awful.key(
        {keynames.modkey, keynames.shift},
        "r",
        awesome.restart,
        {description = "Reload awesome", group = "awesome"}
    ),
    awful.key(
        {keynames.control, keynames.shift},
        "q",
        awesome.quit,
        {description = "Quit awesome", group = "awesome"}
    ),
    awful.key(
        {keynames.control, keynames.shift},
        "F4",
        function()
            awful.spawn("shutdown 0")
        end,
        {description = "Shutdown", group = "awesome"}
    ),
    awful.key(
        {keynames.modkey, keynames.control},
        "h",
        function()
            awful.tag.incncol(1, nil, true)
        end,
        {description = "Increase the number of columns", group = "layout"}
    ),
    awful.key(
        {keynames.modkey, keynames.control},
        "l",
        function()
            awful.tag.incncol(-1, nil, true)
        end,
        {description = "Decrease the number of columns", group = "layout"}
    ),
    awful.key(
        {keynames.modkey},
        "Tab",
        function()
            awful.layout.inc(1)
        end,
        {description = "Select next layout", group = "layout"}
    ),
    awful.key(
        {keynames.modkey, keynames.shift},
        "Tab",
        function()
            awful.layout.inc(-1)
        end,
        {description = "Select previous layout", group = "layout"}
    ),
    awful.key(
        {keynames.modkey, keynames.shift},
        "f",
        function()
            c = client.focus
            if c then
                c.floating = not c.floating
            end
        end,
        {description = "Toggle window floating", group = "layout"}
    ),
    awful.key(
        {keynames.modkey, keynames.shift},
        "n",
        function()
            local c = awful.client.restore()
            -- Focus restored client
            if c then
                client.focus = c
                c:raise()
            end
        end,
        {description = "Restore minimized", group = "client"}
    ),
    awful.key(
        {keynames.modkey},
        "d",
        function()
            -- If at least one client is minimized - unminimize
            -- Else minimize all
            local t = awful.screen.focused().selected_tag
            local clients = t:clients()
            local minimize = true
            for _, c in ipairs(clients) do
                minimize = not c.minimized
            end
            for _, c in ipairs(clients) do
                c.minimized = minimize
            end
        end,
        {description = "(Un)Minimize clients", group = "client"}
    ),
    -- Run prompt
    awful.key(
        {keynames.modkey},
        "r",
        function()
            awful.spawn("rofi -show run")
        end,
        {description = "run prompt", group = "launcher"}
    ),
    -- Prompt for Lua code
    awful.key(
        {keynames.modkey},
        "x",
        function()
            awful.prompt.run {
                prompt = "Run Lua code: ",
                textbox = awful.screen.focused().mypromptbox.widget,
                exe_callback = awful.util.eval,
                history_path = awful.util.get_cache_dir() .. "/history_eval"
            }
        end,
        {description = "lua execute prompt", group = "awesome"}
    ),
    -- Screen brightness controls
    awful.key(
        {},
        "XF86MonBrightnessDown",
        function()
            awful.spawn("xbacklight -10", false)
        end,
        {description = "Brightness down", group = "Extra"}
    ),
    awful.key(
        {},
        "XF86MonBrightnessUp",
        function()
            awful.spawn("xbacklight +10", false)
        end,
        {description = "Brightness up", group = "Extra"}
    ),
    -- Audio controls
    awful.key(
        {},
        "XF86AudioMute",
        function()
            awful.spawn("amixer sset Master toggle", false)
        end,
        {description = "Mute volume", group = "Extra"}
    ),
    awful.key(
        {},
        "XF86AudioLowerVolume",
        function()
            awful.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%", false)
        end,
        {description = "Decrease volume", group = "Extra"}
    ),
    awful.key(
        {},
        "XF86AudioRaiseVolume",
        function()
            awful.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%", false)
        end,
        {description = "Increase volume", group = "Extra"}
    ),
    -- Screenshots
    awful.key(
        {keynames.control},
        "Print",
        function()
            awful.util.spawn_with_shell(
                "maim -s | xclip -selection clipboard -t 'image/png'"
            )
        end,
        {description = "Capture selection to clipboard", group = "Extra"}
    ),
    awful.key(
        {},
        "Print",
        function()
            awful.util.spawn_with_shell(
                "maim | xclip -selection clipboard -t 'image/png'"
            )
        end,
        {description = "Capture whole screen to clipboard", group = "Extra"}
    ),
    awful.key(
        {keynames.modkey},
        "l",
        function()
            awful.spawn("dm-tool lock")
        end,
        {description = "Lock the screen", group = "Extra"}
    ),
    awful.key(
        {"Mod1"},
        "Tab",
        function()
            awful.tag.viewnext(awful.screen.focused())
        end,
        {decription = "Switch to next tag", group = "Extra"}
    ),
    awful.key(
        {keynames.modkey},
        "F7",
        function()
            awful.spawn.easy_async(
                "xrandr --output HDMI2 --auto",
                function(_, _, _, exitcode)
                    if exitcode == 0 then
                        naughty.notify({text = "New monitor connected"})
                    end
                end
            )
        end,
        {decription = "Share screen via HDMI", group = "Extra"}
    ),
    awful.key(
        {keynames.modkey, keynames.shift},
        "F7",
        function()
            awful.spawn.easy_async(
                "xrandr --output HDMI2 --off",
                function(_, _, _, exitcode)
                    if exitcode == 0 then
                        naughty.notify({text = "Disable monitor"})
                    end
                end
            )
        end,
        {decription = "Disable sharing via HDMI", group = "Extra"}
    ),
    awful.key(
        {keynames.modkey},
        "e",
        apps.open_file_browser,
        {decription = "Run ranger", group = "Extra"}
    )
)

for i = 1, #tags.tags do
    globalkeys =
        gears.table.join(
        globalkeys,
        -- View tag only.
        awful.key(
            {keynames.modkey},
            "#" .. i + 9,
            function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    tag:view_only()
                end
            end,
            {description = "view tag #" .. i, group = "tag"}
        ),
        -- Move client to tag.
        awful.key(
            {keynames.modkey, "Shift"},
            "#" .. i + 9,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
                end
            end,
            {description = "move focused client to tag #" .. i, group = "tag"}
        )
    )
end

return globalkeys