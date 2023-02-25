from .funcs import *
from .colors import *


def tag(icon, text, color):
    return colored(f" {icon} ", "r " + color) + colored(f" {text} ", color)


def time():
    return tag("󰥔", get_time(), magenta)


def user():
    return tag("", get_username(), frost_green)


bar = {"C": [time, user]}
