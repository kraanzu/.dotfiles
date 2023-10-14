from themes.base import *
from bars.groot_bar import groot_bar
from libqtile import bar
from libqtile.config import Screen

WORKSPACES = "    ".split()
EXTRA_WORKSPACE = ""

groups.extend(configure_workspaces(WORKSPACES, EXTRA_WORKSPACE))

screens = [
    Screen(
        top=groot_bar,
        bottom=bar.Gap(6),
        left=bar.Gap(6),
        right=bar.Gap(6),
    ),
]
