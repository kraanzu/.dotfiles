from qtile_extras.widget import Spacer, Sep
from utils import color
from utils.functions import *
from .all_widget_imports import *


# ----------------- CONSTANTS ------------------

PAD = Spacer(length=4)
SEP1 = Sep(linewidth=2, size_percent=65, foreground=color.dark3)

ICON_WIDGET_DEFAULTS = {
    "fontsize": 23,
}

LOCATION = "Kolkata"
FAVICON = "ﲅ"
ACCENT1 = "blue"
ACCENT2 = "cyan"
DARK = "dark3"


# -------------- BASIC UTIL FUNCTIONS ---------------------


# ---------------- DEFAULTS -----------------

IGNORE_EXTRA_CONFIG = ["groupbox", "systray"]
DEFAULT_CONFIGS = dict()

DEFAULT_CONFIGS["systray"] = dict(
    icon_size=20,
    padding=2,
    foreground=color[DARK],
)

DEFAULT_CONFIGS["battery"] = dict(
    format="{percent:2.0%}",
)

DEFAULT_CONFIGS["wifi"] = dict(
    format="{essid} ",
    disconnected_message=" Disconnected ",
)

DEFAULT_CONFIGS["clock"] = dict(
    format="%H:%M",
)

DEFAULT_CONFIGS["date"] = dict(
    format="%A, %B %d",
)

DEFAULT_CONFIGS["memory"] = dict(
    measure_mem="G",
    format="{MemUsed:.1f}<b>GB</b>",
)

DEFAULT_CONFIGS["disk"] = dict(
    format="{uf} G",
    partition="/home",
    measure="G",
    visible_on_warn=False,
)

DEFAULT_CONFIGS["netspeed"] = dict(
    format="{down}↓ {up}↑",
)

DEFAULT_CONFIGS["weather"] = dict(
    location={LOCATION: LOCATION},
    format="%t",
)

DEFAULT_CONFIGS["cpu"] = dict(
    format="{load_percent}%",
)


DEFAULT_CONFIGS["groupbox"] = dict(
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
