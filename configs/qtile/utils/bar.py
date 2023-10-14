import psutil
from libqtile import bar

from utils.colors import color
from utils.default_widgets import *
from qtile_extras.widget import GroupBox

groupbox_base = dict(
    font="SauceCodePro Nerd Font",
    active=color["light3"],
    inactive=color["grey"],
    disable_drag=True,
    highlight_color=color["dark2"],
    block_highlight_text_color=color["red"],
    highlight_method="text",
    inactive_highlight_method="text",
    foreground=color["light1"],
    urgent_border=color["red"],
)

screen0_groups = GroupBox(
    visible_groups=workspaces + ["0"],
    this_current_screen_border=color[ACCENT2],
    this_screen_border=color[ACCENT2],
    other_current_screen_border=color["red"],
    other_screen_border=color["red"],
    fontsize=30,
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
        # *widget_wttr,
        *widget_memory,
        *widget_volume,
        *widget_clock,
        *widget_day,
        PAD,
    ],
    size=40,
)
