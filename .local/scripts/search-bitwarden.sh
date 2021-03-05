#!/bin/sh

search="$(dmenu -p "[Bitwarden] Search:" </dev/null)"
[ "$search" ] || exit

results="$(rbw ls --fields name,user | grep -i "$search")"

if [ "$(echo "$results" | wc -l )" -gt 1 ]; then
	index=$(echo "$results" | dmenu -vp 0 -hp 0 -I -c -B -l 5)
	id=$(rbw ls --fields id,name,user | grep -i "$search" | head -n "$((index+1))" | tail -n1 | cut -d'	' -f1)
	pass=$(rbw get "$id")
else
	id=$(rbw ls --fields id,name,user | grep -i "$search" | cut -d '	' -f1)
	pass="$(rbw get "$id")"
fi

if [ "$pass" ]; then
	notify-send -u low "Bitwarden" "Password copied"
	echo "$pass" | tr -d '\n' | xclip -selection clipboard
else
	notify-send -u low "Bitwarden" "No entry matches search term '$search'"
fi
