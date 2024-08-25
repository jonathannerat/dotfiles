set -g set-titles-string '#{pane_current_command}'
set -g visual-activity on
set -g status-position top
set -g renumber-windows on
setw -g monitor-activity off

# Split
set -g pane-active-border-style "fg=blue"
set -g pane-border-style "fg=white"

set -g status-style "bg=black fg=white"
set -g status-left ''
set -g status-right '#[fg=green]#[fg=black]#[bg=green]  #S '
set -g status-right-length 20
setw -g window-status-format '###I #W#{?window_zoomed_flag,  ,}'
setw -g window-status-current-format '#[fg=blue]###I #W#{?window_zoomed_flag,  ,}'
