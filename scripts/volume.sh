#!/bin/sh

[ $(pamixer --get-mute) = true ] && echo " 0%" && exit

vol="$(pamixer --get-volume)"

if [ "$vol" -ge "50" ]; then
	icon=""
elif [ "$vol" -lt "50" ]; then
	icon=""
else
	icon=""
fi

echo "$icon $vol%"
