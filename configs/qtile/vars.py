import os

# GLOBALS
LOCATION = "Kolkata"  # Your location for weather
DARK = "dark3"  # Your default value for dark


# WIDGET FONTS
FONT = "JetBrainsMono Nerd Font"

# TERMINALS
terminal = "wezterm-gui connect unix --workspace main"
extra_terminal = "wezterm-gui connect unix --workspace extra"
scratch_terminal = "wezterm-gui"

# PATHS
home = os.path.expanduser("~")
wallpaper_path = home + "/.wallpapers"

# EXTRA WORKSPACE
secondary_apps = "discord telegram chrome microsoft".split()

MATCHES = {
    1: ["firefox"],
    3: ["dev.zed.Zed"],
    4: ["vlc"],
    5: ["brave-browser", "discord", "telegram"],
    6: ["spotify", "google-chrome", "microsoft-edge"],
}

LAYOUTS = {
    5: "max",
    6: "max",
}
