from pathlib import Path
from base_config import *

THEME_FILE_PATH = Path.home() / ".qtile_theme"

def apply_theme(theme: KzTheme):
    global screens, groups

    groups.extend(
        configure_workspaces(
            theme.workspaces,
            theme.extra_workspace,
        ),
    )

    wallpaper = f"{wallpaper_path}/{theme.wallpaper}.png"

    screens = [
        Screen(
            top=bar.Gap(1),
            bottom=theme.bar,
            left=bar.Gap(1),
            right=bar.Gap(1),
            wallpaper=wallpaper,
            wallpaper_mode="fill",
        )
    ]

def get_current_theme() -> KzTheme:
    if not THEME_FILE_PATH.exists():
        return KzTheme.theme_wave()

    with open(THEME_FILE_PATH, "r") as f:
        name =  f.read().strip()
        return KzTheme.from_name(name)

def main():
    theme = get_current_theme()
    apply_theme(theme)

main()
