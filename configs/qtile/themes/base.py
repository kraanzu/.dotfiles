import os
from typing import List
from libqtile.layout.xmonad import MonadTall
from libqtile.layout.floating import Floating
from libqtile.layout.max import Max
from libqtile.config import DropDown, ScratchPad, Group, Match
from libqtile import hook

from utils import (
    key_bindings,
    color,
    create_workspace_bindings,
    workspaces,
)

from vars import *


# QTILE CONSTANTS
keys = key_bindings + create_workspace_bindings(workspaces)

widget_defaults = dict(
    font="Sauce Code Pro Semibold Nerd Font",
    fontsize=16,  # 16 for text, 25 for icons
    padding=2,
    background=color["dark2"],
)

groups: List[ScratchPad | Group] = [
    ScratchPad(
        "scratchpad",
        [
            DropDown(
                name="scratch_terminal",
                cmd="wezterm",
                height=0.9,
                opacity=1,
            )
        ],
    ),
    *[
        Group(
            workspace,
            layout="monadtall",
            spawn=SPAWNS.get(index),
        )
        for index, workspace in enumerate(workspaces, 1)
    ],
    Group(
        "0",
        layout="max",
        spawn=SPAWNS.get(0),
        label="",
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
        Match(wm_class="openrgb"),
        Match(wm_class="Popsicle"),
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
    Max(
        border_width=3,
        margin=6,
        border_focus=color["cyan"],
        border_normal=color["dark2"],
    ),
]


@hook.subscribe.client_new
def func(win):
    if any(i in win.name.lower() for i in secondary_apps):
        return win.togroup("0")


@hook.subscribe.startup_complete
def startup_complete():
    os.system("xdotool key Super+0")
    os.system("xdotool key Super+1")


@hook.subscribe.startup_once
def start_once():
    os.system("~/.config/qtile/autostart.sh")