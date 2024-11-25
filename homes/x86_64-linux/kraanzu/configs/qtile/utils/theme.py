import os
from pathlib import Path
from typing import Literal, Self
from libqtile.core.manager import Qtile
from libqtile.bar import Bar
from bars import *
from utils.rofi import run_rofi

THEME_FILE_PATH = Path.home() / ".qtile_theme"


class ThemeManager:
    @classmethod
    def get_theme(cls):
        if not THEME_FILE_PATH.exists():
            return KzTheme.theme_simple()

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

        themes = get_all_themes()
        theme = run_rofi(themes, "theme:")
        cls.set_theme(theme, qtile)


class KzTheme:
    def __init__(
        self,
        workspaces: list[str],
        wallpaper: str,
        bar: Bar,
        bar_position: Literal["top", "bottom"] = "bottom",
    ):
        self.workspaces = workspaces
        self.wallpaper = wallpaper
        self.bar = bar
        self.bar_position = bar_position

    @classmethod
    def from_name(cls, name: str):
        try:
            return getattr(cls, f"theme_{name}")()
        except Exception as _:
            return cls.theme_simple()  # Default theme

    @classmethod
    def theme_simple(cls) -> Self:
        return cls(
            workspaces=["1", "2", "3", "4", "5", "6"],
            wallpaper="the_great_wave",
            bar=simple_bar,
        )

    @classmethod
    def theme_rounded(cls) -> Self:
        return cls(
            workspaces=["󱓻", "󱓻", "󱓻", "󱓻", "󱓻", "󱓻"],
            wallpaper="nixos",
            bar=rounded_bar,
        )
