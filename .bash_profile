# check if already sourced
_this=bash_profile
case "$__SOURCED" in 
  *:$_this:*) return ;;
  *)           export __SOURCED=":$_this${__SOURCED:-:}" ;;
esac

# source profile if available
[ -f "$HOME/.profile" ] && . "$HOME/.profile"

# taken from /usr/share/git/git-prompt.sh
[ -f "$XDG_CONFIG_HOME/bash/git-prompt.sh" ] && . "$XDG_CONFIG_HOME/bash/git-prompt.sh" 

if [[ "$-" == *i* ]]; then
  [ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"
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

    if [ "$(type -t __git_ps1)" ]; then
      echo "$RED[$GREEN\u$WHITE@$BLUE\H $PURPLE\w$RED]$WHITE\$(__git_ps1 ' (%s)')\n$WHITE\$$nc "
    else
      echo "$RED[$GREEN\u$WHITE@$BLUE\H $PURPLE\w$RED]$WHITE\n$WHITE\$$nc "
    fi
}

# bash prompt (use function to keep color variables local)
PS1=$(make_ps1)
