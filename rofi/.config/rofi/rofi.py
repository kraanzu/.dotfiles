from collections.abc import Iterable
from typing import Optional
from subprocess import check_output

MAX_LINES = 5


class Rofi:
    def __init__(self, theme: Optional[str] = None) -> None:
        self.cmd = "rofi -dmenu"
        if theme:
            self.cmd += f" -theme {theme}"

    def _run_cmd(self, cmd: str) -> tuple[str, int]:
        try:
            res = check_output(cmd, shell=True).decode().strip("\n")
            return res, 0
        except:
            return "", -1

    def run(self, menu: Iterable[str], prefix: Optional[str] = None) -> tuple[str, int]:

        menu = list(menu)
        out = "\n".join([item for item in menu])
        cmd = f'echo -e "{out}" | {self.cmd} -l {min(MAX_LINES,len(menu))}'

        if prefix:
            cmd += f" -p {prefix}: "

        return self._run_cmd(cmd)


nord_rofi = Rofi("~/.config/rofi/style.rasi")
