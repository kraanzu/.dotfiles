from collections import defaultdict
from pathlib import Path
import subprocess
import os
from typing import List
from libqtile.backend.base.window import Window
from libqtile.layout.xmonad import MonadTall
from libqtile.layout.floating import Floating
from libqtile.layout.max import Max
from libqtile.config import DropDown, ScratchPad, Group
from libqtile import hook, qtile
from vars import *
from utils import key_bindings
from utils.group_bindings import create_workspace_bindings
from utils.colors import color
import qtile_extras.hook
import requests

# ------------------- USER CONSTANTS ---------------------

FLOATING_WINS = ["feh", "flameshot", "openrgb", "popsicle"]
WORKSPACES = ["1", "2", "3", "4", "5"]
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
    nm-applet
    caffeine
    """

    for cmd in commands.splitlines():
        os.system(cmd + " &")


@qtile_extras.hook.subscribe.ghn_new_notification
def ghn_notification():
    token_location = Path("~/.config/qtile-extras/github.token").expanduser()
    if not token_location.exists():
        return

    token = token_location.read_text().strip()
    url = "https://api.github.com/notifications"
    headers = {
        "Authorization": f"token {token}",
        "Accept": "application/vnd.github.v3+json",
    }

    response = requests.get(url, headers=headers)

    if response.status_code != 200:
        return

    def stylize(text: str, bold: bool = True, fg=color.dark1, bg=color.dark1):
        stylized = f"<span color='{fg}' background='{bg}'> {text} </span>"
        if bold:
            return f"<b>{stylized}</b>"

        return stylized

    for notification in response.json():
        title = notification["subject"]["title"]

        notification_color = defaultdict(lambda: color.cyan)
        notification_color.update({"Issue": color.red, "PullRequest": color.green})

        notification_type = notification["subject"]["type"]
        notification_type = stylize(
            notification_type, bg=notification_color[notification_type]
        )

        repo = " " + notification["repository"]["full_name"]
        repo = stylize(repo, bold=True, bg=color.blue)

        qtile.spawn(
            f"""notify-send -t 20000 "Github" "{repo} {notification_type}\n{title}" """
        )

    return response.json()
