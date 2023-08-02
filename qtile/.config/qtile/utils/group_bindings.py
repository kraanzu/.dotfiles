from typing import Callable, Dict, List
from libqtile.config import Match
from libqtile.config import EzKey as Keybind
from libqtile.lazy import lazy
from libqtile.core.manager import Qtile


def to_group(qtile: Qtile, name: str):
    if len(qtile.screens) == 1:
        qtile.groups_map[name].cmd_toscreen(toggle=True)
        return

    exclude_group = ""
    current_group = qtile.current_group.name

    if name in exclude_group:
        qtile.focus_screen(1)
        qtile.groups_map[name].cmd_toscreen(toggle=current_group in exclude_group)
    else:
        qtile.focus_screen(0)
        qtile.groups_map[name].cmd_toscreen(toggle=current_group not in exclude_group)


def go_to_group(name: str) -> Callable:
    def _inner(qtile: Qtile) -> None:
        to_group(qtile, name)

    return _inner


def go_to_next_group():
    def _inner(qtile: Qtile) -> None:
        current_group = qtile.current_group.name
        groups = [i.name for i in qtile.groups if i.name != "scratchpad"]
        n = len(groups)
        idx = groups.index(current_group)
        idx = (idx + 1) % n
        next_group = groups[idx]
        to_group(qtile, next_group)

    return _inner


def go_to_prev_group():
    def _inner(qtile: Qtile) -> None:
        current_group = qtile.current_group.name
        groups = [i.name for i in qtile.groups if i.name != "scratchpad"]
        n = len(groups)
        idx = groups.index(current_group)
        idx = (idx + n - 1) % n
        next_group = groups[idx]
        to_group(qtile, next_group)

    return _inner


def create_workspace_bindings(
    groups: Dict[str, Dict[str, str | Match]]
) -> List[Keybind]:
    group_bindings = []
    for workspace, config in groups.items():
        group_bindings.extend(
            [
                Keybind(
                    f"M-{config['key']}",
                    lazy.function(go_to_group(workspace)),
                    # lazy.group[workspace].toscreen(toggle=True),
                    desc="Focus this desktop",
                ),
                Keybind(
                    f"M-S-{config['key']}",
                    lazy.window.togroup(workspace),
                    desc="Move focused window to another group",
                ),
            ]
        )
    group_bindings.extend(
        [
            Keybind(
                "M-<Right>",
                lazy.function((go_to_next_group())),
                # lazy.screen.next_group(),
                desc="Move to next Group",
            ),
            Keybind(
                "M-<Left>",
                lazy.function((go_to_prev_group())),
                # lazy.screen.prev_group(),
                desc="Move to previous Group",
            ),
        ]
    )

    return group_bindings
