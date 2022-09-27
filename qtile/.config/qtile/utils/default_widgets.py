from collections.abc import Callable
import psutil
import subprocess

from qtile_extras.widget.decorations import RectDecoration
from qtile_extras.widget import (
    DF,
    CPU,
    Bluetooth,
    Battery,
    Net,
    Spacer,
    Sep,
    Systray,
    GroupBox,
    Clock,
    Volume,
    Memory,
    Battery,
    TextBox,
    Wlan,
    NvidiaSensors,
    ThermalSensor,
    GenPollText,
    Wttr,
)

from utils.colors import color
from utils.groups import group_dict


# ----------------- CONSTANTS ------------------

PAD = Spacer(length=4)
SEP1 = Sep(linewidth=2, size_percent=65, foreground=color["dark3"])
SEP2 = TextBox(text="", fontsize=20, foreground=color["dark3"])

ICON_WIDGET_DEFAULTS = {
    "font": "SauceCodePro Nerd Font",
    "fontsize": 23,
}

LOCATION = "Kolkata"
FAVICON = "ﲅ"
ACCENT1 = "blue"
ACCENT2 = "cyan"
DARK = "dark3"

# -------------- BASIC UTIL FUNCTIONS ---------------------


def battery_status():
    battery = psutil.sensors_battery()
    if not battery:
        return ""
    if battery.power_plugged:
        return ""
    else:
        if battery.percent > 20:
            return ""
        else:
            return ""


def get_decor(c: str) -> dict:
    return {
        "fmt": " {} ",
        "foreground": color["dark2" if not "dark" in c else "light3"],
        "decorations": [
            RectDecoration(
                colour=color[c],
                radius=0,
                filled=True,
                padding_x=1,
                padding_y=7,
                line_width=1,
            )
        ],
    }


def padded(*arr: list):
    return [PAD] + list(arr) + [PAD]


def get_vol_icon() -> str:
    cmd = "pacmd list-sinks | awk '/index:|device.form_factor/ {print $0};'"
    sinks = subprocess.check_output(cmd, shell=True).decode().splitlines()
    for i in range(0, len(sinks), 2):
        if "*" in sinks[i]:
            return "" if "headphone" in sinks[i + 1] else "蓼"

    return "蓼"


def IconWidget(icon: str, color: str) -> TextBox:
    return TextBox(
        text=f"{icon}",
        **ICON_WIDGET_DEFAULTS,
        **get_decor(color),
    )


def IconWidgetPoll(func: Callable, color: str) -> GenPollText:
    return GenPollText(
        func=func,
        update_interval=2,
        **ICON_WIDGET_DEFAULTS,
        **get_decor(color),
    )


# ----------- WIDGETS ------------------

# LEFTMOST ICON ON THE BAR
widget_favicon = [
    TextBox(
        font="SauceCodePro Nerd Font",
        foreground=color[ACCENT1],
        fontsize=25,
        text=f" {FAVICON} ",
    ),
]

# WORKSPACE WIDGET
widget_group_box = GroupBox(
    font="SauceCodePro Nerd Font",
    fontsize=30,
    visible_groups=[group_dict[i] for i in range(1, 10)],
    borderwidth=2,
    margin=4,
    active=color["light3"],
    inactive=color["grey"],
    disable_drag=True,
    highlight_color=color["light2"],
    block_highlight_text_color=color["dark1"],
    highlight_method="text",
    inactive_highlight_method="block",
    this_current_screen_border=color[ACCENT2],
    foreground=color["light1"],
    urgent_border=color["red"],
    padding=2.5,
)

# SYSTRAY WIDGET
widget_systray = padded(
    Systray(
        icon_size=20,
        padding=2,
        foreground=color[DARK],
    ),
)

# BATTERY WIDGET
widget_battery = padded(
    IconWidget("", ACCENT1),
    Battery(
        format="{percent:2.0%}",
        fontsize=16,
        **get_decor(DARK),
    ),
)

# VOLUME WIDGET
widget_volume = padded(
    IconWidgetPoll(get_vol_icon, ACCENT1),
    Volume(
        device="pulse",
        **get_decor(DARK),
    ),
)

# WLAN WIDGET
widget_wifi = padded(
    IconWidget("", ACCENT1),
    Wlan(
        format="{essid} ",
        disconnected_message=" Disconnected ",
        **get_decor(DARK),
    ),
)

# CLOCK WIDGET
widget_clock = padded(
    IconWidget("ﮌ", ACCENT1),
    Clock(
        format=" %H:%M ",
        **get_decor(DARK),
    ),
)

# DAY/DATE WIDGET
widget_day = padded(
    IconWidget("", ACCENT1),
    Clock(
        format=" %A, %B %d ",
        **get_decor(DARK),
    ),
)

# MEMORY WIDGET
widget_memory = padded(
    IconWidget("", ACCENT1),
    Memory(
        measure_mem="M",
        format=" {MemUsed: .0f} {mm} ",
        **get_decor(DARK),
    ),
)

# DISK WIDGET
widget_disk = padded(
    IconWidget("", ACCENT1),
    DF(
        partition="/home",
        measure='G',
        format='{uf} G',
        visible_on_warn=False,
        **get_decor(DARK),
    ),
)

# BLUETOOTH WIDGET
widget_bluetooth = padded(
    IconWidget("", ACCENT1),
    Bluetooth(
        **get_decor(DARK),
    ),
)

# NETSPEED WIDGET
widget_net_speed = padded(
    IconWidget("龍", ACCENT1),
    Net(
        format="{down}↓ {up}↑",
        **get_decor(DARK),
    ),
)

# NVIDIA WIDGET
widget_nvidia_sensor = padded(
    IconWidget("", ACCENT1),
    NvidiaSensors(
        **get_decor(DARK),
    ),
)

# WEATHER WIDGET
widget_wttr = padded(
    Wttr(
        location={LOCATION: LOCATION},
        format="%c",
        fontsize=22,
        **get_decor(ACCENT1),
    ),
    Wttr(
        location={LOCATION: LOCATION},
        format="%t",
        **get_decor(DARK),
    ),
)

# THERMAL WIDGET
widget_thermal = padded(
    IconWidget("", ACCENT1),
    ThermalSensor(
        **get_decor(DARK),
    ),
)

# CPU WIDGET
widget_cpu = padded(
    IconWidget("", ACCENT1),
    CPU(
        format=" {load_percent}% ",
        **get_decor(DARK),
    ),
)
