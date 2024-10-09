from libqtile import bar
from qtile_extras.widget.decorations import RectDecoration
from qtile_extras.widget.groupbox2 import Box, GroupBoxRule
from utils.colors import color
from bars.base import *
from bars.base import Widget

test_deco = RectDecoration(
    colour=color.cyan,
    radius=7,
    filled=True,
    padding_y=6.5,
    group=True,
    border_width=5,
)

rect_decoration = RectDecoration(
    colour=color.dark3,
    radius=7,
    filled=True,
    padding_y=6.5,
    group=True,
    border_width=5,
)


COMMON_ATTRS = {
    "padding": 0,
    "decorations": [
        rect_decoration,
    ],
}

alt_decoration = dict(
    padding=3,
    foreground=color.dark2,
    decorations=[
        RectDecoration(
            colour=color.cyan,
            radius=7,
            filled=True,
            padding_y=6.5,
            group=True,
            border_width=5,
        ),
    ],
)

widget = Widget(common_attrs=COMMON_ATTRS)

# ----------------- EXTRA -----------------


def set_label_color(rule: GroupBoxRule, box: Box):
    if box.focused:
        rule.text_colour = color.cyan
    elif box.occupied:
        rule.text_colour = color.light1
    else:
        rule.text_colour = color.dark5

    return True


groupbox_config = dict(
    fontsize=27,
    rounded=True,
    this_current_screen_border=color.cyan,
    padding_x=6,
    padding_y=10,
    rules=[
        GroupBoxRule().when(func=set_label_color),
    ],
    decorations=[],
)


# ---------------- ACTUAL BAR -----------------

bar_left = [
    widget.pad(length=8),
    widget.pad(length=8, decorations=[rect_decoration]),
    widget.icon(" ", fontsize=20, foreground=color.cyan),
    widget.pad(length=4, decorations=[rect_decoration]),
    widget.pad(length=8),
    widget.icon(
        " 󱑀 ",
        decorations=[rect_decoration, test_deco],
        foreground=color.extra_dark,
    ),
    widget.clock(fmt=" {} "),
    widget.pad(length=8),
    widget.icon(
        " 󰃵 ",
        decorations=[rect_decoration, test_deco],
        foreground=color.extra_dark,
    ),
    widget.date(fmt=" {} "),
    widget.pad(length=6),
]

bar_middle = [
    widget.spacer(),
    widget.groupbox(**groupbox_config),
    widget.spacer(),
]

bar_right = [
    widget.widget_box(
        [
            widget.pad(length=6),
            widget.systray(decorations=[]),
            widget.pad(length=6),
        ],
        text_closed="  ",
        text_open="  ",
        close_button_location="right",
        foreground=color.cyan,
    ),
    widget.pad(length=6),
    widget.icon(
        " 󰕾 ",
        fontsize=20,
        decorations=[rect_decoration, test_deco],
        foreground=color.extra_dark,
    ),
    widget.volume(fmt=" {} "),
    widget.pad(length=6),
    widget.icon(
        " 󰍛 ",
        decorations=[rect_decoration, test_deco],
        foreground=color.extra_dark,
    ),
    widget.memory(fmt=" {} "),
    widget.pad(length=6),
]

three_bar = bar.Bar(
    bar_left + bar_middle + bar_right,
    size=40,
)
