#!/bin/bash

last_status=$(cat /sys/class/power_supply/BAT0/status)

while true
do
    capacity=$(cat /sys/class/power_supply/BAT0/capacity)
    status=$(cat /sys/class/power_supply/BAT0/status)
    if [[ $capacity -le 20 && $status = 'Discharging' ]]
    then
        notify-send -u critical "Battery is at $capacity%"

        # Wait 1 minute
        # sleep 60
    fi

    if [[ ! $last_status = $status ]]
    then
        notify-send -u low "Battery is $status"
    fi

    last_status=$status

    sleep 1
done

