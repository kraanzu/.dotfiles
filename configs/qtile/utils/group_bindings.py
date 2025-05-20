from typing import List
from libqtile.config import EzKey as Keybind
from libqtile.lazy import lazy

def create_workspace_bindings(total_groups: int = 6) -> List[Keybind]:
    group_bindings = []
    for index in range(1, total_groups + 1):
        index = str(index)

        group_bindings.extend(
            [
                Keybind(
                    f"M-{index}",
                    lazy.group[str(index)].toscreen(toggle  = True),
                    desc="Focus this desktop",
                ),
                Keybind(
                    f"M-S-{index}",
                    lazy.window.togroup(str(index)),
                    desc="Move focused window to another group",
                ),
            ]
        )
    group_bindings.extend(
        [
            Keybind(
                "M-<Right>",
                lazy.screen.next_group(),
                desc="Move to next Group",
            ),
            Keybind(
                "M-<Left>",
                lazy.screen.prev_group(),
                desc="Move to previous Group",
            ),
        ]
    )

    return group_bindings
