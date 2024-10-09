# from typing import Callable, List
# from libqtile.config import EzKey as Keybind
# from libqtile.lazy import lazy
# from libqtile.core.manager import Qtile
#
#
# exclude_groups = ["scratchpad", "0"]
#
#
# def to_group(qtile: Qtile, name: str):
#     if len(qtile.screens) == 1:
#         qtile.groups_map[name].toscreen(toggle=True)
#         return
#
#     current_group = qtile.current_group.name
#     can_toggle = not (current_group in exclude_groups or name in exclude_groups)
#
#     if name in exclude_groups:
#         qtile.focus_screen(1)
#         qtile.groups_map[name].toscreen(toggle=can_toggle)
#     else:
#         qtile.focus_screen(0)
#         qtile.groups_map[name].toscreen(toggle=can_toggle)
#
#
# def go_to_group(name: str) -> Callable:
#     def _inner(qtile: Qtile) -> None:
#         to_group(qtile, name)
#
#     return _inner
#
#
# def go_to_next_group():
#     def _inner(qtile: Qtile) -> None:
#         current_group = qtile.current_group.name
#         groups = [i.name for i in qtile.groups if i.name not in exclude_groups]
#         n = len(groups)
#         idx = groups.index(current_group)
#         idx = (idx + 1) % n
#         next_group = groups[idx]
#         to_group(qtile, next_group)
#
#     return _inner
#
#
# def go_to_prev_group():
#     def _inner(qtile: Qtile) -> None:
#         current_group = qtile.current_group.name
#         groups = [i.name for i in qtile.groups if i.name not in exclude_groups]
#         n = len(groups)
#         idx = groups.index(current_group)
#         idx = (idx + n - 1) % n
#         next_group = groups[idx]
#         to_group(qtile, next_group)
#
#     return _inner
#
#
# def create_workspace_bindings() -> List[Keybind]:
#     group_bindings = []
#     group_bindings.extend(
#         [
#             Keybind(
#                 "M-<Right>",
#                 lazy.screen.next_group(),
#                 desc="Move to next Group",
#             ),
#             Keybind(
#                 "M-<Left>",
#                 lazy.screen.prev_group(),
#                 desc="Move to previous Group",
#             ),
#         ]
#     )
#
#     return group_bindings
