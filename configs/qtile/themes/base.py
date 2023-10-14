import os
from typing import List
from libqtile.layout.xmonad import MonadTall
from libqtile.layout.floating import Floating
from libqtile.layout.max import Max
from libqtile.config import DropDown, ScratchPad, Group, Match
from libqtile import hook
from vars import *
from utils import (
    key_bindings,
    color,
    create_workspace_bindings,
    workspaces,
)

# USER CONSTANTS
WORKSPACES = list("12345")
EXTRA_WORKSPACE = "0"
SCRATCHPAD = ScratchPad(
    name="scratchpad",
    dropdowns=[DropDown(name="term", cmd=scratch_terminal, height=0.9, opacity=1)],
)


def configure_workspaces(
    workspaces: List[str] = WORKSPACES,
    extra_workspace: str = EXTRA_WORKSPACE,
):
    groups = []

    for index, workspace in enumerate(workspaces, 1):
        groups.append(
            Group(
                workspace,
                layout="monadtall",
                spawn=SPAWNS.get(index),
            )
        )

    groups.append(
        Group(
            "0",
            layout="max",
            spawn=SPAWNS.get(0),
            label=extra_workspace,
        )
    )

    return groups


# ---------------- QTILE CONSTANTS -------------------------

keys = key_bindings + create_workspace_bindings(workspaces)

widget_defaults = dict(
    font=FONT,
    fontsize=16,  # 16 for text, 25 for icons
    padding=3,
    background=color["dark2"],
)

groups: List[ScratchPad | Group] = [SCRATCHPAD]


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


# ------------------- QTILE HOOKS ---------------------


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
