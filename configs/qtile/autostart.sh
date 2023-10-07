#! /bin/bash
lxsession &
# xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'& # Caps_Lock is annoying
redshift -O 5000K &
xfce4-clipman &
dunst -conf ~/.config/dunst/dunstrc &
for i in ~/.config/qtile/startup/*; do $i; done
nitrogen --restore &
picom &
wezterm-mux-server --daemonize &
