local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("update-right-status", function(window)
	local workspace = mux.get_active_workspace()
	window:set_right_status(wezterm.format({
		{ Background = { Color = "#8fbcbb" } },
		{ Foreground = { Color = "#2e3440" } },
		{ Text = "  " .. workspace .. " " },
	}))
end)

return {}
