from .colors import *
from rich.text import Text

legend = {"B": blue, "O": orange, "G": green, "M": magenta}
legend = {i + "]": j + "]" for i, j in legend.items()}

regex_style = {
    "U": red,
    "Y": grey,
    "6": blue,
    "a": blue,
    "#": yellow,
    "(?<=\()[^()\n]+(?=\))": white,
}


def change(s: str):
    for i, j in legend.items():
        s = s.replace(i, j)

    return s


def stylize(art):
    art = "\n".join([change(i) for i in art])
    art = Text.from_markup(art)
    for i, j in regex_style.items():
        art.highlight_regex(i, j)

    return art


art = [
    r"[B]       ___I__       [/B][M]                                      [/M]",
    r"[B]   .-''  .  ''-.    [/B][M]                                      [/M]",
    r"[B] .'  / . ' . \  '.  [/B][M]                                      [/M]",
    r"[B]/_.-..-..-..-..-._\ [/B][G] .----------------------------------. [/G]",
    r"[O]         #  _,,_    [/O][G]( Can you complete your tasks today? )[/G]",
    r"[O]         #/`    `\  [/O][G]/'----------------------------------' [/G]",
    r"[O]         / / 6 6\ \ [/O][M]                                      [/M]",
    r"[O]         \/\  Y /\/ [/O][M]       /\_/\                          [/M]",
    r"[O]         #/ `'U` \  [/O][M]      /a a  \               _         [/M]",
    r"[O]       , (  \   | \ [/O][M]     =\ Y  =/-~~~~~~-,_____/ /        [/M]",
    r"[O]       |\|\_/#  \_/ [/O][M]       '^--'          ______/         [/M]",
    r"[O]       \/'.  \  /'\ [/O][M]         \           /                [/M]",
    r"[O]        \    /=\  / [/O][M]         ||  |---'\  \                [/M]",
    r"[O]        /____)/____)[/O][M]        (_(__|   ((__|                [/M]",
]

art = stylize(art)
