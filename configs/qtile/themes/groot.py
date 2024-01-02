from themes.base import *
from bars.groot_bar import groot_bar
from libqtile import bar
from libqtile.config import Screen
from vars import wallpaper_path

WORKSPACES = "    ".split()
EXTRA_WORKSPACE = ""
WALL1 = f"{wallpaper_path}/groot.png"
WALL2 = f"{wallpaper_path}/blank.png"

groups.extend(configure_workspaces(WORKSPACES, EXTRA_WORKSPACE))

screens = [
    Screen(
        top=groot_bar,
        bottom=bar.Gap(6),
        left=bar.Gap(6),
        right=bar.Gap(6),
        wallpaper=WALL1,
    ),
    Screen(
        wallpaper=WALL2,
        wallpaper_mode="fill",
    ),
]

