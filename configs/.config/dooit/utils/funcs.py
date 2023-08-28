import os
from datetime import datetime


def colored(text, color):
    return f"[{color}]{text}[/{color}]"


def get_time() -> str:
    return f"{datetime.now().time().strftime('%H:%M')}"


def get_username():
    return os.getlogin()


def get_all_todos(manager):
    def fill(model):
        for workspace in model.workspaces:
            fill(workspace)

        for todo in model.todos:
            todos.append(todo)

    todos = []
    fill(manager)
    return todos


def get_total_completed(manager):
    todos = get_all_todos(manager)
    return sum(1 for t in todos if t.status == "COMPLETED")


def get_total_completed_today(manager):
    todos = get_all_todos(manager)
    return sum(
        1
        for t in todos
        if t.status == "COMPLETED" and t._due._value.date() == datetime.now().date()
    )


def get_total_overdue(manager):
    todos = get_all_todos(manager)
    return sum(1 for t in todos if t.status == "OVERDUE")


def get_total_pending(manager):
    todos = get_all_todos(manager)
    pending = 0
    for t in todos:
        if t.status == "PENDING":
            pending += t.due != "none"

    return pending


def get_pending_today(manager):
    todos = get_all_todos(manager)
    pending = 0
    for t in todos:
        if t.status == "PENDING":
            pending += t.due != "none" and t._due._value.date() == datetime.now().date()

    return pending
