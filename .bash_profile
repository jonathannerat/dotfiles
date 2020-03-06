if [ -z "$_BASH_SOURCE_ENTRY_POINT" ]; then
    _BASH_SOURCE_ENTRY_POINT=.bash_profile
fi

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

# bash prompt
PS1=$(make_ps1)

# ignore bitwarden from bash_history
HISTIGNORE="bw *:$HISTIGNORE"

# location of my dotfiles
DOTFILES="$HOME/Projects/dotfiles"

# local scripts / programs
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "/usr/lib/jvm/default" ]; then
    JAVA_HOME="/usr/lib/jvm/default"
fi

# fixes "sourcing flow", bash_profile should be sourced before bashrc
if [ "$_BASH_SOURCE_ENTRY_POINT" == ".bash_profile" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi
