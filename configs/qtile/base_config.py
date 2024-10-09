import subprocess
import os
from typing import List
from libqtile.backend.base.window import Window
from libqtile.layout.xmonad import MonadTall
from libqtile.layout.floating import Floating
from libqtile.layout.max import Max
from libqtile.config import DropDown, ScratchPad, Group
from libqtile import hook
from vars import *
from utils import key_bindings
from utils.group_bindings import create_workspace_bindings
from utils.colors import color

# ------------------- USER CONSTANTS ---------------------

FLOATING_WINS = ["feh", "flameshot", "openrgb", "popsicle"]
WORKSPACES = ["1", "2", "3", "4", "5"]
EXTRA_WORKSPACE = "0"
SCRATCHPAD = ScratchPad(
    name="scratchpad",
    dropdowns=[DropDown(name="term", cmd=scratch_terminal, height=0.9, opacity=1)],
)


def configure_workspaces(workspaces: list[str] = WORKSPACES):
    groups = []

    for index, workspace in enumerate(workspaces, 1):
        groups.append(
            Group(
                str(index),
                layout=LAYOUTS.get(index, "monadtall"),
                spawn=SPAWNS.get(index),
                label=workspace,
            )
        )

    return groups


# -------------------- DEFAULTS ------------------------

widget_defaults = dict(
    font=FONT,
    fontsize=16,  # 16 for text, 25 for icons
    padding=3,
    background=color.extra_dark,
)

layout_defaults = dict(
    border_width=3,
    border_focus=color.blue,
    border_normal=color.dark2,
)

# ---------------- QTILE CONSTANTS -------------------------

keys = key_bindings + create_workspace_bindings()
groups: List[ScratchPad | Group] = [SCRATCHPAD]
floating_layout = Floating(None, None, **layout_defaults)
layouts = [
    MonadTall(**layout_defaults),
    Max(**layout_defaults),
]

# ------------------- QTILE HOOKS ---------------------


@hook.subscribe.client_new
def func(win: Window):
    # FLOAT
    wm_class = win.get_wm_class()
    if wm_class:
        if any(app.lower() in FLOATING_WINS for app in wm_class):
            func = win.cmd_enable_floating
            if callable(func):
                func()

        for workspace, apps in MATCHES.items():
            if any(app.lower() in wm_class for app in apps):
                win.togroup(str(workspace))
                break


@hook.subscribe.screens_reconfigured
def screens_reconfigured():
    def get_current_screen():
        try:
            active_desktop = subprocess.check_output(
                "wmctrl -d | awk '/\\*/ {print $NF}'",
                shell=True,
                text=True,
            ).strip()
            return active_desktop
        except subprocess.CalledProcessError:
            return 1

    os.system("xdotool key Super+0")
    os.system(f"xdotool key Super+{get_current_screen()}")


@hook.subscribe.startup_once
def start_once():
    commands = """
    xfce4-clipman
    wezterm-mux-server --daemonize
    firefox
    discord
    """

    for cmd in commands.splitlines():
        os.system(cmd + " &")


# ------------------------------------------
# QTILE CONFIG
# From: KzTheme
# ------------------------------------------
