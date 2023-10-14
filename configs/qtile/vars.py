# WIDGET FONTS
FONT = "Sauce Code Pro Semibold Nerd Font"

# TERMINALS
terminal = "wezterm-gui connect unix --workspace main"
extra_terminal = "wezterm-gui connect unix --workspace extra"
scratch_terminal = "wezterm-gui"

# PATHS
scripts = "~/.config/qtile/scripts"
rofi = "~/.config/rofi"

# EXTRA WORKSPACE
secondary_apps = "discord telegram chrome".split()

# MISC
SPAWNS = {
    5: "firefox -P kwork",
    0: "firefox -P kfun",
}

MATCHES = {
    4: "vlc",
}
