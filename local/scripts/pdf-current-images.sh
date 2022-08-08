#!/bin/sh

# extracts images from a pdf's current page. needs the file and current page to work

file="$1" # path to the file
page="$2" # current page
dest="$3" # optional destination directory for the images

tmpdir="$(mktemp -d)"
template="${file##*/}-page_${page}"

cleanup() {
	[ -d "$tmpdir" ] && rm -r "$tmpdir"
}

trap cleanup EXIT

pdfimages -f "$page" -l "$page" -png "$file" "$tmpdir/$template"

if [ "$dest" ]; then
	env SXIV_SAVE_DIR="$dest" sxiv "$tmpdir"
else
	sxiv "$tmpdir"
fi
