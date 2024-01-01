#! /bin/bash
lxsession &
# xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'& # Caps_Lock is annoying
firefox -P kwork &
firefox -P kfun &
openrgb --profile purple &
redshift -O 5000K &
xfce4-clipman &
dunst -conf ~/.config/dunst/dunstrc &
for i in ~/.config/startup/*; do $i; done
# nitrogen --restore &
picom &
wezterm-mux-server --daemonize &
