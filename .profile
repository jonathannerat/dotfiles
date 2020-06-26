# check if already sourced
_this=profile
case "$__SOURCED" in
  *:$_this:*) return ;;
  *)           export __SOURCED=":$_this${__SOURCED:-:}" ;;
esac

# custom variables
export DOTS="$HOME/proj/dotfiles"

# XDG specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

# user directories
# could be useful for scripting
export UD_DOCUMENTS="$HOME/docs"
export UD_PICTURES="$HOME/pics"
export UD_VIDEOS="$HOME/vids"
export UD_MUSIC="$HOME/music"

# default apps
export TERMINAL=st
export EDITOR=nvim

# nnn config
export NNN_PLUG='o:nuke'

# home cleaning
# the variables keep many programs from creating dot-{filtes/folders} in
# $HOME. Taken from XDG_Base_Directory's Arch Wiki

export _GL_SHADER_DISK_CACHE_PATH="$HOME/.cache/nv" # nvidia drivers cache
export ELINKS_CONFDIR="$XDG_CONFIG_HOME/elinks"
export MPLAYER_HOME="$XDG_CONFIG_HOME/mplayer"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export IPYTHONDIR="$XDG_CONFIG_HOME"/jupyter
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export CCACHE_CONFIGPATH="$XDG_CONFIG_HOME"/ccache.config

export GOPATH="$XDG_DATA_HOME/go"
export MPD_HOST="$XDG_DATA_HOME/mpd/socket"
export LESSKEY="$XDG_DATA_HOME/less/lesskey"
export LESSHISTFILE="$XDG_DATA_HOME/less/history"
export SQLITE_HISTORY="$XDG_DATA_HOME/sqlite_history"
export TIMEWARRIORDB="$XDG_DATA_HOME/timewarrior"
export HISTFILE="$XDG_DATA_HOME/bash/history"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RANDFILE="$XDG_CONFIG_HOME/openssl/rnd"
export _Z_DATA="$XDG_DATA_HOME/z"

export CCACHE_DIR="$XDG_CACHE_HOME"/ccache

# use fcitx as IM
export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx

# custom scripts
[ -d "$HOME/.local/scripts" ] && PATH="$HOME/.local/scripts:$PATH"

# local programs
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"

# go binaries
[ -d "$GOPATH/bin" ] && PATH="$GOPATH/bin:$PATH"
