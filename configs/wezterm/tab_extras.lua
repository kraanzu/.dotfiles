local wezterm = require("wezterm")
local utils = require("utils")
local mux = wezterm.mux

wezterm.on("update-status", function(window)
	local workspace = mux.get_active_workspace()
	local left = {
		{ Background = { Color = "#8fbcbb" } },
		{ Foreground = { Color = "#2e3440" } },
		{ Text = " 󰉋 " .. workspace .. " " },
	}

	utils.appendTables(left, utils.tab_separator)
	window:set_left_status(wezterm.format(left))
end)

return {}
