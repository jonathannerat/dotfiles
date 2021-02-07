#!/bin/sh

# usage: getheader URL HEADER
# returns the response header of the given url
getheader() {
	local url="$1"
	local header="$2"
	curl -Is "$url" | grep -Fi "$header: " | cut -d' ' -f2
}

# remove tmp file before exit
cleanup() {
	[ -f "$tmp" ] && rm "$tmp"
}

# usage: viewurl URL
# fetches the url into a temp file and opens it with sxiv
viewurl() {
	local url="$1"
	curl -sLo "$tmp" "$url"
	sxiv "$tmp"
}

url="$1"
mimetype=$(getheader "$url" "content-type")
tmpfolder="$HOME/.cache/url-opener"
tmp=$(mktemp --dry-run -p "$tmpfolder")

trap cleanup EXIT

[ -d "$tmpfolder" ] || mkdir "$tmpfolder"

# guess opener by mimetype
case "$mimetype" in
	image/*)
		viewurl "$url" ;;
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
				notify-send -u low "url-opener.sh" "Opening video in background. This might take a while..."
				mpv "$url" & ;;
			https://imgur.com/*)
				url="https://i.imgur.com/${url##*/}"
				case "$(getheader "$url" "content-type")" in
					image/*)
						viewurl "$url" ;;
					*)
						xdg-open "$@" ;;
				esac ;;
			https://gfycat.com/*)
				mpv "$url" ;;
			https://streamable.com/*)
				mpv "$url" ;;
			*)
				xdg-open "$@" ;;
		esac ;;
esac

exit 0
