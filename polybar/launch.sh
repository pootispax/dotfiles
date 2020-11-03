#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar -rq ws &
        MONITOR=$m polybar -rq window &
        MONITOR=$m polybar -rq netw &
        MONITOR=$m polybar -rq tray &

    done
else
    polybar -rq ws &
    polybar -rq window &
    polybar -rq netw &
    polybar -rq tray &
fi

#Launch bar1 


echo "Bars launched..."
