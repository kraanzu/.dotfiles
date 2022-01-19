
dir="$HOME/.config/rofi/style.rasi"
rofi_command="rofi -theme ${dir}"

# Options
shutdown="  shutdown"
reboot="  reboot"
lock="  lock"
suspend="  hibernate"
logout="  logout"

options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"
chosen="$(echo -e "$options" | $rofi_command -dmenu -p "SELECT: ")"

case $chosen in
    $shutdown)
		systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $lock)
        loginctl lock-session ${XDG_SESSION_ID-}
        ;;
    $suspend)
        systemctl suspend
        ;;
    $logout)
        loginctl terminate-session ${XDG_SESSION_ID-}
        ;;
esac
