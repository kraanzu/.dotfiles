from libqtile import bar
from qtile_extras.widget.decorations import RectDecoration
from utils.colors import Color, color
from bars.base import *

# --------------- GLOABL VALUES -----------------

ACCENT1 = "blue"
DARK = "dark3"
PAD = Spacer(length=8)
ICONS = {
    "favicon": "󰌠",
    "clock": "󰥔",
    "date": "󰃵",
    "speaker": "󰓃",
    "headphone": "󰋋",
    "memory": "󰍛",
}


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

spacer = Spacer()

systray = Systray()
memory = Memory(measure_mem="G", format=" RAM:  {MemUsed:.1f}<b>GB</b> ", **get_decor())
volume = PulseVolume(fmt=" VOL: {} ", **get_decor())
clock = Clock(format=" TIME: %H:%M ", **get_decor())
date = Clock(format=" %A, %B %d ", **get_decor())


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
    memory,
    volume,
    clock,
    date,
]

# MAIN
groot_bar = bar.Bar(
    BAR_WIDGETS,
    size=40,
)
