#!/usr/bin/env bash
#mkdir -p ~/.config
#mkdir -p ~/.config/tmux ~/.config/zsh ~/.config/nvim
#source $HOME/github/dotfiles/env
#source $HOME/github/dotfiles/.config/shell/profile
XDG_CONFIG_HOME="$HOME/.config"
DOT="$HOME/github/dotfiles"
mkdir -p $XDG_CONFIG_HOME/tmux
mkdir -p $XDG_CONFIG_HOME/zsh
mkdir -p $XDG_CONFIG_HOME/nvim
mkdir -p $XDG_CONFIG_HOME/sxhkd
ln -sf $DOT/zshenv $HOME/.zshenv
ln -sf $DOT/zshrc $XDG_CONFIG_HOME/zsh/.zshrc
ln -sf $DOT/vimrc $XDG_CONFIG_HOME/nvim/init.vim
ln -sf $DOT/tmuxrc $XDG_CONFIG_HOME/tmux/tmux.conf
ln -sf $DOT/sxhkdrc $XDG_CONFIG_HOME/sxhkd/sxhkdrc
ln -sf $DOT/gitconfig $HOME/.gitconfig
ln -sf $DOT/.Rprofile $HOME/.Rprofile
ln -sf $DOT/.Renviron $HOME/.Renviron
ln -sf $DOT/.inputrc $HOME/.inputrc
ln -sf $DOT/.config/shell/profile $HOME/.zprofile
