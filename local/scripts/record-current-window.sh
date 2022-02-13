#!/bin/sh

# Records the current X11 window using ffmpeg, xdotool and xorg-xwininfo

# Sources:
# - get current window geometry: https://unix.stackexchange.com/questions/14159/how-do-i-find-the-window-dimensions-and-position-accurately-including-decoration/14170

vids_folder="$XDG_VIDEOS_DIR/screenrecords"
unset x y w h
eval $(xwininfo -id $(xdotool getactivewindow) |
sed -n -e "s/^ \+Absolute upper-left X: \+\([0-9]\+\).*/x=\1/p" \
       -e "s/^ \+Absolute upper-left Y: \+\([0-9]\+\).*/y=\1/p" \
       -e "s/^ \+Width: \+\([0-9]\+\).*/w=\1/p" \
       -e "s/^ \+Height: \+\([0-9]\+\).*/h=\1/p" )

# select motinor of default sink by default
# we could include a selector here in the manager
audiosink=$(pactl info | grep -F "Default Sink:" )
audiosink="${audiosink#*: }".monitor

audiosource=$(pactl info | grep -F "Default Source:" )
audiosource="${audiosource#*: }"

[ -d "$vids_folder" ] || mkdir "$vids_folder"



# right now the only way to stop this is to C-c or pkill it
# in the future we could do a screenrecord manager using dmenu that would name each recording
# and save pids to a temporary file, that way we can stop a recording by searching its name
echo ffmpeg -video_size "$((w-2))x$((h-2))" \
	-f x11grab -i :0.0+$((x+4)),+$((y+4)) \
	-f pulse -i "$audiosink" \
	-f pulse -i "$audiosource" \
	"$vids_folder/$(date +%F_%H%M%S_$((w-2))x$((h-2))).mp4"

exec ffmpeg \
	-f pulse -i "$audiosink" \
	-f pulse -i "$audiosource" \
	-filter_complex amix=inputs=2:duration=longest \
	-video_size "$((w-2))x$((h-2))" \
	-f x11grab -i :0.0+$((x+4)),+$((y+4)) \
	"$vids_folder/$(date +%F_%H%M%S_$((w-2))x$((h-2))).mp4"

