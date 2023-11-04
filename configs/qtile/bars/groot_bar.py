from libqtile import bar
from utils.colors import color
from widgets.groot import *
from qtile_extras.widget import GroupBox

groups = GroupBox(
    this_current_screen_border=color[ACCENT2],
    this_screen_border=color[ACCENT2],
    active=color["light3"],
    inactive=color["grey"],
    highlight_color=color["dark2"],
    highlight_method="text",
    inactive_highlight_method="text",
    foreground=color["light1"],
    urgent_border=color["red"],
    disable_drag=True,
    fontsize=30,
)

groot_bar = bar.Bar(
    bar_widgets,
    size=40,
)
