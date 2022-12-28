import psutil
from libqtile import bar

from utils.colors import color
from utils.default_widgets import *


bottom_bar = bar.Bar(
    [
        *widget_favicon,
        SEP1,
        widget_group_box,
        Spacer(),
        *widget_systray,
        *(widget_battery if psutil.sensors_battery() else []),
        *widget_volume,
        *widget_disk,
        *widget_clock,
        *widget_day,
        PAD,
    ],
    size=40,
    background=color["dark2"][0],
)
