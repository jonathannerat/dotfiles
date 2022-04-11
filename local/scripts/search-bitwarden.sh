#!/bin/sh

idx="$(rbw ls --fields=name,user\
	| while IFS='	' read -r name user; do echo "$name${user:+ ($user)}"; done\
	| dmenu -ix -i "$@")"

if [ -n "$idx" ]; then
	id="$(rbw ls --fields=id 2>/dev/null | head -n$((idx+1)) | tail -n1)"
	rbw get "$id" | tr -d '\n' | xclip -selection clipboard
fi
