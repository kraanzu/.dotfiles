from libqtile import bar
from qtile_extras.widget.decorations import RectDecoration, BorderDecoration
from qtile_extras.widget.groupbox2 import Box, GroupBoxRule
from utils.colors import color
from bars.base import *
from bars.base import Widget

COMMON_ATTRS = {
    "padding": 0,
    "decorations": [
        RectDecoration(
            colour=color.dark2,
            radius=1,
            filled=True,
            padding_y=6.5,
            group=True,
            border_width=5,
        ),
        BorderDecoration(
            border_width=3,
            colour=color.dark4,
            padding_y=6,
            group=True,
        ),
    ],
}

dnd_decoration = dict(
    padding=3,
    foreground=color.dark2,
    decorations=[
        RectDecoration(
            colour=color.cyan,
            radius=1,
            filled=True,
            padding_y=6.5,
            group=True,
            border_width=5,
        ),
    ],
)

widget = Widget(common_attrs=COMMON_ATTRS)

# ----------------- EXTRA -----------------


def draw_main_box(box: Box):
    w = 20
    h = 25
    x = (box.size - w) // 2
    y = (box.bar.height - h) // 2
    box.drawer.ctx.rectangle(x, y, w, h)
    box.drawer.set_source_rgb(color.cyan)
    box.drawer.ctx.fill()


def set_label_color(rule: GroupBoxRule, box: Box):
    if box.focused:
        rule.text_colour = color.dark1
    elif box.occupied:
        rule.text_colour = color.light1
    else:
        rule.text_colour = color.dark5

    return True


groupbox_config = dict(
    fontsize=20,
    rounded=False,
    this_current_screen_border=color.cyan,
    padding_x=6,
    padding_y=10,
    rules=[
        GroupBoxRule(custom_draw=draw_main_box).when(focused=True),
        GroupBoxRule().when(func=set_label_color),
    ],
)


# ---------------- ACTUAL BAR -----------------

bar_left = [
    widget.pad(length=6),
    widget.pad(**COMMON_ATTRS),
    widget.groupbox(**groupbox_config),
    widget.pad(**COMMON_ATTRS),
]

bar_middle = [
    widget.spacer(),
]

bar_right = [
    widget.widget_box(
        [
            widget.pad(length=6),
            widget.systray(decorations=[]),
            widget.pad(length=6),
        ],
        text_closed="  ",
        text_open="  ",
        close_button_location="right",
    ),
    widget.pad(length=6),
    widget.volume(fmt=" 󰕾 {} "),
    widget.pad(length=8),
    widget.clock(fmt=" {} "),
    widget.pad(length=8),
    widget.date(fmt=" {} "),
    widget.pad(length=6),
    widget.do_not_disturb(**dnd_decoration),
    widget.pad(length=6),
]

minimal_bar = bar.Bar(
    bar_left + bar_middle + bar_right,
    size=40,
)
