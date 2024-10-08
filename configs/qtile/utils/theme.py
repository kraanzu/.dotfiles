from typing import Literal, Self
from libqtile.bar import Bar
from bars import *


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
            workspaces=["1", "2", "3", "4", "5"],
            extra_workspace="0",
            wallpaper="groot",
            bar=groot_bar,
        )
