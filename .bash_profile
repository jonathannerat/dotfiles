# lowercase -> normal
# UPPERCASE -> bold
red='\[\e[0;31m\]'
RED='\[\e[1;31m\]'
blue='\[\e[0;34m\]'
BLUE='\[\e[1;34m\]'
cyan='\[\e[0;36m\]'
CYAN='\[\e[1;36m\]'
green='\[\e[0;32m\]'
GREEN='\[\e[1;32m\]'
yellow='\[\e[0;33m\]'
YELLOW='\[\e[1;33m\]'
PURPLE='\[\e[1;35m\]'
purple='\[\e[0;35m\]'
white='\[\e[0;39m\]'
WHITE='\[\e[1;39m\]'
nc='\[\e[0m\]' # no color

PS1="$RED[$GREEN\u$WHITE@$BLUE\H $PURPLE\w$RED]$WHITE\$(__git_ps1 ' (%s)') \$$nc "

DOTFILES="$HOME/Projects/dotfiles"
