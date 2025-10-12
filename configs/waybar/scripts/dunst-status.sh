#!/usr/bin/env bash

if $(which dunstctl) is-paused | grep -q "true"; then
    echo '{"text":"󰒲","tooltip":"Notifications paused","class":"paused"}'
else
    echo '{"text":"󰂚","tooltip":"Notifications active","class":"active"}'
fi
