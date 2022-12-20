import os
from libqtile.config import EzKey as Keybind
from libqtile.lazy import lazy

terminal = "alacritty"
home = os.path.expanduser("~")
scripts = home + "/.config/qtile/scripts"
myConfig = home + "/.config/qtile/config.py"
rofi_path = home + "/.config/rofi"

key_bindings = [
    # ROFI SCRIPTS -> Mod + Shift + <Key>
    Keybind(
        "M-S-t",
        lazy.spawn(f"bash {rofi_path}/tmux"),
        desc="Launch rofi tmux-switcher",
    ),
    Keybind(
        "M-S-a",
        lazy.spawn(f"python {rofi_path}/audio_switcher.py"),
        desc="Launch rofi audio-switcher",
    ),
    Keybind(
        "M-S-<Return>",
        lazy.spawn(f"bash {rofi_path}/window_list"),
        desc="Launch rofi app-launcer",
    ),
    # LAUNCHING APPS -> Ctrl + Alt + <Key>
    Keybind(
        "C-A-b",
        lazy.spawn("firefox"),
        desc="Launches firefox Browser",
    ),
    Keybind(
        "C-A-v",
        lazy.spawn("brave"),
        desc="Launches Brave Browser",
    ),
    Keybind(
        "C-A-e",
        lazy.spawn("evince"),
        desc="Launces Evince PDF Reader",
    ),
    Keybind(
        "C-A-l",
        lazy.spawn(f"sh {scripts}/blur-lock.sh"),
        desc="launches i3-blur lock",
    ),
    Keybind(
        "C-<Insert>",
        lazy.spawn("scrot"),
        desc="Take Screen Shot",
    ),
    Keybind(
        "M-<Insert>",
        lazy.spawn("flameshot gui"),
        desc="Take Screen Snip",
    ),
    # THE ESSENTIAL STUFF -> Mod + <Key>
    Keybind(
        "M-b",
        lazy.spawn(f"bash {rofi_path}/bluetooth.sh"),
        desc="Lauch bluetooth manager",
    ),
    Keybind(
        "M-<Return>",
        lazy.spawn(terminal),
        desc="Launches Terminal",
    ),
    Keybind(
        "M-s",
        lazy.group["scratchpad"].dropdown_toggle("term"),
        desc="Launches Terminal Scratchpad",
    ),
    Keybind(
        "M-x",
        lazy.spawn(f"bash {rofi_path}/powermenu.sh"),
        desc="Shows rofi power-menu",
    ),
    Keybind(
        "M-<Up>",
        lazy.spawn("amixer -D pulse sset Master 5%+"),
        desc="Increase Volume",
    ),
    Keybind(
        "M-<Down>",
        lazy.spawn("amixer -D pulse sset Master 5%-"),
        desc="Decrease Volume",
    ),
    Keybind(
        "M-S-<Up>",
        lazy.spawn("amixer -D pulse sset Master 2%+"),
    ),
    Keybind(
        "M-S-<Down>",
        lazy.spawn("amixer -D pulse sset Master 2%-"),
    ),
    # QTILE STUFF
    Keybind(
        "M-S-b",
        lazy.hide_show_bar("top"),
        desc="Toogle top-bar visibility",
    ),
    Keybind(
        "M-<Tab>",
        lazy.next_layout(),
        desc="Toggle through different layouts",
    ),
    Keybind(
        "M-q",
        lazy.window.kill(),
        desc="Kill/Quit active window ",
    ),
    Keybind(
        "M-S-r",
        lazy.restart(),
        desc="Soft Reload",
    ),
    Keybind(
        "M-S-q",
        lazy.shutdown(),
        desc="Shutdown Qtile",
    ),
    # Window controls
    Keybind(
        "M-<Right>",
        lazy.screen.next_group(),
        desc="Move to next Group",
    ),
    Keybind(
        "M-<Left>",
        lazy.screen.prev_group(),
        desc="Move to previous Group",
    ),
    Keybind(
        "M-h",
        lazy.layout.grow(),
        desc="Increase Window Size",
    ),
    Keybind(
        "M-l",
        lazy.layout.shrink(),
        desc="Decrease Window Size",
    ),
    Keybind(
        "M-n",
        lazy.layout.normalize(),
        desc="Normalize window size ratios",
    ),
    Keybind(
        "M-S-f",
        lazy.window.toggle_floating(),
        desc="Toggle floating state",
    ),
    Keybind(
        "M-S-m",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen",
    ),
    # Stack controls
    Keybind(
        "M-S-<space>",
        lazy.layout.rotate(),
        lazy.layout.flip(),
        desc="Switch which side main pane occupies (MonadTall)",
    ),
    Keybind(
        "M-<space>",
        lazy.layout.next(),
        desc="Switch window focus to other pane(s) of stack",
    ),
]
