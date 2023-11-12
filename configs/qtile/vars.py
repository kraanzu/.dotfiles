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

# EXTRA WORKSPACE
secondary_apps = "discord telegram chrome microsoft".split()

# MISC
SPAWNS = {
    5: ["firefox -P kwork", "firefox -P kfun"],
}

MATCHES = {
    4: "vlc",
}

LAYOUTS = {
    5: "max",
    0: "max",
}
