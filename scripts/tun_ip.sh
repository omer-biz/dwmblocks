#!/usr/bin/sh

iface="tun0"
ip=$(ip -o -4 addr show $iface | cut -d" " -f 7 | sed -e "s/\/16//")


if [[ $ip == '' ]]
then
	exit
else
	echo $ip
fi
