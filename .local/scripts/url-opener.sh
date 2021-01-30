#!/bin/sh

get_header() {
	local url="$1"
	local header="$2"
	local value=$(curl -Is "$url" | grep -Fi "$header:" | cut -d' ' -f2)
	echo "$value"
}

# remove tmp file before exit
cleanup() {
	[ -f "$tmp" ] && rm "$tmp"
}

url="$1"
mimetype=$(get_header "$url" "content-type")
tmpfolder="$HOME/.cache/url-opener"
tmp=$(mktemp --dry-run -p "$tmpfolder")
trap cleanup EXIT
[ -d "$tmpfolder" ] || mkdir "$tmpfolder"

# guess opener by mimetype
case "$mimetype" in
	image/*)
		curl -sLo "$tmp" "$url"
		sxiv "$tmp" ;;
	video/*)
		mpv "$url" ;;
	*)
		# guess opener by link
		case "$url" in
			https://www.youtube.com/*)
				mpv "$url" ;;
			https://youtu.be/*)
				mpv "$url" ;;
			https://v.redd.it/*)
				notify-send -u low "url-opener.sh" "Opening reddit video. This might take a while"
				mpv "$url" &;;
			*)
				xdg-open "$@" ;;
		esac ;;
esac

exit 0
