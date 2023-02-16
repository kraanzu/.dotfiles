#! /bin/bash
lxsession &
feh --bg-fill ~/.config/qtile/wallpaper.png &
picom --experimental-backends --config ~/.config/picom/picom.conf &
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'& # Caps_Lock is annoying
redshift -O 5000K &
xfce4-clipman &
caffeine &
dunst -conf ~/.config/dunst/dunstrc &
for i in ~/.config/tmuxp/*; do .local/bin/tmuxp load -d $i; done
