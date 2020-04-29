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
  if [ "$#" -gt 1 ]; then
    1>&2 echo "error: too many arguments"
    echo "usage: ypath [FILE|DIRECTORY]"
    return 1
  fi

  case "$1" in 
    /*) echo "$1" | xclip ;;
    *)  echo "$PWD/$1" | xclip ;;
  esac
}
