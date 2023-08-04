import os
from typing import List
from libqtile.layout.xmonad import MonadTall
from libqtile.layout.floating import Floating
from libqtile.layout.max import Max
from libqtile.config import DropDown, ScratchPad, Screen, Group, Match
from libqtile import bar, hook

from utils import (
    key_bindings,
    screen0_bar,
    color,
    create_workspace_bindings,
    workspaces,
)

secondary_monitor_apps = ["discord", "telegram", "edge"]

# QTILE CONSTANTS
keys = key_bindings + create_workspace_bindings(workspaces)
widget_defaults = dict(
    font="Sauce Code Pro Semibold Nerd Font",
    fontsize=16,
    padding=2,
    background=color["dark2"],
)

groups: List[ScratchPad | Group] = [
    ScratchPad(
        "scratchpad",
        [DropDown("term", "alacritty", height=0.9, opacity=1)],  # noqa
    ),
    *[Group(workspace, layout="monadtall") for workspace in workspaces],
    Group("0", layout="max", spawn="firefox -P kfun"),
]


screens = [
    Screen(
        top=screen0_bar,
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
    # floating_layout,
    Max(
        border_width=3,
        margin=6,
        border_focus=color["cyan"],
        border_normal=color["dark2"],
    ),
]


@hook.subscribe.client_new
def func(win):
    if any(i in win.name.lower() for i in secondary_monitor_apps):
        win.togroup("0")


@hook.subscribe.startup_complete
def startup_complete():
    os.system("xdotool key Super+0")
    os.system("xdotool key Super+1")


@hook.subscribe.startup_once
def start_once():
    os.system("~/.config/qtile/autostart.sh")
