local awful = require("awful")
local beautiful = require("beautiful")
local keys = require("keys")
local tags = require("tags")
local utils = require("utils")

-- Rules
-- Rules to apply to new clients (through the "manage" signal).
local rules = {
    {
        rule = {},
        properties = {
            size_hints_honor = false,
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = keys.clientkeys,
            buttons = keys.clientbuttons,
            screen = awful.screen.preferred,
            maximized_vertical = false,
            maximized_horizontal = false,
            titlebars_enabled = false,
        }
    },
    {
        rule = { name = "win0" }, -- intellij idea startup modal
        properties = {
            tag = tags.tagnames.code_tag,
            floating = true,
            urgent = true,
        }
    },
    -- Move all code editors and IDE to tag `tags.tagnames.code_tag`
    {
        rule_any = {
            instance = {
                "code" -- VSCode
            },
            class = {
                "jetbrains-idea", -- Intellij IDEA stuff
                "jetbrains-pycharm",
                "jetbrains-goland"
            }
        },
        properties = {
            tag = tags.tagnames.code_tag,
            switchtotag = false
        }
    },
    -- Move all browsers to tag `tags.tagnames.browser_tag`
    {
        rule_any = {
            class = {
                "Google-chrome",
                "firefox",
                "Brave-browser"
            }
        },
        properties = {
            tag = tags.tagnames.browser_tag,
            switchtotag = false
        }
    },
    -- Move messengers to `tags.tagnames.messenger_tag`
    {
        rule_any = {
            instance = {
                "Thunderbird"
            },
            class = {
                "TelegramDesktop",
                "tg",
                "Slack",
                "Mail"
            }
        },
        properties = {
            tag = tags.tagnames.messenger_tag,
            switchtotag = false
        }
    },
    {
        rule_any = {
            instance = {
                "hearthstone.exe",
                "battle.net.exe",
                "lutris"
            }
        },
        properties = {
            tag = tags.tagnames.games_tag,
            switchtotag = false,
            border_width = 0,
            floating = true
        }
    },
    {
        rule_any = {
            name = {
                "Hearthstone"
            }
        },
        properties = {
            fullscreen = true
        }
    },
    -- Floating clients.
    -- Instance - first string of WM_CLASS
    -- Class - second string of WM_CLASS
    -- Role - WM_WINDOW_ROLE
    {
        rule_any = {
            instance = {
                "copyq", -- Includes session name in class.
                "Dialog",
                "sun-awt-X11-XWindowPeer", -- JetBrainsDialogs
                "battle.net.exe"
            },
            class = {
                "Tor Browser",
                "Thunar",
                "Gnucash",
                "Dialog",
                "Pavucontrol",
                "Arandr",
                "Gpick",
                "Kruler",
                "MessageWin", -- kalarm.
                "Sxiv",
                "Wpa_gui",
                "pinentry",
                "veromix",
                "xtightvncviewer"
            },
            name = {
                "Choose",
                "Authentication",
                "Print", -- Print file dialog
                "Open", -- Open file dialog
                "Open file",
                "Event Tester", -- xev.
                "Select Application",
            },
            role = {
                "AlarmWindow", -- Thunderbird's calendar.
                "pop-up" -- e.g. Google Chrome's (detached) Developer Tools.
            }
        },
        properties = {
            floating = true,
            border_width = 0
        }
    }
}

return {
	rules = rules,
}
