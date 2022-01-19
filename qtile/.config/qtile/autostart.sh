#! /bin/bash
lxsession &
picom --config ~/.config/picom/picom.conf &
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'& # Caps_Lock is annoying
feh --bg-center ~/.config/qtile/wallpaper.png &
nm-applet &
redshift -O 5000K &
xfce4-clipman &
bash ~/.config/qtile/scripts/monitor.sh &
bash ~/.config/qtile/scripts/battery.sh &
dunst -conf ~/.config/dunst/dunstrc &
