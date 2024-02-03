local wezterm = require("wezterm")
local utils = require("utils")
local mux = wezterm.mux

wezterm.on("update-status", function(window)
	local workspace = mux.get_active_workspace()

	local color
	if workspace == "main" then
		color = "#81a1c1"
	else
		color = "#ebcb8b"
	end

	local left = {
		{ Background = { Color = color } },
		{ Foreground = { Color = "#2e3440" } },
		{ Text = " " .. workspace .. " " },
	}

	utils.appendTables(left, utils.tab_separator)
	window:set_left_status(wezterm.format(left))
end)

return {}
