if [ -z "$_BASH_SOURCE_ENTRY_POINT" ]; then
    _BASH_SOURCE_ENTRY_POINT=.bashrc
    if [ -f "$HOME/.bash_profile" ]; then
        . "$HOME/.bash_profile"
    fi
fi

if [ -f "$HOME/.bash_aliases" ]; then
    . "$HOME/.bash_aliases"
fi

