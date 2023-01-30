#!/bin/bash

DURATION=500

case $1 in
    "mute")
        pactl set-sink-mute 3 toggle
        notify-send -t $DURATION "Volume" "$(pactl get-sink-mute 3)"
    ;;

    "v")
        pactl set-sink-volume 3 $2
        notify-send -t $DURATION "Volume" "$(pactl get-sink-volume 3 | grep -o -E " ?[0-9]?[0-9]?[0-9]%")"
    ;;

    "b")
        brightnessctl -d intel_backlight s $2
        notify-send -t $DURATION Brightness "$(($(brightnessctl get) / 960))%"
    ;;

    *)
        notify-send "error in keybind notification script"
    ;;
esac
