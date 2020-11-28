#!/bin/sh

[ $(pamixer --get-mute) = true ] && echo "婢 0%" && exit

vol="$(pamixer --get-volume)"

if [ "$vol" -ge "50" ]; then
	icon=""
elif [ "$vol" -lt "50" ]; then
	icon="奔"
else
	icon=""
fi

echo "$icon $vol%"
