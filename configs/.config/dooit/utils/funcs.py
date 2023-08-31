import os
from datetime import datetime
from typing import List
from dooit.api import Manager, Todo


def colored(text: str, color: str) -> str:
    return f"[{color}]{text}[/{color}]"


def get_time() -> str:
    return f"{datetime.now().time().strftime('%H:%M')}"


def get_username() -> str:
    return os.getlogin()


def get_all_todos(manager: Manager) -> List[Todo]:
    def fill(model):
        for workspace in model.workspaces:
            fill(workspace)

        for todo in model.todos:
            todos.append(todo)

    todos = []
    fill(manager)
    return todos


def get_total_completed(manager) -> int:
    todos = get_all_todos(manager)
    return sum(t.is_completed() for t in todos)


def get_total_completed_today(manager) -> int:
    todos = get_all_todos(manager)
    return sum(t.is_completed() and t.is_due_today() for t in todos)


def get_total_overdue(manager) -> int:
    todos = get_all_todos(manager)
    return sum(t.is_overdue() for t in todos)


def get_total_pending(manager) -> int:
    todos = get_all_todos(manager)
    return sum(t.is_pending() and t.has_due_date() for t in todos)


def get_pending_today(manager) -> int:
    todos = get_all_todos(manager)
    return sum(t.is_pending() and t.is_due_today() for t in todos)
