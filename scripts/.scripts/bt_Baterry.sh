#!/usr/bin/env bash

# ----- installation
# sudo pacman -S bluetoothctl bluez bluez-utils


MAC=$(bluetoothctl -- devices Paired | grep "Crusher Evo" | awk '{print $2}')

connected=$(bluetoothctl info "$MAC" | grep "Connected: yes")
if [ -n "$connected" ]; then
    battery=$(bluetoothctl info "$MAC" | grep "Battery Percentage" | awk '{print $4}' | tr -d '()')
    
    if [ -n "$battery" ]; then
        echo "$battery"
    else
        echo "No Battery Info"
    fi
else
    exit 1
fi

