#!/usr/bin/env bash
device=$(nmcli -g DEVICE connection show --active | grep -E "^enp" | head -n1)

if [ -n "$device" ]; then
    vendor=$(nmcli -t -f GENERAL.VENDOR device show "$device" 2>/dev/null | cut -d: -f2 | awk '{print $1}')
    echo "${vendor:-$device}"
else
    echo "No device"
fi
