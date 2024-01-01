import os

# WIDGET FONTS
FONT = "Sauce Code Pro Nerd Font"

# TERMINALS
terminal = "wezterm-gui connect unix --workspace main"
extra_terminal = "wezterm-gui connect unix --workspace extra"
scratch_terminal = "wezterm-gui"

# PATHS
home = os.path.expanduser("~")
scripts_path = home + "/.config/scripts"
rofi_path = home + "/.config/rofi"
wallpaper_path = home + "/.dotfiles/wallpapers"

# EXTRA WORKSPACE
secondary_apps = "discord telegram chrome microsoft".split()

# MISC
SPAWNS = {
}

MATCHES = {
    4: ["vlc"],
    5: ["firefox"],
}

LAYOUTS = {
    5: "max",
    0: "max",
}
