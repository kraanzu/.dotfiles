import os
from typing import List


def run_rofi(options: List[str], prompt: str) -> str:
    themes = "\n".join([""] + options)
    rofi_cmd = f"echo -e '{themes}' | rofi -dmenu -p '{prompt}' -i"
    return os.popen(rofi_cmd).read().strip()
