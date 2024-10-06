from themes.base import *
from bars.minimal import minimal_bar
from libqtile import bar
from libqtile.config import Screen
from vars import wallpaper_path

WORKSPACES = "1 2 3 4 5".split()
EXTRA_WORKSPACE = "0"
WALL = f"{wallpaper_path}/blank.png"

groups.extend(
    configure_workspaces(WORKSPACES, EXTRA_WORKSPACE),
)

screens = [
    Screen(
        top=bar.Gap(1),
        bottom=minimal_bar,
        left=bar.Gap(1),
        right=bar.Gap(1),
        wallpaper=WALL,
    ),
    Screen(
        wallpaper=WALL,
        wallpaper_mode="fill",
    ),
]
