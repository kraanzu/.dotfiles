from libqtile import bar
from qtile_extras.widget.decorations import RectDecoration
from utils.colors import Color, color
from bars.base import *

PAD = Spacer(length=8)

# --------------- GENERAL UTILS -----------------


def get_decor(fg=Color.blue, bg=Color.dark1) -> dict:
    return {
        "foreground": fg,
        "decorations": [
            RectDecoration(
                colour=bg,
                radius=5,
                filled=True,
                padding_x=1,
                padding_y=7,
            ),
        ],
    }


favicon = TextBox(text=" 󰌠 ", fontsize=23, foreground=color.blue)
groupbox = GroupBox(
    this_current_screen_border=color.blue,
    this_screen_border=color.blue,
    active=color.light3,
    inactive=color.grey,
    highlight_color=color.dark2,
    highlight_method="text",
    inactive_highlight_method="text",
    foreground=color.light1,
    urgent_border=color.red,
    disable_drag=True,
    fontsize=30,
)

decoration_group = {
    "fontweight": "bold",
    "decorations": [
        RectDecoration(
            colour=color.dark3,
            radius=3,
            filled=True,
            padding_y=6.5,
            padding_x=2,
            group=True,
        )
    ],
    "padding": 3,
}

spacer = Spacer()

systray = Systray()

memory_icon = TextBox(
    text=" 󰍛 ", fontsize=23, foreground=color.blue, **decoration_group
)
memory = Memory(measure_mem="G", format="{MemUsed:.1f}<b>GB</b> ", **decoration_group)

volume_icon = TextBox(
    text=" 󰓃 ", fontsize=23, foreground=color.blue, **decoration_group
)
volume = PulseVolume(fmt="{} ", **decoration_group)


clock_icon = TextBox(text=" 󰥔 ", fontsize=23, foreground=color.blue, **decoration_group)
clock = Clock(format="%H:%M ", **decoration_group)

date_icon = TextBox(text=" 󰃵 ", fontsize=23, foreground=color.blue, **decoration_group)
date = Clock(format="%A, %B %d ", **decoration_group)


# ---------------- ACTUAL BAR -----------------

BAR_WIDGETS = [
    # left
    favicon,
    SEP1,
    groupbox,
    # middle
    spacer,
    # right
    systray,
    PAD,
    memory_icon,
    memory,
    PAD,
    volume_icon,
    volume,
    PAD,
    clock_icon,
    clock,
    PAD,
    date_icon,
    date,
    PAD,
]

# MAIN
groot_bar = bar.Bar(
    BAR_WIDGETS,
    size=40,
)
