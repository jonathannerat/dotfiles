[ -z "$_BASH_SOURCE_ENTRY_POINT" ] && _BASH_SOURCE_ENTRY_POINT=.bash_profile

# file where I keep my secret environment variables for scripts
# such ass github's personal access tokens and the like
[ -f "$HOME/.secrets" ] && . "$HOME/.secrets"

make_ps1() {
    # lowercase -> normal
    # UPPERCASE -> bold
    local red='\[\e[0;31m\]'
    local RED='\[\e[1;31m\]'
    local blue='\[\e[0;34m\]'
    local BLUE='\[\e[1;34m\]'
    local cyan='\[\e[0;36m\]'
    local CYAN='\[\e[1;36m\]'
    local green='\[\e[0;32m\]'
    local GREEN='\[\e[1;32m\]'
    local yellow='\[\e[0;33m\]'
    local YELLOW='\[\e[1;33m\]'
    local PURPLE='\[\e[1;35m\]'
    local purple='\[\e[0;35m\]'
    local white='\[\e[0;39m\]'
    local WHITE='\[\e[1;39m\]'
    local nc='\[\e[0m\]' # no color

    echo "$RED[$GREEN\u$WHITE@$BLUE\H $PURPLE\w$RED]$WHITE\$(__git_ps1 ' (%s)') \$$nc "
}

# includes bash functions to get git properties (like __git_ps1) used below
[ -f "$HOME/.git_prompt" ] && source "$HOME/.git_prompt"

# bash prompt (use function to keep color variables local)
PS1=$(make_ps1)

# ignore bitwarden-cli from history
HISTIGNORE="bw *:$HISTIGNORE"
# ignore commands starting with a space and duplicates from history
HISTCONTROL="ignoreboth"

# location of my dotfiles
DOTFILES="$HOME/Projects/dotfiles"

# local scripts / programs
[ -d "$HOME/.scripts" ] && PATH="$HOME/.scripts:$PATH"

# needs jreXX-openjdk package installed
# default can be changed by symlinking or archlinux-java command
[ -d "/usr/lib/jvm/default" ] && JAVA_HOME="/usr/lib/jvm/default"

# fixes "sourcing flow", bash_profile should be sourced before bashrc
if [ "$_BASH_SOURCE_ENTRY_POINT" == ".bash_profile" ]; then
    [ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"
fi

# fcitx fix fot st
export XMODIFIERS=@im=fcitx 

# default apps
export TERMINAL=st
export BROWSER=surf
export EDITOR=vim
