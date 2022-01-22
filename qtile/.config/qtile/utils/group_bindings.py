from typing import Dict, List
from libqtile.config import Match
from libqtile.config import EzKey as Keybind
from libqtile.lazy import lazy

def create_workspace_bindings(groups: Dict[str, Dict[str, str | Match]]) -> List[Keybind]:
    group_bindings = []
    for workspace, config in groups.items():
        group_bindings.extend(
            [
                Keybind(
                    f"M-{config['key']}",
                    lazy.group[workspace].toscreen(toggle=True),
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
