local os = require("os")
local awful = require("awful")


local apps = {}

apps.file_browser = "ranger"
apps.terminal = "alacritty"
apps.editor = os.getenv("EDITOR") or "vim"

apps.run_in_terminal = function (command)
	awful.spawn(apps.terminal .. " -e " .. command .. "")
end

apps.open_terminal = function () awful.spawn(apps.terminal) end

apps.open_file_browser = function ()
	apps.run_in_terminal(apps.file_browser)
end

return apps
