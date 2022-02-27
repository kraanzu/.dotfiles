from .colors import color

from libqtile import bar

# from qtile_extras import bar
from qtile_extras.widget.decorations import RectDecoration
from qtile_extras.widget import (
    Spacer,
    Systray,
    GroupBox,
    Clock,
    Volume,
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
    "this_current_screen_border": color["green"],
    "foreground": color["light1"],
    "urgent_border": color["red"],
    "padding_y": 0,
}


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
        # "padding": 8,
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
            padding=6
        ),
        Spacer(),
        Volume(
            device="pulse",
            fmt="   {} ",
            foreground=color["dark1"],
            fontsize=16,
            **get_decor("magenta"),
        ),
        Spacer(length=8),
        Clock(
            fontsize=16,
            foreground=color["dark1"],
            format="  %H:%M ",
            **get_decor("red"),
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
    background = "#00000000",
    margin=[2, 9, 0, 9],
)
