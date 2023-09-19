from .ascii import art
from .colors import *
from .funcs import *
from rich.text import Text
from datetime import datetime
from dooit.api import manager


def now():
    return datetime.now()


SEP = Text("─" * 60, "d " + grey)
NL = " \n"
day = Text(now().strftime(" %A, %b %d"), style="b " + yellow)
stats = [
    colored(f"[b]󱫌[/b] Tasks Overdue : {get_total_overdue(manager)} ", red),
    colored(f"[b]󰙏[/b] Tasks Pending : {get_total_pending(manager)} ", yellow),
    colored(f"[b]󱓞[/b] Tasks Done    : {get_total_completed(manager)} ", green),
]
dashboard = [art, SEP, day, NL, stats]
