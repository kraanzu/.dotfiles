import os
from pathlib import Path
from typing import Literal, Self
from libqtile.core.manager import Qtile
from libqtile.bar import Bar
from bars import *

THEME_FILE_PATH = Path.home() / ".qtile_theme"


class ThemeManager:
    @classmethod
    def get_theme(cls):
        if not THEME_FILE_PATH.exists():
            return KzTheme.theme_wave()

        with open(THEME_FILE_PATH, "r") as f:
            name = f.read().strip()
            return KzTheme.from_name(name)

    @classmethod
    def set_theme(cls, theme: str, qtile: Qtile):
        if not theme:
            return

        with open(THEME_FILE_PATH, "w") as f:
            f.write(theme)

        qtile.reload_config()
        os.system(f'notify-send "Switched to theme {theme}"')

    @classmethod
    def start_theme_switcher(cls, qtile: Qtile):
        def get_all_themes():
            return [
                name[len("theme_") :]
                for name in dir(KzTheme)
                if name.startswith("theme_")
            ]

        def show_rofi():
            themes = "\n".join([''] + get_all_themes())
            rofi_cmd = f"echo -e '{themes}' | rofi -dmenu -p 'Select theme' -i"
            return os.popen(rofi_cmd).read().strip()

        theme = show_rofi()
        cls.set_theme(theme, qtile)


class KzTheme:
    def __init__(
        self,
        workspaces: list[str],
        extra_workspace: str,
        wallpaper: str,
        bar: Bar,
        bar_position: Literal["top", "bottom"] = "bottom",
    ):
        self.workspaces = workspaces
        self.extra_workspace = extra_workspace
        self.wallpaper = wallpaper
        self.bar = bar
        self.bar_position = bar_position

    @classmethod
    def from_name(cls, name: str):
        try:
            return getattr(cls, f"theme_{name}")()
        except Exception as _:
            return cls.theme_wave()  # Default theme

    @classmethod
    def theme_wave(cls) -> Self:
        return cls(
            workspaces=["1", "2", "3", "4", "5"],
            extra_workspace="0",
            wallpaper="the_great_wave",
            bar=minimal_bar,
        )

    @classmethod
    def theme_groot(cls) -> Self:
        return cls(
            workspaces=["󰎤", "󰎧", "󰎪", "󰎭", "󰎱"],
            extra_workspace="󰅗",
            wallpaper="groot",
            bar=groot_bar,
        )
