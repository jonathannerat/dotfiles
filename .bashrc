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

# start only one ssh-agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
  ssh-agent > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
  eval "$(<"$XDG_RUNTIME_DIR/ssh-agent.env")" > /dev/null
fi

mkcdir() {
  if [ "$#" -ne 1 ]; then
    1>&2 echo "error: too many arguments"
    echo "usage: mkcdir DIRECTORY"
    return 1
  fi

  mkdir -p -- "$1" && cd -P -- "$1"
}
