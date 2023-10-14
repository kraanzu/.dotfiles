from themes.base import *
from utils import screen0_bar
from libqtile import bar
from libqtile.config import Screen


screens = [
    Screen(
        top=screen0_bar,
        bottom=bar.Gap(6),
        left=bar.Gap(6),
        right=bar.Gap(6),
    ),
]
