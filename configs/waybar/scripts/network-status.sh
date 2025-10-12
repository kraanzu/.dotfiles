#!/usr/bin/env bash

device=$(nmcli -g DEVICE connection show --active | grep -E "^enp" | head -n1)

case $device in
    "enp7s0")
        echo "LEAF"
        ;;
    "enp12s0f3u3")
        echo "S23"
        ;;
    *)
        echo "$device"
        ;;
esac
