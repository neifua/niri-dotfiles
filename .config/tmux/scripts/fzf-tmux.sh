#!/bin/bash

# Check if a directory argument is passed
if [[ $# -eq 1 ]]; then
    selected=$1
else
    # Search within ~/School, and ~/projects with a maximum depth of 2
    selected=$(find ~/School ~/Projects/ -mindepth 1 -maxdepth 2 -type d | fzf)
fi

# Exit if no directory was selected
if [[ -z $selected ]]; then
    exit 0
fi

# Use the selected directory name as the session name (replacing dots with underscores)
selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

# Check if a session with the selected name exists
if tmux has-session -t="$selected_name" 2>/dev/null; then
    # If inside tmux, switch to the session
    if [[ -n $TMUX ]]; then
        tmux switch-client -t "$selected_name"
    else
        # If outside tmux, attach to the session
        tmux attach-session -t "$selected_name"
    fi
else
    # Create a new session with the directory name and start in the selected directory
    tmux new-session -ds "$selected_name" -c "$selected"
    # If outside tmux, attach to the new session
    if [[ -z $TMUX ]]; then
        tmux attach-session -t "$selected_name"
    else
        tmux switch-client -t "$selected_name"
    fi
fi
