import os
import subprocess
from typing import List

from libqtile.layout.xmonad import MonadTall
from libqtile.layout.floating import Floating
from libqtile.config import DropDown, ScratchPad, Screen, Group, Match
from libqtile import bar, hook

from utils import key_bindings, bottom_bar, color, create_workspace_bindings


# WORKSPACES
spaces = {
    "www": {
        "key": "1",
        "matches": [Match(wm_class="brave-browser")],
    },
    "vim": {
        "key": "2",
        "matches": [Match(wm_class="code")],
    },
    "sys": {
        "key": "3",
    },
    "doc": {
        "key": "4",
        "matches": [Match(wm_class="evince")],
    },
    "chat": {
        "key": "5",
        "matches": [Match(wm_class="discord"), Match(wm_class="telegram-desktop")],
    },
    "mus": {
        "key": "6",
    },
    "xyz": {
        "key": "7",
    },
    "vid": {
        "key": "8",
        "matches": [Match(wm_class="vlc")],
    },
}

# QTILE CONSTANTS
keys = key_bindings + create_workspace_bindings(spaces)
widget_defaults = dict(
    font="SauceCodePro Nerd Font Semi",
    fontsize=30,
    padding=2,
    background=color["transparent"],
)
extension_defaults = widget_defaults.copy()

groups: List[ScratchPad | Group] = [
    ScratchPad(
        "scratchpad",
        [
            DropDown(
                "term", f"alacritty -e tmux -u new -s scratch", height=0.9, opacity=1
            )
        ],
    ),
    *[
        Group(workspace, matches=config.get("matches", None), layout="MonadTall")
        for workspace, config in spaces.items()
    ],
]


screens = [
    Screen(
        top=bottom_bar,
        bottom=bar.Gap(6),
        left=bar.Gap(6),
        right=bar.Gap(6),
    ),
]


floating_layout = Floating(
    float_rules=[
        Match(wm_type="utility"),
        Match(wm_type="toolbar"),
        Match(wm_type="splash"),
        Match(wm_type="dialog"),
        Match(wm_class="file_progress"),
        Match(wm_class="confirm"),
        Match(wm_class="dialog"),
        Match(wm_class="download"),
        Match(wm_class="error"),
        Match(wm_class="notification"),
        Match(wm_class="splash"),
        Match(wm_class="toolbar"),
        Match(wm_class="feh"),
        Match(wm_class="flameshot"),
        Match(func=lambda c: c.has_fixed_size()),
    ],
    border_width=3,
    border_focus=color["cyan"],
)

layouts = [
    MonadTall(
        border_width=3,
        margin=6,
        border_focus=color["cyan"],
        border_normal=color["dark2"],
    ),
]


@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser("~")
    subprocess.call([home + "/.config/qtile/autostart.sh"])
