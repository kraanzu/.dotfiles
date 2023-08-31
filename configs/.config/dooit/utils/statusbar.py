from .funcs import *
from .colors import *

status_icons = {
    "NORMAL": ["󰆋", blue],
    "INSERT": ["", grey],
    "DATE": ["󰃰", orange],
    "SEARCH": ["", green],
    "SORT": ["", magenta],
    "K PENDING": ["󰌆", yellow],
}


def tag(icon, text, color):
    return colored(f" {icon} ", "r " + color) + colored(f" {text} ", color)


def time():
    return tag("󰥔", get_time(), magenta)


def user():
    return tag("", get_username(), frost_green)


def get_tasks_today(manager):
    pending = get_pending_today(manager)
    completed = get_total_completed_today(manager)
    overdue = get_total_overdue(manager)
    return (
        colored(" Today ", "r " + blue)
        + colored(f" 󱍧 {completed}", green)
        + colored(f" 󱍥 {pending}", yellow)
        + colored(f" 󱍮 {overdue}", red)
    )


def status(status):
    icon, color = status_icons[status]
    return colored(f" {icon} {status} ", "r " + color)


bar1 = {"A": [(status, 0.01)], "C": [get_tasks_today, " ", time]}
