#!/bin/bash

DURATION=5000

case $1 in
    "mute")
        pactl set-sink-mute 3 toggle
        notify-send -t $DURATION $(pactl get-sink-mute 3)
    ;;

    "vd")
        pactl set-sink-volume 3 -$2%
        notify-send -t $DURATION $(pactl get-sink-volume 3 | grep -o -E " ?[0-9]?[0-9]?[0-9]%")
    ;;

    "vu")
        pactl set-sink-volume 3 +$2%
        notify-send -t $DURATION $(pactl get-sink-volume 3 | grep -o -E " ?[0-9]?[0-9]?[0-9]%")
    ;;

    *)
        notify-send "error in keybind notification script"
    ;;
esac
