from .ascii import art
from .colors import *
from .funcs import *
from rich.text import Text
from datetime import datetime


def now():
    return datetime.now()


SEP = Text("─" * 60, "d " + grey)
NL = " \n"
day = Text(now().strftime(" %A, %b %d"), style="b " + yellow)
stats = [
    colored(f"[b]󱫌[/b] Tasks Overdue : {get_total_overdue()} ", red),
    colored(f"[b]󰙏[/b] Tasks Pending : {get_pending_today()} ", yellow),
    colored(f"[b]󱓞[/b] Tasks Done    : {get_total_completed()} ", green),
]
dashboard = [art, SEP, day, NL, stats]
