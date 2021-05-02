# for artix
export SVDIR="$HOME/.config/runit/runsvdir"

# XDG specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# default apps
export TERMINAL=st
export EDITOR=nvim

# nnn config
export NNN_FIFO="$HOME/.cache/nnn.fifo"
export NNN_TRASH=1
export NNN_COLORS=1234
export NNN_PLUG='o:nuke;d:dragdrop;p:preview-tui;P:preview-tabbed;z:autojump'

export FZF_DEFAULT_COMMAND='fd --type f --hidden'

# tuir config
export TUIR_BROWSER=url-opener.sh

# home cleaning
# these variables keep many programs from creating dot-{files/folders} in
# $HOME. Taken from XDG_Base_Directory's article at ArchWiki
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME/bundle"
export ADB_VENDOR_KEY="$XDG_CONFIG_HOME/android"
export ANDROID_ROOT_HOME="$XDG_CONFIG_HOME/android"
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME/bundle"
export CCACHE_CONFIGPATH="$XDG_CONFIG_HOME/ccache.config"
export ELINKS_CONFDIR="$XDG_CONFIG_HOME/elinks"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export IPYTHONDIR="$XDG_CONFIG_HOME/jupyter"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
export MPLAYER_HOME="$XDG_CONFIG_HOME/mplayer"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NPM_CONFIG_STORE_DIR="$XDG_DATA_HOME/pnpm-store"
export RANDFILE="$XDG_CONFIG_HOME/openssl/rnd"

export ANDROID_AVD_HOME="$XDG_DATA_HOME/android/"
export ANDROID_EMULATOR_HOME="$XDG_DATA_HOME/android/"
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME/bundle"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export ELECTRUMDIR="$XDG_DATA_HOME/electrum"
export GEM_HOME="$XDG_DATA_HOME/gem"
export GEM_PATH="$XDG_DATA_HOME/gem"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GOPATH="$XDG_DATA_HOME/go"
export LESSHISTFILE="$XDG_DATA_HOME/less/history"
export LESSKEY="$XDG_DATA_HOME/less/lesskey"
export MPD_HOST="$XDG_DATA_HOME/mopidy/socket"
export NVM_DIR="$XDG_DATA_HOME/nvm"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export SQLITE_HISTORY="$XDG_DATA_HOME/sqlite_history"
export TIMEWARRIORDB="$XDG_DATA_HOME/timewarrior"
export _Z_DATA="$XDG_DATA_HOME/z"

export BUNDLE_USER_CACHE="$XDG_CACHE_HOME/bundle"
export CCACHE_DIR="$XDG_CACHE_HOME/ccache"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"
export SOLARGRAPH_CACHE="$XDG_CACHE_HOME/solargraph"
export NUGET_PACKAGES="$XDG_CACHE_HOME/NugetPackages"

# use ibus as IM
export XMODIFIERS=@im=ibus
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus

# custom scripts
[ -d "$HOME/.local/scripts" ] && PATH="$HOME/.local/scripts:$PATH"

# local programs
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"

# gem binaries
[ -d "$GEM_HOME/bin" ] && PATH="$GEM_HOME/bin:$PATH"

# go binaries
[ -d "$GOPATH/bin" ] && PATH="$GOPATH/bin:$PATH"

# cargo binaries
[ -d "$CARGO_HOME/bin" ] && PATH="$CARGO_HOME/bin:$PATH"

# npm binaries
[ -d "$XDG_DATA_HOME/npm/bin" ] && PATH="$XDG_DATA_HOME/npm/bin:$PATH"

# untracked overrides for this profile
[ -f "$XDG_CONFIG_HOME/custom.profile" ] && source "$XDG_CONFIG_HOME/custom.profile"
