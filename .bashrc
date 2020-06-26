# check if already sourced
_this=bashrc
case "$__SOURCED" in 
  *:$_this:*) return ;;
  *)          export __SOURCED=":$_this${__SOURCED:-:}" ;;
esac

# source .bash_profile even if interactive
if [[ "$-" == *i* ]]; then
  [ -f "$HOME/.bash_profile" ] && . "$HOME/.bash_profile"
fi

# source aliases if available
[ -f "$XDG_CONFIG_HOME/bash/aliases" ] && . "$XDG_CONFIG_HOME/bash/aliases"

[ -r "/usr/share/z/z.sh" ] && . /usr/share/z/z.sh


# start only one ssh-agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
  ssh-agent > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
  eval "$(<"$XDG_RUNTIME_DIR/ssh-agent.env")" > /dev/null
fi

set -o vi

mkcdir() {
  if [ "$#" -ne 1 ]; then
    1>&2 echo "error: too many arguments"
    echo "usage: mkcdir DIRECTORY"
    return 1
  fi

  mkdir -p -- "$1" && cd -P -- "$1"
}

# yank path to file / folder
ypath() {
	opts=
	if [ "$1" = "--clipboard" ]; then
		opts="-selection c" # use X clipboard
		shift
	fi

  if [ "$#" -gt 1 ]; then
    1>&2 echo "error: too many arguments"
    echo "usage: ypath [--clipboard] [FILE|DIRECTORY]"
    return 1
  fi

  case "$1" in 
    /*) _out="$1";;
    *)  _out="$PWD/$1";;
  esac

  # quote if path has spaces
  [[ "$_out" == *\ * ]] && _out=\""$_out"\"

  echo "$_out" | xclip $opts
}

n () {
  # Block nesting of nnn in subshells
  if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
    echo "nnn is already running"
    return
  fi

  # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
  # To cd on quit only on ^G, remove the "export" as in:
  #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
  # NOTE: NNN_TMPFILE is fixed, should not be modified
  export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

  # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
  # stty start undef
  # stty stop undef
  # stty lwrap undef
  # stty lnext undef

  nnn "$@"

  if [ -f "$NNN_TMPFILE" ]; then
    . "$NNN_TMPFILE"
    rm -f "$NNN_TMPFILE" > /dev/null
  fi
}
