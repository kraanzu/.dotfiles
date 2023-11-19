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


# SETUP EXTRA WIDGET CONFIGS
groupbox_config = dict(
    this_current_screen_border=color["blue"],
    this_screen_border=color["blue"],
    active=color["light3"],
    inactive=color["grey"],
    highlight_color=color["dark2"],
    highlight_method="text",
    inactive_highlight_method="text",
    foreground=color["light1"],
    urgent_border=color["red"],
    disable_drag=True,
    fontsize=30,
)


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


def get_config(name: str):
    return DEFAULT_CONFIGS.get(name, {}) | get_decor(DARK)


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
    GroupBox(**groupbox_config),
    # Middle Section
    # -------------------
    Spacer(),
    # Right Section
    # -------------------
    Systray(**DEFAULT_CONFIGS.get("systray")),
    PAD,
    IconWidget("memory"),
    Memory(**get_config("memory")),
    PAD,
    IconWidget(get_vol_icon),
    Volume(**get_config("volume")),
    PAD,
    IconWidget("clock"),
    Clock(**get_config("clock")),
    PAD,
    IconWidget("date"),
    Clock(**get_config("date")),
    PAD,
]

# MAIN
groot_bar = bar.Bar(
    BAR_WIDGETS,
    size=40,
)
