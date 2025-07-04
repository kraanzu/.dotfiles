from libqtile.config import EzKey as Keybind
from libqtile.core.manager import Qtile
from libqtile.lazy import lazy
import os

terminal = "wezterm-gui connect unix --workspace main"
scratch = "wezterm-gui connect unix --workspace extra"


@lazy.function
def toggle_dual_monitors(qtile: Qtile) -> None:
    single = len(qtile.screens) == 1

    if single:
        script = "autorandr --load dual-monitor"
    else:
        script = "autorandr --load single-monitor"

    os.system(script)


key_bindings = [
    Keybind(
        "M-S-<Return>",
        lazy.spawn("rofi -show drun"),
        desc="Launch rofi app-launcer",
    ),
    Keybind(
        "M-S-b",
        lazy.spawn("rofi-bluetooth"),
        desc="Launch rofi app-launcer",
    ),
    Keybind(
        "C-A-e",
        lazy.spawn("evince"),
        desc="Launces Evince PDF Reader",
    ),
    Keybind(
        "M-<Insert>",
        lazy.spawn("flameshot gui"),
        desc="Take Screen Snip",
    ),
    Keybind(
        "A-<Return>",
        lazy.spawn(scratch),
        desc="Launches Terminal",
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
        lazy.spawn("rofi -show power-menu"),
        desc="Shows rofi power-menu",
    ),
    Keybind(
        "M-<Up>",
        lazy.spawn("pactl -- set-sink-volume 0 +5%"),
        desc="Increase Volume",
    ),
    Keybind(
        "M-<Down>",
        lazy.spawn("pactl -- set-sink-volume 0 -5%"),
        desc="Decrease Volume",
    ),
    Keybind(
        "<XF86AudioPlay>",
        lazy.spawn("playerctl play-pause"),
        desc="Play/Pause player",
    ),
    Keybind(
        "<XF86AudioNext>",
        lazy.spawn("playerctl next"),
        desc="Skip to next",
    ),
    Keybind(
        "<XF86AudioPrev>",
        lazy.spawn("playerctl previous"),
        desc="Skip to previous",
    ),
    Keybind(
        "M-S-<Up>",
        lazy.spawn("pactl -- set-sink-volume 0 +2%"),
    ),
    Keybind(
        "M-S-<Down>",
        lazy.spawn("pactl -- set-sink-volume 0 -2%"),
    ),
    # Keybind(
    #     "M-<Tab>",
    #     lazy.next_layout(),
    #     desc="Toggle through different layouts",
    # ),
    Keybind(
        "M-q",
        lazy.window.kill(),
        desc="Kill/Quit active window ",
    ),
    Keybind(
        "M-S-r",
        lazy.reload_config(),
        desc="Soft Reload",
    ),
    Keybind(
        "M-S-q",
        lazy.shutdown(),
        desc="Shutdown Qtile",
    ),
    # Window controls
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
