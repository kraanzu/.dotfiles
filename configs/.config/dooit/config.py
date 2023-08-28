from utils.dashboard import dashboard
from utils.statusbar import bar1
from utils.colors import *
from utils.funcs import *

bar = bar1


TODO = {
    "color_todos": False,
    "dim": grey,
    "highlight": white,
    "editing": cyan,
    "pointer": " ",
    "children_hint": colored(
        " ({done}..{total})", green
    ),  # vars: remaining, done, total
    # "children_hint": "[b magenta]({remaining}!)[/b magenta]",  # vars: remaining, done, total
    "due_icon": "󰃰 ",
    "effort_icon": "󱍀 ",
    "effort_color": yellow,
    "recurrence_icon": "󰕇 ",
    "recurrence_color": blue,
    "tags_icon": " ",
    "tags_seperator": "icon",  # icon, pipe, comma
    "tags_color": red,
    "completed_icon": "󰄲 ",
    "pending_icon": "󰡖 ",
    "overdue_icon": "󰀧 ",
    "urgency1_icon": "󰎤",
    "urgency2_icon": "󰎧",
    "urgency3_icon": "󰎪",
    "urgency4_icon": "󰎭",
}

WORKSPACE = {
    "dim": grey,
    "highlight": white,
    "editing": cyan,
    "pointer": " ",
    "children_hint": colored(" +{count}", "b " + green),  # "[{count}]", # vars: count
}
