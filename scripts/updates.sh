#!/bin/sh

update_dir="/dev/shm/updates"
update_file="n_up"

if [[ ! -d $update_dir ]]
then
	mkdir -p $update_dir
	echo '0' > "$update_dir/$update_file"
fi
updates=$(cat "$update_dir/$update_file")

check_updates() {
	list=$(ps aux | grep checkupdates | grep -v 'grep')
	if [[ ! -n $list ]]
	then
		echo "$(checkupdates | wc -l)" > "$update_dir/$update_file"
		updates=$(cat "$update_dir/$update_file")
	fi
}

check_updates&

icon=''

echo " $icon $updates"
