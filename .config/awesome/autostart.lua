local runonce = require("utils.runonce")

local function setup_auto_start()
	-- Keyboard layouts
	runonce.run("setxkbmap -option grp:win_space_toggle -layout us,ru,ua")
	-- Compositor
	runonce.run("picom -b")
	runonce.run("xsettingsd")
	runonce.run("lxqt-policykit-agent")
end

return { setup_auto_start = setup_auto_start }
