local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("mux-startup", function()
	local _ = mux.spawn_window({
		workspace = "main",
	})
	local _ = mux.spawn_window({
		workspace = "extra",
	})
	mux.set_active_workspace("main")
end)
