file="$(find -L ${XDG_DOCUMENTS_DIR:-$HOME/Documents} \
    -type f \( -name '*.pdf' -o -name '*.epub' -o -name '*.djvu' \) \
    | dmenu -i -l 10 "$@")"

[ -r "$file" ] && zathura "$file"
