from .colors import color
from libqtile import bar
from libqtile.widget import (
    AGroupBox,
    Spacer,
    Systray,
    GroupBox,
    WidgetBox,
    Sep,
    Clock,
    Volume,
    TextBox,
    Pomodoro,
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
    "background": color["dark1"],
    "urgent_border": color["red"],
}

bottom_bar = bar.Bar(
    [
        GroupBox(
            fontsize=17,
            font="SauceCodePro Nerd Font Semi",
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
        Clock(
            font="SauceCodePro Nerd Font Semi",
            fontsize=16,
            foreground=color["cyan2"],
            format="  %A, %B %d ",
        ),
        Clock(
            font="SauceCodePro Nerd Font Semi",
            fontsize=16,
            foreground=color["green"],
            format="[ %H:%M ]  ",
        ),
        Sep(linewidth=3, size_percent=70),
        TextBox(text="  ", fontsize=16, foreground=color["orange"]),
        Volume(device="pulse", fmt="{} ", fontsize=16),
        Sep(linewidth=3, size_percent=70),
        Systray(
            icon_size=18,
            padding=6,
            background=color["dark1"],
            foreground=color["grey"],
        ),
        Spacer(length=10, background=color["dark1"]),
    ],
    size=30,
)
