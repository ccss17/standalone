#!/bin/bash
set -xe
STANDALONE_TMUX_PATH=~/.standalone/tmux
mkdir $STANDALONE_TMUX_PATH -p
cp standalone-tmux.sh $STANDALONE_TMUX_PATH
cp libevent-2.0.so.5 $STANDALONE_TMUX_PATH
cp tmux $STANDALONE_TMUX_PATH
echo alias tmux=~/.standalone/tmux/standalone-tmux.sh >> ~/.zsh_aliases
echo alias t=tmux >> ~/.bashrc
cat <<EOT > ~/.tmux.conf
set-window-option -q -g utf-8 on
set -g default-terminal "xterm"
setw -g mode-keys vi

unbind C-b
set-option -g prefix C-a
bind-key C-a send-prefix
bind \ split-window -h
bind - split-window -v
unbind '"'
unbind %
bind r source-file ~/.tmux.conf

bind -n M-h select-pane -L
bind -n M-l select-pane -R
bind -n M-k select-pane -U
bind -n M-j select-pane -D
bind -n M-Left resize-pane -L 25
bind -n M-Right resize-pane -R 25
bind -n M-Up resize-pane -U 5
bind -n M-Down resize-pane -D 5
bind -n M-o select-pane -t :.+
bind -n M-n next-window
bind -n M-p previous-window
bind -n M-c new-window
# set -g mouse on

### DESIGN CHANGES ###
set-option -g visual-activity on
set-option -g visual-bell on
set-option -g visual-silence on
set-window-option -g monitor-activity on
set-option -g bell-action none
setw -g clock-mode-colour colour5
setw -g mode-style fg=colour1,bg=colour32

set -g pane-border-style fg=colour4
set -g pane-active-border-style bg=default,fg=colour9

set -g status-position top
set -g status-justify left
set -g status-bg default
set -g status-fg colour137
set -g status-style dim
set -g status-left '#[fg=colour51,bg=colour0,bold] %R '
# set -g status-right '#[fg=colour51,bg=colour0,bold] #(uname -r) '
set -g status-right '#[fg=colour51,bg=colour0,bold] #(osname) '
set -g status-right-length 100

setw -g window-status-current-style bg=colour14,fg=colour00,bold
setw -g window-status-current-format ' #I#[fg=colour0] #[fg=colour0]#W#[fg=colour0] '

setw -g window-status-style fg=colour49,none,bg=colour00
setw -g window-status-format '#I #W '

setw -g window-status-bell-style fg=colour255,bold,bg=colour1

set -g message-style fg=colour232,bold,bg=colour16

setw -g window-status-activity-style none
setw -g window-status-last-style none
setw -g window-status-bell-style none
set -sg escape-time 0
EOT
