from base_config import *
from libqtile.config import Screen
from libqtile import bar
from utils.theme import ThemeManager, KzTheme


def apply_theme(theme: KzTheme):
    global screens, groups

    groups.extend(
        configure_workspaces(theme.workspaces),
    )

    wallpaper = f"{wallpaper_path}/{theme.wallpaper}.png"

    screens = [
        Screen(
            top=bar.Gap(1),
            bottom=theme.bar,
            left=bar.Gap(1),
            right=bar.Gap(1),
            wallpaper=wallpaper,
            wallpaper_mode="fill",
        )
    ]


def main():
    apply_theme(ThemeManager.get_theme())


main()
