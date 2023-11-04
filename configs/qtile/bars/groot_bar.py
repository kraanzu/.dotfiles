from collections.abc import Callable
from qtile_extras.widget.decorations import RectDecoration
from utils.colors import color
from bars.base import *
from libqtile import bar
from qtile_extras.widget import (
    TextBox,
    GroupBox,
    GenPollText,
    Systray,
    Clock,
    Memory,
    Volume,
    Spacer,
)

# GLOBAL VALUES

ACCENT1 = "blue"
DARK = "dark3"
ICONS = {
    "favicon": "ﲅ",
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
def IconWidget(icon: str, color: str) -> TextBox:
    icon = ICONS[icon]
    return TextBox(
        text=f"{icon}",
        **ICON_WIDGET_DEFAULTS,
        **get_decor(color),
    )


def IconWidgetPoll(func: Callable, color: str) -> GenPollText:
    return GenPollText(
        func=func,
        update_interval=2,
        **ICON_WIDGET_DEFAULTS,
        **get_decor(color),
    )


def get_vol_icon() -> str:
    icon = "headphone" if is_headphone_connected() else "speaker"
    return ICONS.get(icon, "?")


def get_icon(icon: str, color) -> TextBox:
    return IconWidget(icon, color)


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

widget_favicon = [
    TextBox(
        foreground=color["blue"],
        fontsize=23,
        text=f" {ICONS['favicon']} ",
    )
]
widget_systray = padded(
    Systray(**DEFAULT_CONFIGS.get("systray")),
)
widget_clock = padded(
    IconWidget("clock", ACCENT1),
    Clock(**get_config("clock")),
)
widget_date = padded(
    IconWidget("date", ACCENT1),
    Clock(**get_config("date")),
)
widget_memory = padded(
    IconWidget("memory", ACCENT1),
    Memory(**get_config("memory")),
)
widget_volume = padded(
    IconWidgetPoll(get_vol_icon, ACCENT1),
    Volume(**get_config("volume")),
)

BAR_WIDGETS = [
    *widget_favicon,
    SEP1,
    GroupBox(**groupbox_config),
    Spacer(),
    *widget_systray,
    *widget_memory,
    *widget_volume,
    *widget_clock,
    *widget_date,
]

# MAIN
groot_bar = bar.Bar(
    BAR_WIDGETS,
    size=40,
)
