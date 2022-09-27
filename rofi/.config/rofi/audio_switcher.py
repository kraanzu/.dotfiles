from os import system
from subprocess import check_output
from rofi import nord_rofi


CMD = "pacmd list-sinks | awk '/index:|description/ {print $0};'"


def get_rest(s: str, d: str):
    i = s.rindex(d) + 1
    return s[i:].strip().strip('"')


def get_details(arr: list[str]):
    return {
        get_rest(arr[1], "=") + (" *" if "*" in arr[0] else ""): get_rest(arr[0], ":"),
    }


def process(arr):
    devices = dict()

    for i in range(0, len(arr), 3):
        devices |= get_details(arr[i : i + 3])

    return devices


def set_sink(index):
    system(f"pacmd set-default-sink {index}")


out = check_output(CMD, shell=True).decode().splitlines()
devices = process(out)

res, code = nord_rofi.run(
    menu=reversed(devices.keys()),
    prefix="AUDIO",
)

if code == -1:
    print("Aborted")
else:
    set_sink(devices[res])
