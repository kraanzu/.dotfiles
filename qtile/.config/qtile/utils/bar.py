from .colors import color

# from libqtile import bar
from qtile_extras import bar
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
    "margin_y": 5,
    "active": color["light3"],
    "inactive": color["grey"],
    "disable_drag": True,
    "highlight_color": color["light2"],
    "block_highlight_text_color": color["dark1"],
    "highlight_method": "text",
    "this_current_screen_border": color["cyan2"],
    "other_current_screen_border": color["dark2"],
    "other_screen_border": color["dark2"],
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
        "padding": 8,
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
            # **get_decor("dark1"),
            padding_x=6,
        ),
        Spacer(),
        Clock(
            fontsize=16,
            foreground=color["dark1"],
            format="  %A, %B %d",
            **get_decor("yellow"),
        ),
        Spacer(length=8),
        Clock(
            fontsize=16,
            foreground=color["dark1"],
            format="  %H:%M ",
            **get_decor("green"),
        ),
        Spacer(length=8),
        Volume(
            device="pulse",
            fmt="  {} ",
            foreground=color["dark1"],
            fontsize=16,
            **get_decor("magenta"),
        ),
        # Sep(linewidth=3, size_percent=70),
        Spacer(length=8),
        Systray(
            icon_size=18,
            padding=6,
            foreground=color["grey"],
        ),
        Spacer(length=10),
    ],
    size=32,
    # background = "#00000000"
    margin=[0, 0, 2, 0],
)
