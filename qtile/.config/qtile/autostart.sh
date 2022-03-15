#! /bin/bash
feh --bg-fill ~/.config/qtile/wallpaper.png &
lxsession &
picom --config ~/.config/picom/picom.conf &
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'& # Caps_Lock is annoying
nm-applet &
redshift -O 5000K &
xfce4-clipman &
bash ~/.config/qtile/scripts/monitor.sh &
bash ~/.config/qtile/scripts/battery.sh &
dunst -conf ~/.config/dunst/dunstrc &
