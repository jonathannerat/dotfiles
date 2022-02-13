#!/bin/sh
# convert videos with ffmpeg to be sent by whatsapp

input="$1"
output="${input%.*}_whatsapp.mp4"

ffmpeg -i "$input" \
	-c:v libx264 \
	-c:a aac \
	-pix_fmt yuv420p \
	-vf "pad=ceil(iw/2)*2:ceil(ih/2)*2" \
	"$output"
