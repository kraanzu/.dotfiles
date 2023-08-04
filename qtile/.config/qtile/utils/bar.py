import psutil
from libqtile import bar

from utils.colors import color
from utils.default_widgets import *
from qtile_extras.widget import GroupBox

groupbox_base = {
    "font": "SauceCodePro Nerd Font",
    # "visible_groups": [group_dict[i] for i in range(1, 10)],
    "borderwidth": 2,
    "margin": 4,
    "active": color["light3"],
    "inactive": color["grey"],
    "disable_drag": True,
    "highlight_color": color["light2"],
    "block_highlight_text_color": color["dark1"],
    "highlight_method": "text",
    "inactive_highlight_method": "block",
    "foreground": color["light1"],
    "urgent_border": color["red"],
    "padding": 2.5,
}

screen0_groups = GroupBox(
    visible_groups=workspaces,
    this_current_screen_border=color[ACCENT2],
    this_screen_border=color[ACCENT2],
    other_current_screen_border=color["magenta"],
    other_screen_border=color["magenta"],
    fontsize=30,
    **groupbox_base,
)

screen1_groups = GroupBox(
    visible_groups=["0"],
    this_current_screen_border=color[ACCENT2],
    this_screen_border=color[ACCENT2],
    other_current_screen_border=color["magenta"],
    other_screen_border=color["magenta"],
    fontsize=20,
    **groupbox_base,
)

screen0_bar = bar.Bar(
    [
        *widget_favicon,
        SEP1,
        screen0_groups,
        Spacer(),
        *widget_systray,
        *(widget_battery if psutil.sensors_battery() else []),
        *widget_memory,
        *widget_volume,
        *widget_disk,
        *widget_clock,
        *widget_day,
        PAD,
    ],
    size=40,
    background=color["dark2"][0],
)
