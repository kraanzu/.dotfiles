from libqtile import bar
from qtile_extras.widget.decorations import RectDecoration
from utils.colors import color
from bars.base import *
from bars.base import widget

PAD = Spacer(length=8)

# --------------- GENERAL UTILS -----------------

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
    "padding": 0,
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
}

spacer = Spacer()

systray = Systray()

memory_icon = widget.icon(" 󰍛 ", foreground=color.blue,  **decoration_group)
memory = widget.memory(**decoration_group)

volume_icon = TextBox(
    text=" 󰓃 ", fontsize=23, foreground=color.blue, **decoration_group
)
volume = widget.volume(**decoration_group)


clock_icon = TextBox(text=" 󰥔 ", fontsize=23, foreground=color.blue, **decoration_group)
clock = widget.clock(**decoration_group)

date_icon = TextBox(text=" 󰃵 ", fontsize=23, foreground=color.blue, **decoration_group)
date = widget.date(**decoration_group)


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
