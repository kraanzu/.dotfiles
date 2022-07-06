from libqtile.config import EzKey as Keybind
import os
from libqtile.lazy import lazy

terminal = "alacritty"
home = os.path.expanduser("~")
scripts = home + "/.config/qtile/scripts"
myConfig = home + "/.config/qtile/config.py"
rofi_path = home + "/.config/rofi"

key_bindings = [
    Keybind(
        "M-S-t", lazy.spawn(f"bash {rofi_path}/tmux"), desc="Launch rofi tmux-switcher"
    ),
    Keybind(
        "M-S-a",
        lazy.spawn(f"bash {rofi_path}/audio_changer"),
        desc="Launch rofi tmux-switcher",
    ),
    Keybind(
        "M-S-<Return>",
        lazy.spawn(f"bash {rofi_path}/window_list"),
        desc="Launch rofi app-launcer",
    ),
    Keybind("M-b", lazy.spawn("blueberry"), desc="Toogle bar visibility"),
    Keybind("M-S-b", lazy.hide_show_bar("top"), desc="Toogle bar visibility"),
    # LAUNCHING APPS with Ctrl + Alt + Key
    Keybind(
        "C-A-l",
        lazy.spawn(f"sh {scripts}/blur-lock.sh"),
        desc="launches i3-blur lock",
    ),
    Keybind(
        "C-<Insert>",
        lazy.spawn("scrot"),
        desc="Screen_Shot",
    ),
    Keybind(
        "M-<Insert>",
        lazy.spawn("flameshot gui"),
        desc="Screen_Shot",
    ),
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
        "M-<Return>",
        lazy.spawn(terminal),
        desc="Launches My Terminal with fish shell",
    ),
    # The essentials
    Keybind(
        "M-x",
        lazy.spawn(f"bash {rofi_path}/powermenu.sh"),
        desc="Shows rofi power_menu",
    ),
    Keybind(
        "M-S-<Up>",
        lazy.spawn("amixer -D pulse sset Master 2%+"),
        desc="Granuler control over volume",
    ),
    Keybind(
        "M-S-<Down>",
        lazy.spawn("amixer -D pulse sset Master 2%-"),
        desc="Granular control over volume",
    ),
    Keybind(
        "M-<Up>",
        lazy.spawn("amixer -D pulse sset Master 5%+"),
        desc="Increase Volume (pulse so that it automatically recognizes inserted devices)",
    ),
    Keybind(
        "M-<Down>",
        lazy.spawn("amixer -D pulse sset Master 5%-"),
        desc="Decrease Volume (pulse so that it automatically recognizes inserted devices)",
    ),
    # BASIC UTILITIES
    Keybind(
        "M-<Tab>",
        lazy.next_layout(),
        desc="Toggle through different layouts",
    ),
    Keybind("M-q", lazy.window.kill(), desc="Kill/Quit active window "),
    Keybind(
        "M-S-r",
        lazy.restart(),
        desc="Soft Reload",
    ),
    Keybind("M-S-q", lazy.shutdown(), desc="Shutdown Qtile"),
    # Window controls
    Keybind("M-<Right>", lazy.screen.next_group(), desc="Move to next Group"),
    Keybind("M-<Left>", lazy.screen.prev_group(), desc="Move to previous Group"),
    Keybind(
        "M-h",
        lazy.layout.grow(),
    ),
    Keybind(
        "M-l",
        lazy.layout.shrink(),
    ),
    Keybind("M-n", lazy.layout.normalize(), desc="normalize window size ratios"),
    Keybind(
        "M-m",
        lazy.layout.maximize(),
        desc="toggle window between minimum and maximum sizes",
    ),
    Keybind("M-S-f", lazy.window.toggle_floating(), desc="toggle floating"),
    Keybind("M-S-m", lazy.window.toggle_fullscreen(), desc="toggle fullscreen"),
    # Stack controls
    Keybind(
        "M-S-<space>",
        lazy.layout.rotate(),
        lazy.layout.flip(),
        desc="Switch which side main pane occupies (XmonadTall)",
    ),
    Keybind(
        "M-<space>",
        lazy.layout.next(),
        desc="Switch window focus to other pane(s) of stack",
    ),
    Keybind("M-s", lazy.group["scratchpad"].dropdown_toggle("term")),
]
