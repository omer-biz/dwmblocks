#!/bin/bash

data=$(acpi | tr -d ",")

stat=$(echo -ne $data | awk '{print $3}')
# time=$(echo -ne $data | awk '{print $5}' | awk -F ':' '{print $1 ":" $2}')

perc=$(echo -ne $data | awk '{print $4}' | tr -d "%")
[[ $perc -le 100 ]] && icon=""
[[ $perc -le 75 ]] && icon=""
[[ $perc -le 50 ]] && icon=""
[[ $perc -le 25 ]] && icon=""
[[ $perc -le 5 ]] && icon=""

[[ $stat == "Charging" ]] && icon="chr: $icon"
echo "$icon" # $time"
