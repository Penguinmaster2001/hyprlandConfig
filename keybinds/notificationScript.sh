#!/bin/bash

case $1 in
    "mute")
        pactl set-sink-mute 3 toggle
        notify-send -t 500 $(pactl get-sink-mute 3)
    ;;

    *)
        notify-send "error in keybind notification script"
    ;;
esac
