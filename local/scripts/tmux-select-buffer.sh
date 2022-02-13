#!/bin/sh

wid="0x$( (echo 'obase=16;' ; xdotool getwindowfocus) | bc )"
buffer="$(tmux list-buffers -F "#{buffer_name}: #{buffer_sample}" | dmenu -W "$wid" -vp 0 -hp 0 -l 5 | cut -d: -f1)"

tmux show-buffer -b "$buffer"
