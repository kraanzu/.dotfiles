#! /bin/bash
lxsession &
# feh --bg-fill ~/.config/qtile/wallpaper.png &
# xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'& # Caps_Lock is annoying
redshift -O 5000K &
xfce4-clipman &
dunst -conf ~/.config/dunst/dunstrc &
for i in ~/.config/qtile/startup/*; do $i; done
nitrogen --restore &
for i in ~/.config/tmuxp/*; do .local/bin/tmuxp load -d $i; done
picom --experimental-backends &
