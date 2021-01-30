#!/bin/sh

url="$1"
mimetype=$(curl -Is "$url" | grep -Fi "content-type" | cut -d' ' -f2)
tmpfolder="$HOME/.cache/url-opener"
tmp=$(mktemp --dry-run -p "$tmpfolder")

# remove tmp file before exit
cleanup() {
	[ -f "$tmp" ] && rm "$tmp"
}

trap cleanup EXIT

[ -d "$tmpfolder" ] || mkdir "$tmpfolder"

# guess opener by mimetype
case "$mimetype" in
	image/*)
		curl -sLo "$tmp" "$url"
		sxiv "$tmp" ;;
	video/*)
		mpv "$url" ;;
esac

# guess opener by link
case "$url" in
	https://www.youtube.com/*)
		mpv "$url" ;;
	https://youtu.be/*)
		mpv "$url" ;;
	*)
		xdg-open "$@" ;;
esac

