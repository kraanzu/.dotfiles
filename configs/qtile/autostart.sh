lxsession &
openrgb --profile purple &
xfce4-clipman &
dunst -conf ~/.config/dunst/dunstrc &
for i in ~/.config/startup/*; do bash $i; done
wezterm-mux-server --daemonize &
firefox&
discord&
