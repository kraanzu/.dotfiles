import os
import subprocess
from libqtile.backend.base import Window

from libqtile.layout import MonadTall, Floating
from libqtile.widget import (
    AGroupBox,
    Spacer,
    Systray,
    GroupBox,
    WidgetBox,
    Sep,
    Clock,
    Volume,
    TextBox,
    Pomodoro,
)
from libqtile.config import DropDown, Key, ScratchPad, Screen, Group, Match
from libqtile import bar, hook
from libqtile.lazy import lazy
from libqtile.config import EzKey as Keybind
from libqtile.log_utils import logger

terminal = "alacritty"
home = os.path.expanduser("~")
scripts = home + "/.config/qtile/scripts"
myConfig = home + "/.config/qtile/config.py"
rofi_path = home + "/.config/rofi"


def scratchpad_connect() -> str:
    try:
        sessions = (
            subprocess.check_output("tmux list-sessions -F #S".split())
            .decode()
            .splitlines()
        )
        # logger.warning(sessions)
        if "scratch" in sessions:
            return "tmux -u attach scratch"
        else:
            return "tmux -u new -s scratch"
    except:
        return "tmux -u new -s scratch"


keys = [
    Keybind(
        "M-S-t", lazy.spawn(f"bash {rofi_path}/tmux"), desc="Launch rofi tmux-switcher"
    ),
    Keybind(
        "M-S-a",
        lazy.spawn(f"bash {rofi_path}/audio_changer"),
        desc="Launch rofi tmux-switcher",
    ),
    Keybind(
        "M-S-<Return>",
        lazy.spawn(f"bash {rofi_path}/window_list"),
        desc="Launch rofi app-launcer",
    ),
    Keybind("M-b", lazy.spawn("blueberry"), desc="Toogle bar visibility"),
    # LAUNCHING APPS with Ctrl + Alt + Key
    Keybind(
        "C-A-l",
        lazy.spawn(f"bash {scripts}/blur-lock.sh"),
        desc="launches i3-blur lock",
    ),
    Keybind(
        "M-<Insert>",
        lazy.spawn("flameshot gui"),
        desc="Screen_Shot",
    ),
    Keybind(
        "C-A-b",
        lazy.spawn("firefox"),
        desc="Launches Firefox Browser",
    ),
    Keybind(
        "C-A-e",
        lazy.spawn("evince"),
        desc="Launces Evince PDF Reader",
    ),
    Keybind(
        "M-<Return>",
        lazy.spawn(terminal),
        desc="Launches My Terminal with fish shell",
    ),
    # The essentials
    Keybind(
        "M-x",
        lazy.spawn(f"bash {rofi_path}/powermenu.sh"),
        desc="Shows rofi power_menu",
    ),
    Keybind(
        "M-S-<Up>",
        lazy.spawn("amixer -D pulse sset Master 2%+"),
        desc="Granuler control over volume",
    ),
    Keybind(
        "M-S-<Down>",
        lazy.spawn("amixer -D pulse sset Master 2%-"),
        desc="Granular control over volume",
    ),
    Keybind(
        "M-<Up>",
        lazy.spawn("amixer -D pulse sset Master 5%+"),
        desc="Increase Volume (pulse so that it automatically recognizes inserted devices)",
    ),
    Keybind(
        "M-<Down>",
        lazy.spawn("amixer -D pulse sset Master 5%-"),
        desc="Decrease Volume (pulse so that it automatically recognizes inserted devices)",
    ),
    # BASIC UTILITIES
    Keybind(
        "M-<Tab>",
        lazy.next_layout(),
        desc="Toggle through different layouts",
    ),
    Keybind("M-q", lazy.window.kill(), desc="Kill/Quit active window "),
    Keybind(
        "M-S-r",
        lazy.restart(),
        desc="Soft Reload",
    ),
    Keybind("M-S-q", lazy.shutdown(), desc="Shutdown Qtile"),
    # Window controls
    Keybind("M-<Right>", lazy.screen.next_group(), desc="Move to next Group"),
    Keybind("M-<Left>", lazy.screen.prev_group(), desc="Move to previous Group"),
    Keybind(
        "M-h",
        lazy.layout.grow(),
    ),
    Keybind(
        "M-l",
        lazy.layout.shrink(),
    ),
    Keybind("M-n", lazy.layout.normalize(), desc="normalize window size ratios"),
    Keybind(
        "M-m",
        lazy.layout.maximize(),
        desc="toggle window between minimum and maximum sizes",
    ),
    Keybind("M-S-f", lazy.window.toggle_floating(), desc="toggle floating"),
    Keybind("M-S-m", lazy.window.toggle_fullscreen(), desc="toggle fullscreen"),
    # Stack controls
    Keybind(
        "M-S-<space>",
        lazy.layout.rotate(),
        lazy.layout.flip(),
        desc="Switch which side main pane occupies (XmonadTall)",
    ),
    Keybind(
        "M-<space>",
        lazy.layout.next(),
        desc="Switch window focus to other pane(s) of stack",
    ),
    Keybind("M-s", lazy.group["scratchpad"].dropdown_toggle("term")),
]

