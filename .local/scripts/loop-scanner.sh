#!/bin/sh

usage() {
	>&2 echo "usage: loop-scanner [PREFIX] [FROM] [TO]"
	>&2 echo "PREFIX: for output files"
	>&2 echo "FROM: start numbering from FROM"
	>&2 echo "TO: stop numbering until TO"
}

countdown() {
	echo -n "Done. Next scanning in ${waittime}s... "
	sleep $((waittime - 3))
	echo -n "3... "; paplay "$beepfile"; sleep 1
	echo -n "2... "; paplay "$beepfile"; sleep 1
	echo    "1..." ; paplay "$beepfile"; sleep 1
}

# defaults
device="hpaio:/net/Photosmart_Plus_B210_series?hostname=hpb210.home"
beepfile="/usr/share/sounds/Smooth/stereo/count-down.oga"
opts="--mode Color --resolution 100"

# args
waittime="${1:-5}"
prefix="${2:-scan_image}"
from="${3:-1}"

echo "Press ^C to exit."
if [ -z "$to" ]; then
	i="$from"
	while true; do
		echo -n "Scanning image #$i ... "
		scanimage --device-name "$device" -o "${prefix}_$(printf "%04d" "$i").png" $opts
		i=$((i+1))
		countdown
	done
fi
