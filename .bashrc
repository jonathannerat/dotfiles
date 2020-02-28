if [ -f $HOME/.bash_profile ]; then
    . $HOME/.bash_profile
fi

if [ -f $HOME/.bash_aliases ]; then
    . $HOME/.bash_aliases
fi

if [ -f $HOME/.git_prompt ]; then
    . $HOME/.git_prompt
fi
