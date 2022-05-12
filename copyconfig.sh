#!/usr/bin/env bash
mkdir -p ~/.config
mkdir -p ~/.config/tmux ~/.config/zsh ~/.config/nvim
source $HOME/github/dotfiles/env
mkdir -p $XDG_CONFIG_HOME/tmux
mkdir -p $XDG_CONFIG_HOME/zsh
mkdir -p $XDG_CONFIG_HOME/nvim
ln -sf $DOT/tmuxrc $HOME/.config/tmux/tmux.conf
ln -sf $DOT/zshrc $HOME/.config/zsh/.zshrc
ln -sf $DOT/vimrc $HOME/.config/nvim/init.vim
ln -sf $DOT/zshenv $HOME/.zshenv
ln -sf $DOT/.config/shell/profile $HOME/.zprofile
