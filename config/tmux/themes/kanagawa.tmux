# vi: ft=tmux
set -g mode-style "fg=#7E9CD8,bg=#363646"

set -g message-style "fg=#7E9CD8,bg=#363646"
set -g message-command-style "fg=#7E9CD8,bg=#363646"

set -g pane-border-style "fg=#363646"
set -g pane-active-border-style "fg=#7E9CD8"

set -g status "on"
set -g status-justify "left"
set -g status-position top

set -g status-style "fg=#7E9CD8,bg=#16161D"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#[fg=#16161D,bg=#7E9CD8,bold]   #S #[fg=#7E9CD8,bg=#16161D,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=#16161D,bg=#16161D,nobold,nounderscore,noitalics]#[fg=#7E9CD8,bg=#16161D] #{prefix_highlight} #[fg=#363646,bg=#16161D,nobold,nounderscore,noitalics]#[fg=#7E9CD8,nobold,nounderscore,noitalics]#[fg=#16161D,bg=#7E9CD8,bold]   #h "

setw -g window-status-activity-style "underscore,fg=#DCD7BA,bg=#16161D"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#DCD7BA,bg=#16161D"
setw -g window-status-format "#[fg=#16161D,bg=#16161D,nobold,nounderscore,noitalics]#[default] #I  #W #F #[fg=#16161D,bg=#16161D,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=#16161D,bg=#363646,nobold,nounderscore,noitalics]#[fg=#7E9CD8,bg=#363646,bold] #I  #W #F #[fg=#363646,bg=#16161D,nobold,nounderscore,noitalics]"
