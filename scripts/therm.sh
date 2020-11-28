#!/bin/sh

temp=$(acpi -t | awk '{print $4}')
icon=''
echo "$icon $temp c"
