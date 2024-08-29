#! /bin/bash
lxsession &
# xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'& # Caps_Lock is annoying
openrgb --profile purple &
xfce4-clipman &
dunst -conf ~/.config/dunst/dunstrc &
for i in ~/.config/startup/*; do $i; done
# nitrogen --restore &
picom &
wezterm-mux-server --daemonize &
firefox&
discord&
