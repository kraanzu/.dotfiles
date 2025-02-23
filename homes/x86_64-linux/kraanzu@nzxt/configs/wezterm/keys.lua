local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

function M.setup(config)
	config.keys = {
		-- handle vim's TComment
		{ key = "/", mods = "CTRL", action = wezterm.action({ SendString = "\x1f" }) },
		{ key = "RightArrow", mods = "CTRL", action = act.SwitchWorkspaceRelative(1) },
		{ key = "LeftArrow", mods = "CTRL", action = act.SwitchWorkspaceRelative(-1) },
		{ key = "x", mods = "CTRL", action = act.CloseCurrentTab({ confirm = false }) },
	}
end

return M
