local awful = require("awful")
local layouts = require("layouts")


local tagnames = {
    terminal_tag = "",
    code_tag = "",
    browser_tag = "",
    messenger_tag = "",
    games_tag = ""
}


local tags = {
    tagnames.terminal_tag,
    tagnames.code_tag,
    tagnames.browser_tag,
    tagnames.messenger_tag,
    tagnames.games_tag,
}

local function init_tags(s)
    awful.tag.add(
        tagnames.terminal_tag,
        {
            layout = layouts.fair,
            screen = s,
            selected = true,
        }
    )
    awful.tag.add(
        tagnames.code_tag,
        {
            layout = layouts.maximized,
            screen = s,
        }
    )
    awful.tag.add(
        tagnames.browser_tag,
        {
            layout = layouts.tile,
            screen = s,
        }
    )
    awful.tag.add(
        tagnames.messenger_tag,
        {
            layout = layouts.tile,
            screen = s,
        }
    )
    awful.tag.add(
        tagnames.games_tag,
        {
            layout = layouts.fullscreen,
            screen = s,
        }
    )
end

return {
    tagnames = tagnames,
    tags = tags,
    init_tags = init_tags,
}
