from libqtile.backend.x11.window import Window
from libqtile.widget.windowtabs import *

from qtile_extras.widget import (
    TextBox,
    GroupBox,
    GroupBox2,
    GenPollText,
    Systray,
    StatusNotifier,
    Clock,
    Memory,
    Spacer,
    PulseVolume,
    WidgetBox,
    DoNotDisturb,
    WindowName,
    GithubNotifications,
)

class MaxWindows(WindowTabs):

    @staticmethod
    def get_window_name(w: Window) -> str:

        if w.get_wm_role() == "pop-up":
            name = w.name.split('-')[-1].strip()
        else:
            name = w.get_wm_class()
            if type(name) == list:
                name = name[-1]
            name = name.split(".")[-1].strip()

        return f" {name} "

    def update(self, *args):

        names = []
        layout_name = self.bar.screen.group.layout.name

        for w in self.bar.screen.group.windows:
            name = self.get_window_name(w)
            state = ""
            if w.maximized:
                state = "[] "
            elif w.minimized:
                state = "_ "
            elif w.floating:
                state = "V "

            task = pangocffi.markup_escape_text(state + name)

            if w is self.bar.screen.group.current_window:
                task = task.join(self.selected)

            names.append(task)

        if layout_name == "max":
            self.text = self.separator.join(names)
        else:
            self.text = ""

        self.bar.draw()


__all__ = [
    "TextBox",
    "GroupBox",
    "GroupBox2",
    "GenPollText",
    "Systray",
    "StatusNotifier",
    "Clock",
    "Memory",
    "Spacer",
    "PulseVolume",
    "WidgetBox",
    "DoNotDisturb",
    "WindowName",
    "WindowTabs",
    "MaxWindows",
    "GithubNotifications",
]
