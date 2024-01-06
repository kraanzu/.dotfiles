from collections.abc import Callable
from typing import Union
from libqtile import bar
from qtile_extras.widget.decorations import RectDecoration
from utils.colors import color
from bars.base import *

# GLOBAL VALUES

ACCENT1 = "blue"
DARK = "dark3"
PAD = Spacer(length=8)
ICONS = {
    "favicon": "󰌠",
    "clock": "󰥔",
    "date": "󰃵",
    "speaker": "󰓃",
    "headphone": "󰋋",
    "memory": "󰍛",
}


# GENERAL UTILS
def IconWidget(icon: Union[str, Callable[..., str]], color: str = ACCENT1) -> TextBox:
    if not callable(icon):
        func = lambda: ICONS[icon]
    else:
        func = icon

    return GenPollText(
        func=func,
        update_interval=2 * callable(icon),
        **ICON_WIDGET_DEFAULTS,
        **get_decor(color),
    )


def get_vol_icon() -> str:
    icon = "headphone" if is_headphone_connected() else "speaker"
    return ICONS.get(icon, "?")


def config(name: str):
    config = DEFAULT_CONFIGS.get(name, {})
    if name not in IGNORE_EXTRA_CONFIG:
        config |= get_decor(DARK)

    return config


def get_decor(c: str) -> dict:
    fg = "dark2" if not "dark" in c else "light3"
    return {
        "fmt": " {} ",
        "foreground": color[fg],
        "decorations": [
            RectDecoration(
                colour=color[c],
                radius=0,
                filled=True,
                padding_x=1,
                padding_y=7,
            ),
        ],
    }


# ACTUAL WIDGETS
BAR_WIDGETS = [
    # Left Section
    # -------------------
    TextBox(
        foreground=color["blue"],
        fontsize=23,
        text=f" {ICONS['favicon']} ",
    ),
    SEP1,
    GroupBox(**config("groupbox")),
    # Middle Section
    # -------------------
    Spacer(),
    # Right Section
    # -------------------
    Systray(**config("systray")),
    PAD,
    IconWidget("memory"),
    Memory(**config("memory")),
    PAD,
    IconWidget(get_vol_icon),
    Volume(**config("volume")),
    PAD,
    IconWidget("clock"),
    Clock(**config("clock")),
    PAD,
    IconWidget("date"),
    Clock(**config("date")),
    PAD,
]

# MAIN
groot_bar = bar.Bar(
    BAR_WIDGETS,
    size=40,
)
