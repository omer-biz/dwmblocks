#!/bin/sh

icon=':p ' #''
# music=$(ncmpcpp --current-song='%a - %t' 2>/dev/null)

all=$(mpc status 2>/dev/null)

state=$(echo $all | grep "^\[.*\]")
music=$(echo $all | head -1)

[[ -n $music ]] && echo $state $music
