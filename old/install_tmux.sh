#!/usr/bin/env bash
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

# append to tmux.conf:
# -------------
# List of plugins
#set -g @plugin 'tmux-plugins/tpm'
#set -g @plugin 'tmux-plugins/tmux-sensible'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
#run '~/.tmux/plugins/tpm/tpm'
# -------------



# type this in terminal if tmux is already running
# tmux source ~/.tmux.conf

## Installing plugins

    #Add new plugin to ~/.tmux.conf with set -g @plugin '...'
    #Press prefix + I (capital i, as in Install) to fetch the plugin.

## Uninstalling plugins

    #Remove (or comment out) plugin from the list.
    #Press prefix + alt + u (lowercase u as in uninstall) to remove the plugin.

