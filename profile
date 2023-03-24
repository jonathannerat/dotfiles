# vi: ft=sh
# ssh askpass
export SSH_ASKPASS=ssh-askpass
export GIT_ASKPASS=ssh-askpass

# for artix
export SVDIR="$HOME/.config/runit/runsvdir"

# XDG specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# XDG directories (for scripts and stuff)
if ! command -v xdg-user-dir >/dev/null; then
	export XDG_DESKTOP_DIR="$HOME/Desktop"
	export XDG_DOWNLOAD_DIR="$HOME/Downloads"
	export XDG_DOCUMENTS_DIR="$HOME/Documents"
	export XDG_MUSIC_DIR="$HOME/Music"
	export XDG_PICTURES_DIR="$HOME/Pictures"
	export XDG_VIDEOS_DIR="$HOME/Videos"
else
	export XDG_DESKTOP_DIR="$(xdg-user-dir DESKTOP)"
	export XDG_DOWNLOAD_DIR="$(xdg-user-dir DOWNLOAD)"
	export XDG_DOCUMENTS_DIR="$(xdg-user-dir DOCUMENTS)"
	export XDG_MUSIC_DIR="$(xdg-user-dir MUSIC)"
	export XDG_PICTURES_DIR="$(xdg-user-dir PICTURES)"
	export XDG_VIDEOS_DIR="$(xdg-user-dir VIDEOS)"
fi

# default apps
export TERMINAL=alacritty
export EDITOR=nvim
export PAGER=less
export BROWSER=librewolf

export TERMCAP="$XDG_CONFIG_HOME/termcap"

# nnn config
export NNN_FIFO="$HOME/.cache/nnn.fifo"
export NNN_TRASH=1
export NNN_COLORS=1234
export NNN_FCOLORS=c103042e006006f7c6d60501
export NNN_PLUG='o:nuke;d:dragdrop;p:preview-tui;z:autojump;m:mconnect;a:!zoxide add $nnn*;y:!sh -c "echo \"$(realpath \"$1\")\" | xclip -selection clipboard" -- $nnn*'

export FZF_DEFAULT_COMMAND='fd --type f --hidden'

# tuir config
export TUIR_BROWSER=url-opener.sh

# zk config
export ZK_NOTEBOOK_DIR="$XDG_DOCUMENTS_DIR/zk"

# home cleaning
# these variables keep many programs from creating dot-{files/folders} in
# $HOME. Taken from XDG_Base_Directory's article at ArchWiki
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME/bundle"
export ADB_VENDOR_KEY="$XDG_CONFIG_HOME/android"
export ANDROID_ROOT_HOME="$XDG_CONFIG_HOME/android"
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME/bundle"
export CABAL_CONFIG="$XDG_CONFIG_HOME/cabal/config"
export CCACHE_CONFIGPATH="$XDG_CONFIG_HOME/ccache.config"
export COMPOSER_HOME="$XDG_CONFIG_HOME/composer"
export ELINKS_CONFDIR="$XDG_CONFIG_HOME/elinks"
export GHCUP_USE_XDG_DIRS=true
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export IPYTHONDIR="$XDG_CONFIG_HOME/jupyter"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
export KAGGLE_CONFIG_DIR="$XDG_CONFIG_HOME/kaggle"
export MPLAYER_HOME="$XDG_CONFIG_HOME/mplayer"
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch/config"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NPM_CONFIG_STORE_DIR="$XDG_DATA_HOME/pnpm-store"
export RANDFILE="$XDG_CONFIG_HOME/openssl/rnd"

export ANDROID_AVD_HOME="$XDG_DATA_HOME/android/"
export ANDROID_EMULATOR_HOME="$XDG_DATA_HOME/android/"
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME/bundle"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export ELECTRUMDIR="$XDG_DATA_HOME/electrum"
export GEM_PATH="$XDG_DATA_HOME/gem"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GOPATH="$XDG_DATA_HOME/go"
export LESSHISTFILE="$XDG_DATA_HOME/less/history"
export LESSKEY="$XDG_DATA_HOME/less/lesskey"
export MPD_HOST="$XDG_DATA_HOME/mpd/socket"
export NVM_DIR="$XDG_DATA_HOME/nvm"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export SQLITE_HISTORY="$XDG_DATA_HOME/sqlite_history"
export TIMEWARRIORDB="$XDG_DATA_HOME/timewarrior"
export VAGRANT_HOME="$XDG_DATA_HOME/vagrant"
export _Z_DATA="$XDG_DATA_HOME/z"

export BUNDLE_USER_CACHE="$XDG_CACHE_HOME/bundle"
export CABAL_DIR="$XDG_CACHE_HOME/cabal"
export CCACHE_DIR="$XDG_CACHE_HOME/ccache"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"
export SOLARGRAPH_CACHE="$XDG_CACHE_HOME/solargraph"
export NUGET_PACKAGES="$XDG_CACHE_HOME/NugetPackages"

# use ibus as IM
export XMODIFIERS=@im=ibus
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus

export C_INCLUDE_PATH="$HOME/.local/include:$C_INCLUDE_PATH"
export LD_LIBRARY_PATH="$HOME/.local/lib:$LD_LIBRARY_PATH"

append_path () {
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
            PATH="$1${PATH:+:$PATH}"
    esac
}

# custom scripts
append_path "$HOME/.local/scripts"
# local programs
append_path "$HOME/.local/bin"
# go binaries
append_path "$GOPATH/bin"
# cargo binaries
append_path "$CARGO_HOME/bin"
# npm binaries
append_path "$XDG_DATA_HOME/npm/bin"
# composer binaries
append_path "$XDG_CONFIG_HOME/composer/vendor/bin"

export PATH

# untracked overrides for this profile
[ -f "$XDG_CONFIG_HOME/custom.profile" ] && source "$XDG_CONFIG_HOME/custom.profile"
