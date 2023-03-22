from typing import Callable, Dict, List
from libqtile.config import Match
from libqtile.config import EzKey as Keybind, Key
from libqtile.lazy import lazy
from libqtile.core.manager import Qtile


def go_to_group(name: str) -> Callable:
    def _inner(qtile: Qtile) -> None:
        if len(qtile.screens) == 1:
            qtile.groups_map[name].cmd_toscreen(toggle=True)
            return

        if name in "":
            qtile.focus_screen(1)
            qtile.groups_map[name].cmd_toscreen()
        else:
            qtile.focus_screen(0)
            qtile.groups_map[name].cmd_toscreen()

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

    return group_bindings