workspaces = [
    {"name": "www", "key": "1", "matches": [Match(wm_class="firefox")]},
    {
        "name": "vim",
        "key": "2",
        "matches": [Match(wm_class="code")],
    },
    {
        "name": "sys",
        "key": "3",
    },
    {
        "name": "doc",
        "key": "4",
        "matches": [Match(wm_class="evince")],
    },
    {
        "name": "chat",
        "key": "5",
        "matches": [Match(wm_class="discord"), Match(wm_class="telegram-desktop")],
    },
    {
        "name": "mus",
        "key": "6",
    },
    {
        "name": "xyz",
        "key": "7",
    },
    {
        "name": "vid",
        "key": "8",
        "matches": [Match(wm_class="vlc")],
    },
]

groups = [
    ScratchPad(
        "scratchpad",
        [
            DropDown(
                "term", f"alacritty -e {scratchpad_connect()}", height=0.9, opacity=1
            )
        ],
    )
]

for workspace in workspaces:
    matches = workspace["matches"] if "matches" in workspace else None
    groups.append(Group(workspace["name"], matches=matches, layout="Monadtall"))
    keys.append(
        Keybind(
            f"M-{workspace['key']}",
            lazy.group[workspace["name"]].toscreen(toggle=True),
            desc="Focus this desktop",
        )
    )
    keys.append(
        Keybind(
            f"M-S-{workspace['key']}",
            lazy.window.togroup(workspace["name"]),
            desc="Move focused window to another group",
        )
    )


layout_theme = {
    "border_width": 0,
    "margin": 0,
    "border_focus": "#88c0d0",
    "border_normal": "#1D2330",
}

colors = [
    ["#2e3440", "#2e3440"],  # 0. background
    ["#d8dee9", "#d8dee9"],  # 1. foreground
    ["#3b4252", "#3b4252"],  # 2. background lighter
    ["#bf616a", "#bf616a"],  # 3. red
    ["#a3be8c", "#a3be8c"],  # 4. green
    ["#ebcb8b", "#ebcb8b"],  # 5. yellow
    ["#84A7C0", "#84A7C0"],  # 6. blue
    ["#b48ead", "#b48ead"],  # 7. magenta
    ["#88c0d0", "#88c0d0"],  # 8. cyan
    ["#e5e9f0", "#e5e9f0"],  # 9. white
    ["#4c566a", "#4c566a"],  # 10. grey
    ["#d08770", "#d08770"],  # 11. orange
    ["#8fbcbb", "#8fbcbb"],  # 12. super cyan
    ["#5e81ac", "#5e81ac"],  # 13. super blue
    ["#242831", "#242831"],  # 14. super dark background
]

accent = colors[12]

widget_defaults = dict(
    font="SauceCodePro Nerd Font", fontsize=30, padding=2, background=colors[0]
)
extension_defaults = widget_defaults.copy()

group_box_settings = {
    "borderwidth": 5,
    "margin": 4,
    "margin_y": 5,
    "active": colors[9],
    "inactive": colors[10],
    "disable_drag": True,
    "highlight_color": colors[2],
    "block_highlight_text_color": accent,
    "highlight_method": "line",
    "this_current_screen_border": colors[0],
    "this_screen_border": colors[2],
    "other_current_screen_border": colors[14],
    "other_screen_border": colors[14],
    "foreground": colors[1],
    "background": colors[0],
    "urgent_border": colors[3],
}


bottom_bar = bar.Bar(
    [
        GroupBox(
            fontsize=17,
            font="SauceCodePro Nerd Font Semi",
            fmt= "[{}]",
            visible_groups=[
                "www",
                "vim",
                "sys",
                "doc",
                "chat",
                "mus",
                "xyz",
                "vid",
            ],
            **group_box_settings,
        ),
        Spacer(),
        Clock(
            font="SauceCodePro Nerd Font Semi",
            fontsize=16,
            foreground=colors[12],
            format="  %A, %B %d ",
        ),
        Clock(
            font="SauceCodePro Nerd Font Semi",
            fontsize=16,
            foreground=colors[4],
            format="[ %H:%M ]  ",
        ),
        Sep(linewidth=3, size_percent=70),
        TextBox(text="  ", fontsize=16, foreground=colors[11]),
        Volume(device="pulse", fmt="{} ", fontsize=16),
        Sep(linewidth=3, size_percent=70),
        Systray(
            icon_size=18,
            padding=6,
            background=colors[0],
            foreground=colors[10],
        ),
        Spacer(length=10, background=colors[0]),
    ],
    size=30,
)

screens = [
    Screen(
        bottom=bottom_bar,
        top=bar.Gap(0),
        left=bar.Gap(0),
        right=bar.Gap(0),
    ),
]

dgroups_key_binder = None
dgroups_app_rules = []
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False

floating_layout = Floating(
    float_rules=[
        Match(wm_type="utility"),
        # Match(wm_type='notification'),
        Match(wm_type="toolbar"),
        Match(wm_type="splash"),
        Match(wm_type="dialog"),
        Match(wm_class="file_progress"),
        Match(wm_class="confirm"),
        Match(wm_class="dialog"),
        Match(wm_class="download"),
        Match(wm_class="error"),
        Match(wm_class="notification"),
        Match(wm_class="splash"),
        Match(wm_class="toolbar"),
        Match(wm_class="feh"),
        Match(wm_class="flameshot"),
        Match(func=lambda c: c.has_fixed_size()),
    ],
    border_width=3,
    border_focus="#88c0d0",
)

layouts = [
    MonadTall(**layout_theme),
]

auto_fullscreen = True
focus_on_window_activation = "smart"


@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser("~")
    subprocess.call([home + "/.config/qtile/autostart.sh"])


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
