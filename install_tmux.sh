git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

# append to tmux.conf:
# -------------
# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'

# Other examples:
# set -g @plugin 'github_username/plugin_name'
# set -g @plugin 'github_username/plugin_name#branch'
# set -g @plugin 'git@github.com:user/plugin'
# set -g @plugin 'git@bitbucket.com:user/plugin'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
# -------------



# type this in terminal if tmux is already running
# tmux source ~/.tmux.conf

## Installing plugins

    #Add new plugin to ~/.tmux.conf with set -g @plugin '...'
    #Press prefix + I (capital i, as in Install) to fetch the plugin.

## Uninstalling plugins

    #Remove (or comment out) plugin from the list.
    #Press prefix + alt + u (lowercase u as in uninstall) to remove the plugin.

