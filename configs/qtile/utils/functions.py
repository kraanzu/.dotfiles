
import psutil
import subprocess

def get_default_sink() -> str:
    sink = subprocess.check_output(["pactl", "get-default-sink"], text=True).strip("\n")
    return sink


def get_running_sink_form_factor():
    sink = get_default_sink()
    pactl_output = subprocess.check_output(["pactl", "list", "sinks"], text=True)
    lines = pactl_output.split("\n")
    in_running_sink = False
    form_factor = None
    for line in lines:
        if sink in line:
            in_running_sink = True
        elif in_running_sink and "device.form_factor" in line:
            form_factor = line.split("=")[1].strip()
            break
    return form_factor


def is_headphone_connected() -> bool:
    headphone_string = ["headphone", "headset"]
    form_factor = get_running_sink_form_factor() or ""
    return any(i in form_factor for i in headphone_string)


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

