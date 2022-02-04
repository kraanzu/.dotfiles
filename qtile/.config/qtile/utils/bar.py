from .colors import color
from libqtile import bar
from qtile_extras.widget.decorations import RectDecoration
from qtile_extras.widget import (
    Spacer,
    Systray,
    GroupBox,
    Sep,
    Clock,
    Volume,
    TextBox,
)

group_box_settings = {
    "borderwidth": 5,
    "margin": 4,
    "margin_y": 5,
    "active": color["light3"],
    "inactive": color["grey"],
    "disable_drag": True,
    "highlight_color": color["light2"],
    "block_highlight_text_color": color["magenta"],
    "highlight_method": "line",
    "this_current_screen_border": color["dark1"],
    "this_screen_border": color["light2"],
    "other_current_screen_border": color["dark2"],
    "other_screen_border": color["dark2"],
    "foreground": color["light1"],
    "urgent_border": color["red"],
}

decor = {
    "decorations": [
        RectDecoration(
            colour=color["dark3"], radius=5, filled=True, padding_x=1.5, padding_y=5
        )
    ],
    "padding": 8,
}
bottom_bar = bar.Bar(
    [
        GroupBox(
            fontsize=17,
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
        ),
        Spacer(),
        Clock(fontsize=16, foreground=color["yellow"], format="  %A, %B %d", **decor),
        Spacer(length=8),
        Clock(
            fontsize=16,
            foreground=color["green"],
            format="  %H:%M ",
            **decor,
        ),
        Spacer(length=8),
        Volume(
            device="pulse",
            fmt="  {} ",
            foreground=color["cyan"],
            fontsize=16,
            **decor,
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
)
