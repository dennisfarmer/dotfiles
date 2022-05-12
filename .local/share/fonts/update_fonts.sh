#!/usr/bin/env bash
rm -rf $HOME/.local/share/fonts
cp -r ${DOT:-$HOME/github/dotfiles}/.local/share/fonts $HOME/.local/share/fonts
cd $HOME/.local/share/fonts
sudo mkfontscale && mkfontdir
xset +fp $HOME/.local/share/fonts   #(xset q to list fontpaths)
fc-cache -f $HOME/.local/share/fonts
cd -
