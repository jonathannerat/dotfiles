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

viewvideo() {
	mpv --no-terminal $*
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
		viewvideo "$url" ;;
	*)
		# guess opener by link
		case "$url" in
			https://www.youtube.com/*)
				viewvideo "$url" ;;
			https://youtu.be/*)
				viewvideo "$url" ;;
			https://v.redd.it/*)
				notify-send -u low "url-opener.sh" "Opening video in background. This might take a while..."
				viewvideo "$url" & ;;
			https://imgur.com/*)
				url="https://i.imgur.com/${url##*/}"
				case "$(getheader "$url" "content-type")" in
					image/*)
						viewurl "$url" ;;
					*)
						xdg-open "$@" ;;
				esac ;;
			https://gfycat.com/*)
				viewvideo "$url" ;;
			https://streamable.com/*)
				viewvideo "$url" ;;
			*)
				xdg-open "$@" ;;
		esac ;;
esac
