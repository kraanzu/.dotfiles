from .colors import color
import psutil

from libqtile import bar

# from qtile_extras import bar
from qtile_extras.widget.decorations import RectDecoration
from qtile_extras.widget import (
    Spacer,
    Systray,
    GroupBox,
    Clock,
    Volume,
    Memory,
    Battery,
    NvidiaSensors,
)

from utils.colors import color

group_box_settings = {
    "borderwidth": 2,
    "margin": 2,
    "margin_y": 2,
    "active": color["light3"],
    "inactive": color["grey"],
    "disable_drag": True,
    "highlight_color": color["light2"],
    "block_highlight_text_color": color["dark1"],
    "highlight_method": "block",
    "inactive_highlight_method": "block",
    "this_current_screen_border": color["cyan2"],
    "foreground": color["light1"],
    "urgent_border": color["red"],
    "padding_y": 0,
}


def battery_status():
    battery = psutil.sensors_battery()
    if not battery:
        return ""
    if battery.power_plugged:
        return ""
    else:
        if battery.percent > 20:
            return ""
        else:
            return ""


def get_decor(c: str):
    return {
        "decorations": [
            RectDecoration(
                colour=color[c],
                radius=5,
                filled=True,
                padding_x=1.5,
                padding_y=4,
                line_width=1,
            )
        ],
    }


bottom_bar = bar.Bar(
    [
        GroupBox(
            fontsize=18,
            visible_groups=[
                "www",
                "vim",
                "sys",
                "doc",
                "chat",
                "mus",
                "xyz",
                "vid",
            ],
            **group_box_settings,
            decorations=[
                RectDecoration(
                    colour=color["dark2"],
                    radius=5,
                    filled=True,
                    padding_x=1,
                    padding_y=2,
                    line_width=1,
                )
            ],
            padding=6,
        ),
        Spacer(),
        *(
            [
                Battery(
                    format=" {char} {percent:2.0%} ",
                    charge_char="",
                    discharge_char="",
                    foreground=color["dark1"],
                    fontsize=16,
                    **get_decor("green"),
                ),
            ]
            if psutil.sensors_battery()
            else []
        ),
        Spacer(length=8),
        Volume(
            device="pulse",
            fmt="   {} ",
            foreground=color["dark1"],
            fontsize=16,
            **get_decor("magenta"),
        ),
        Spacer(length=8),
        NvidiaSensors(
            foreground=color["dark1"],
            fontsize=16,
            format="  {temp}°C ",
            **get_decor("red"),
        ),
        Spacer(length=8),
        Memory(
            fontsize=16,
            foreground=color["dark1"],
            fmt="  {} ",
            format="{MemUsed: .0f} {mm}",
            **get_decor("orange"),
        ),
        Spacer(length=8),
        Clock(
            fontsize=16,
            foreground=color["dark1"],
            format="  %H:%M ",
            **get_decor("green"),
        ),
        Spacer(length=8),
        Clock(
            fontsize=16,
            foreground=color["dark1"],
            format="   %A, %B %d ",
            **get_decor("yellow"),
        ),
        Spacer(length=8),
        Systray(
            icon_size=18,
            padding=6,
            foreground=color["grey"],
        ),
        Spacer(length=10),
    ],
    size=32,
    background="#00000000",
    margin=[2, 9, 0, 9],
)
