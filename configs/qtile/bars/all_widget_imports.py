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

        def get_split(name, separator):
            return name.split(separator)[-1].strip()

        if w.get_wm_role() == "pop-up":
            name = get_split(w.name, "-")
        else:
            name = w.get_wm_class()
            if type(name) == list:
                if name:
                    name = name[-1]
                    name = get_split(name, ".")
                else:
                    name = get_split(name, "-")

        return f" {name.title()} "

    def update(self, *args):

        names = []

        self.text = ""
        for w in self.bar.screen.group.windows:
            name = self.get_window_name(w)
            task = pangocffi.markup_escape_text(name)

            if w is self.bar.screen.group.current_window:
                task = task.join(self.selected)

            names.append(task)
            self.text = self.separator.join(names)

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
