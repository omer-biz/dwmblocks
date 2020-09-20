#!/bin/sh

icon_dir="/dev/shm/internet"
icon_file="net_icon"
pinged="google.com"
#pinged="127.0.0.1"

operstat="$(cat /sys/class/net/w*/operstate 2>/dev/null)"

if [[ ! -d $icon_dir ]]
then
	mkdir -p $icon_dir
	echo ' ' > "$icon_dir/$icon_file"
fi
net_icon="$(cat /dev/shm/internet/net_icon)"

case $operstat in
	down) wifiicon="📡 " ;;
	up) wifiicon="$(awk '/^\s*w/ { print "📶", int($3 * 100 / 70) "% " }' /proc/net/wireless)" ;;
esac

check_internet() {

	# check internet per second
	per_second=10
	second=$(date "+%S")
	if [[ ! $(( second % per_second )) = 0 ]]
	then
		return
	fi


	list=$(ps aux | grep $pinged | grep -v 'grep')
	if [[ ! -n $list ]]
	then
		if [[ $operstat = 'up' ]]
		then
			inte=$(ping -c 1 $pinged 2>/dev/null)

			if [[ -n $inte ]]
			then
				# net_icon=' '
				echo ' ' > "$icon_dir/$icon_file"
			else
				# net_icon=' '
				echo ' ' > "$icon_dir/$icon_file"
			fi
		fi
	fi
}

check_internet&

#printf "$net_icon%s%s\n" "$wifiicon" "$(sed "s/down/❎/;s/up/🌐/" /sys/class/net/e*/operstate 2>/dev/null)"
printf "$net_icon%s" "$wifiicon" #"$(sed "s/down/❎/;s/up/🌐/" /sys/class/net/e*/operstate 2>/dev/null)"

