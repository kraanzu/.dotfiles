from libqtile import bar
from utils.colors import color
from utils.default_widgets import *
from qtile_extras.widget import GroupBox

groups = GroupBox(
    this_current_screen_border=color[ACCENT2],
    this_screen_border=color[ACCENT2],
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

groot_bar = bar.Bar(
    [
        *widget_favicon,
        SEP1,
        groups,
        Spacer(),
        *widget_systray,
        *(widget_battery if psutil.sensors_battery() else []),
        *widget_memory,
        *widget_volume,
        *widget_clock,
        *widget_day,
        PAD,
    ],
    size=40,
)
