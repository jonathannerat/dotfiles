#!/bin/sh

# truncate output to `maxlen`
maxlen="$1"
mpc_status="$(mpc status)"
play_status="[stopped]"

if [ "$(echo "$mpc_status" | wc -l)" = 3 ]; then
	play_status="$(echo "$mpc_status" | tail -n+2 | head -n1 | awk '{print $1}')"
fi

current_song="$(mpc current -f "[[%artist% - ]%title%]|[%file]")"

icon=
case "$play_status" in
	\[playing\]) icon=" " ;;
	\[paused\])  icon=" " ;;
	\[stopped\]) icon="  [stopped]" ;;
esac

if [ -n "$maxlen" ] && [ "$(echo "$current_song" | wc -c)" -gt "$maxlen" ]; then
	echo "$icon $(echo "$current_song" | cut -c1-$maxlen)…"
else
	echo "$icon${current_song:+ $current_song}"
fi
