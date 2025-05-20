from base_config import *
from libqtile.config import Screen
from libqtile import bar
from bars import simple_bar


workspaces = ["1", "2", "3", "4", "5", "6"]
wallpaper = "the_great_wave"

groups.extend(
    configure_workspaces(workspaces),
)

wallpaper = f"{wallpaper_path}/{wallpaper}.png"

screens = [
    Screen(
        top=bar.Gap(1),
        bottom=simple_bar,
        left=bar.Gap(1),
        right=bar.Gap(1),
        wallpaper=wallpaper,
        wallpaper_mode="fill",
    )
]
