#!/bin/sh

# usage: getheader URL HEADER
# returns the response header of the given url
getheader() {
	local url="$1"
	local header="$2"
	headervalue=$(curl -ILs "$url" | grep -Fi "$header: " | tail -n1 | cut -d' ' -f2)
	# discard charset, don't even bother if it's not utf-8
	echo ${headervalue%%\;*}
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

	# add .webp extension to webp images to fix sxiv issue
	if [ "$(file -b --mime-type "$tmp")" = "image/webp" ]; then
		mv "$tmp" "$tmp.webp"
		tmp="$tmp.webp"
	fi

	sxiv "$tmp"
}

viewvideo() {
	mpv --no-terminal $*
}

viewtext() {
	"${TERMINAL:-st}" -e /bin/sh -c "curl -sL \"$1\" | less"
}

url="$1"
mimetype=$(getheader "$url" "content-type")
tmpfolder="$HOME/.cache/url-opener"
tmp=$(mktemp --dry-run -p "$tmpfolder")

trap cleanup EXIT
[ -d "$tmpfolder" ] || mkdir "$tmpfolder"

# guess opener by mimetype
case "$mimetype" in
	text/plain)
		viewtext "$url" ;;
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
