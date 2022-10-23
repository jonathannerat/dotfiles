set -g mode-style "fg=blue,bg=#3b4261"

set -g message-style "fg=blue,bg=#3b4261"
set -g message-command-style "fg=blue,bg=#3b4261"

set -g pane-border-style "fg=#3b4261"
set -g pane-active-border-style "fg=blue"

set -g status "on"
set -g status-justify "left"
set -g status-position top

set -g status-style "fg=blue,bg=black"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#[fg=black,bg=blue,bold] #S #[fg=blue,bg=black,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=black,bg=black,nobold,nounderscore,noitalics]#[fg=blue,bg=black] #{prefix_highlight} #[fg=#3b4261,bg=black,nobold,nounderscore,noitalics]#[fg=blue,nobold,nounderscore,noitalics]#[fg=black,bg=blue,bold] #h "

setw -g window-status-activity-style "underscore,fg=#a9b1d6,bg=black"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#a9b1d6,bg=black"
setw -g window-status-format "#[fg=black,bg=black,nobold,nounderscore,noitalics]#[default] #I  #W #F #[fg=black,bg=black,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=black,bg=#3b4261,nobold,nounderscore,noitalics]#[fg=blue,bg=#3b4261,bold] #I  #W #F #[fg=#3b4261,bg=black,nobold,nounderscore,noitalics]"
