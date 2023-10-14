import os
from typing import List
from libqtile.backend.base import Window
from libqtile.layout.xmonad import MonadTall
from libqtile.layout.floating import Floating
from libqtile.layout.max import Max
from libqtile.config import DropDown, ScratchPad, Group
from libqtile import hook
from vars import *
from utils import (
    key_bindings,
    color,
    create_workspace_bindings,
    workspaces,
)

# ------------------- USER CONSTANTS ---------------------

FLOATING_WINS = ["feh", "flameshot", "openrgb", "popsicle"]
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
        groups.append(Group(workspace, layout="monadtall", spawn=SPAWNS.get(index)))

    groups.append(Group("0", layout="max", spawn=SPAWNS.get(0), label=extra_workspace))

    return groups


# -------------------- DEFAULTS ------------------------

widget_defaults = dict(
    font=FONT,
    fontsize=16,  # 16 for text, 25 for icons
    padding=3,
    background=color["dark2"],
)

layout_defaults = dict(
    border_width=3,
    border_focus=color["cyan"],
    border_normal=color["dark2"],
)

# ---------------- QTILE CONSTANTS -------------------------

keys = key_bindings + create_workspace_bindings(workspaces)
groups: List[ScratchPad | Group] = [SCRATCHPAD]
floating_layout = Floating(None, None, **layout_defaults)
layouts = [
    MonadTall(**layout_defaults),
    Max(**layout_defaults),
]

# ------------------- QTILE HOOKS ---------------------


@hook.subscribe.client_new
def func(win: Window):
    if any(i in win.name.lower() for i in secondary_apps):
        return win.togroup("0")

    # FLOAT
    wm_class = win.get_wm_class()
    if wm_class:
        if any(app.lower() in FLOATING_WINS for app in wm_class):
            return win.cmd_enable_floating()


@hook.subscribe.startup_complete
def startup_complete():
    os.system("xdotool key Super+0")
    os.system("xdotool key Super+1")


@hook.subscribe.startup_once
def start_once():
    os.system("~/.config/qtile/autostart.sh")
