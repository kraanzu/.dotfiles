local wezterm = require("wezterm")
local tab_bar_left = require("tab_bar_left")
local mux = require("mux")
local keys = require("keys")
require("utils")
require("tab_extras")
require("startup")

local config = {}

config.enable_wayland = true
config.front_end = "WebGpu"
config.color_scheme = "nord"
config.use_fancy_tab_bar = false
config.font_size = 16
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "DemiBold" })
config.default_workspace = "scratch"
config.window_background_opacity = 1
-- config.hide_tab_bar_if_only_one_tab = true
config.max_fps = 120

tab_bar_left.setup(config)
mux.setup(config)
keys.setup(config)

return config
