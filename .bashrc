if [ -z "$_BASH_SOURCE_ENTRY_POINT" ]; then
    _BASH_SOURCE_ENTRY_POINT=.bashrc
    [ -f "$HOME/.bash_profile" ] && . "$HOME/.bash_profile"
fi

[ -f "$HOME/.bash_aliases" ] && . "$HOME/.bash_aliases"

# start only one ssh-agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
        ssh-agent > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
        eval "$(<"$XDG_RUNTIME_DIR/ssh-agent.env")" > /dev/null
fi

function mkcdir {
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}
