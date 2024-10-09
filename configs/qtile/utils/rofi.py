import subprocess
from typing import List


def run_rofi(options: List[str], prompt: str) -> str:
    themes = "\n".join(options)
    process = subprocess.Popen(
        ["rofi", "-dmenu", "-p", prompt, "-i"],
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
    )
    stdout, _ = process.communicate(input=themes.encode())
    selection = stdout.decode().strip()

    if selection:
        return selection

    return ""
