from libqtile import bar
from qtile_extras.widget.decorations import RectDecoration
from utils.colors import color
from bars.base import *
from bars.base import Widget


COMMON_ATTRS = {
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
ICON_ATTRS = dict(foreground=color.blue)

widget = Widget(common_attrs=COMMON_ATTRS, icon_attrs=ICON_ATTRS)


# ---------------- ACTUAL BAR -----------------

bar_left = [
    widget.icon(" 󰌠 ", decorations={}),
    widget.line_separator(),
    widget.groupbox(decorations={}, padding=2),
]

bar_middle = [
    widget.spacer(),
]

bar_right = [
    widget.systray(decorations={}),
    widget.pad(),
    widget.icon(" 󰍛 "),
    widget.memory(),
    widget.pad(),
    widget.icon(" 󰓃 "),
    widget.volume(),
    widget.pad(),
    widget.icon(" 󰥔 "),
    widget.clock(),
    widget.pad(),
    widget.icon(" 󰃵 "),
    widget.date(),
    widget.pad(),
]

# MAIN
groot_bar = bar.Bar(
    bar_left + bar_middle + bar_right,
    size=40,
)
