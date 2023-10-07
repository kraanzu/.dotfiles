local wezterm = require("wezterm")
local _ = require("utils")
local tab_bar_left = require("tab_bar_left")
local mux = require("mux")

local config = {}

config.color_scheme = "nord"
config.use_fancy_tab_bar = false
config.cell_width = 0.95
config.window_background_opacity = 0.95
config.font_size = 16.5
config.hide_tab_bar_if_only_one_tab = true
config.font = wezterm.font("SauceCodePro Nerd Font", { weight = "DemiBold" })

-- handle vim's TComment
config.keys = {
	{ key = "/", mods = "CTRL", action = wezterm.action({ SendString = "\x1f" }) },
}

tab_bar_left.extra_config(config)
mux.extra_config(config)

return config
