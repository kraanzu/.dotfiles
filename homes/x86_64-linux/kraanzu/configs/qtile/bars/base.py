from libqtile import qtile
from collections import defaultdict
from qtile_extras.widget import Spacer, Sep
from utils.colors import color
from utils.functions import *
from vars import DARK, LOCATION
from .all_widget_imports import *


# ----------------- CONSTANTS ------------------

PAD = Spacer(length=4)
SEP1 = Sep(linewidth=2, size_percent=65, foreground=color.dark3)

ICON_WIDGET_DEFAULTS = {
    "fontsize": 23,
}

# ---------------- DEFAULTS -----------------

DEFAULT_CONFIGS = defaultdict(dict)

DEFAULT_CONFIGS["systray"] = dict(
    icon_size=20,
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
    format="%a, %b %d",
)

DEFAULT_CONFIGS["memory"] = dict(
    measure_mem="G",
    format="{MemUsed:.1f}<b>GB</b> ",
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

DEFAULT_CONFIGS["volume"] = dict(
    fmt="{} ",
)

DEFAULT_CONFIGS["do_not_disturb"] = dict(
    enabled_icon=" 󰂛 ",
    disabled_icon=" 󰂚 ",
)

DEFAULT_CONFIGS["window_name"] = dict(format="{class}")

DEFAULT_CONFIGS["github_notifications"] = dict(
    icon_size=18,
    update_interval=60,
    active_colour = color.cyan,
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


class Widget:
    def __init__(self, common_attrs={}, icon_attrs={}):
        self.common_attrs = common_attrs
        self.icon_attrs = icon_attrs

    def get_config(self, widget_name):
        return DEFAULT_CONFIGS[widget_name] | self.common_attrs

    def groupbox(self, **kwargs):
        vars = self.get_config("groupbox") | kwargs
        return GroupBox2(**vars)

    def memory(self, **kwargs):
        vars = self.get_config("memory") | kwargs
        return Memory(**vars)

    def volume(self, **kwargs):
        vars = self.get_config("volume") | kwargs
        return PulseVolume(**vars)

    def clock(self, **kwargs):
        vars = self.get_config("clock") | kwargs
        return Clock(**vars)

    def date(self, **kwargs):
        vars = self.get_config("date") | kwargs
        return Clock(**vars)

    def systray(self, **kwargs):
        vars = self.get_config("systray") | kwargs
        if qtile.core.name == "x11":
            return Systray(**vars)
        else:
            return StatusNotifier(**vars)

    def widget_box(self, widgets=[], **kwargs):
        vars = self.get_config("widget_box") | kwargs
        return WidgetBox(widgets=widgets, **vars)

    def do_not_disturb(self, **kwargs):
        vars = self.get_config("do_not_disturb") | kwargs
        return DoNotDisturb(**vars)

    def window_name(self, **kwargs):
        vars = self.get_config("window_name") | kwargs
        return WindowName(**vars)

    def github_notifications(self, **kwargs):
        vars = self.get_config("github_notifications") | kwargs
        return GithubNotifications(**vars)

    # --------------------------------------------------

    def icon(self, text, **kwargs):
        vars = ICON_WIDGET_DEFAULTS | self.common_attrs | self.icon_attrs | kwargs
        return TextBox(text=text, **vars)

    def pad(self, length=4, **kwargs):
        return Spacer(length=length, **kwargs)

    def spacer(self):
        return Spacer()

    def line_separator(self):
        return Sep(linewidth=2, size_percent=65, foreground=color.dark3)
