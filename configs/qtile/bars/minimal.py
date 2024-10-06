from libqtile import bar
from qtile_extras.widget.decorations import RectDecoration, BorderDecoration
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
            padding_x=2,
            group=True,
            border_width=5,
        ),
        BorderDecoration(
            colour=color.dark4,
            padding_y=6,
            padding_x=2,
        ),
    ],
}

widget = Widget(common_attrs=COMMON_ATTRS)

# ----------------- EXTRA -----------------

groupbox_config = dict(
    fontsize=20,
    rounded=False,
    highlight_method="block",
    inactive=color.grey,
    this_current_screen_border=color.blue,
    hide_unused=True,
)


# ---------------- ACTUAL BAR -----------------

bar_left = [
    widget.pad(),
    widget.groupbox(**groupbox_config),
]

bar_middle = [
    widget.spacer(),
]

bar_right = []

minimal_bar = bar.Bar(
    bar_left + bar_middle + bar_right,
    size=40,
)
