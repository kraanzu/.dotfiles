from .colors import color
import psutil

from libqtile import bar

# from qtile_extras import bar
from qtile_extras.widget.decorations import RectDecoration
from qtile_extras.widget import (
    Spacer,
    Sep,
    Systray,
    GroupBox,
    Clock,
    Volume,
    Memory,
    Battery,
    TextBox,
    NvidiaSensors,
    Image,
)

from utils.colors import color
from utils


SPACE = Spacer(length=8)

group_box_settings = {
    "borderwidth": 2,
    "margin": 4,
    "active": color["light3"],
    "inactive": color["dark3"],
    "disable_drag": True,
    "highlight_color": color["light2"],
    "block_highlight_text_color": color["dark1"],
    "highlight_method": "text",
    "inactive_highlight_method": "block",
    "this_current_screen_border": color["cyan"],
    "foreground": color["light1"],
    "urgent_border": color["red"],
    "padding": 2,
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
        "foreground": color["dark2" if not "dark" in c else "light3"],
        "decorations": [
            RectDecoration(
                colour=color[c],
                radius=0,
                filled=True,
                padding_x=1,
                padding_y=7,
                line_width=1,
            )
        ],
    }


def IconWidget(icon: str, color: str) -> TextBox:
    return TextBox(
        font="SauceCodePro Nerd Font",
        fontsize=23,
        text=f" {icon} ",
        **get_decor(color),
    )


bottom_bar = bar.Bar(
    [
        TextBox(
            font="SauceCodePro Nerd Font",
            foreground=color["red"],
            fontsize=23,
            text="  ",
        ),
        Sep(linewidth=2, size_percent=65, foreground=color["dark3"]),
        SPACE,
        GroupBox(
            font="Noto Sans Bold",
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
                "EBQ",
            ],
            **group_box_settings,
        ),
        Spacer(),
        Systray(
            icon_size=18,
            padding=6,
            foreground=color["grey"],
        ),
        SPACE,
        *(
            [
                Battery(
                    format=" {char} {percent:2.0%} ",
                    charge_char="",
                    discharge_char="",
                    fontsize=16,
                    **get_decor("green"),
                ),
            ]
            if psutil.sensors_battery()
            else []
        ),
        SPACE,
        IconWidget("蓼", "magenta"),
        Volume(
            device="pulse",
            fmt=" {} ",
            **get_decor("dark3"),
        ),
        SPACE,
        IconWidget("", "orange"),
        Memory(
            fmt=" {} ",
            format="{MemUsed: .0f} {mm}",
            **get_decor("dark3"),
        ),
        SPACE,
        IconWidget("ﮌ", "green"),
        Clock(
            format=" %H:%M ",
            **get_decor("dark3"),
        ),
        SPACE,
        IconWidget("", "yellow"),
        Clock(
            format=" %A, %B %d ",
            **get_decor("dark3"),
        ),
        SPACE,
    ],
    size=40,
    background=color["dark2"][0],
    # margin=[5, 9, 0, 9],
)
