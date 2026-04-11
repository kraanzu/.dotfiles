#!/usr/bin/env bash

SOCKET="$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock"
hidden='{"text": "", "class": "hidden"}'
last=""
zathura_focused=false

emit() {
    if [[ "$1" != "$last" ]]; then
        echo "$1"
        last="$1"
    fi
}

get_page() {
    local dest current total
    dest=$(busctl --user list 2>/dev/null | awk '/org\.pwmt\.zathura\.PID/ {print $1; exit}')
    [[ -z "$dest" ]] && return 1

    current=$(busctl --user get-property "$dest" /org/pwmt/zathura org.pwmt.zathura pagenumber 2>/dev/null | awk '{print $2}')
    total=$(busctl --user get-property "$dest" /org/pwmt/zathura org.pwmt.zathura numberofpages 2>/dev/null | awk '{print $2}')
    [[ -z "$current" || -z "$total" ]] && return 1

    emit "{\"text\": \"pg: $((current + 1))/${total}\", \"class\": \"visible\"}"
}

handle_focus() {
    local active
    active=$(hyprctl activewindow -j 2>/dev/null | jq -r '.class')
    if [[ "$active" == "org.pwmt.zathura" ]]; then
        zathura_focused=true
        get_page || emit "$hidden"
    else
        zathura_focused=false
        emit "$hidden"
    fi
}

handle_focus

while true; do
    if $zathura_focused; then
        # Short timeout so we can poll page changes while focused
        if read -r -t 1 event; then
            [[ "$event" == activewindow* ]] && handle_focus
        else
            get_page || emit "$hidden"
        fi
    else
        # Block until next Hyprland event — zero CPU when idle
        read -r event
        [[ "$event" == activewindow* ]] && handle_focus
    fi
done < <(socat -u UNIX-CONNECT:"$SOCKET" -)
