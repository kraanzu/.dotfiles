#!/bin/bash
while true; do
  ac=$(acpi -b | grep -c "Charging")
  battery_level=$(acpi -b | grep -P -o '[0-9]+(?=%)')
  echo $battery_level
  if [ -n $battery_level ]; then
    echo No battery!
    break
  elif [ $battery_level -ge 99 ] && [ $ac -ge 1 ]; then
    notify-send "Battery Full" "Level: ${battery_level}%"
  elif [ $battery_level -le 20 ] && [ $ac -le 0 ]; then
    notify-send --urgency=CRITICAL "Battery Low" "Level: ${battery_level}%"
  fi
  sleep 60
done
