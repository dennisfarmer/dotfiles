#!/usr/bin/env bash
sudo apt-get update
# vim vim-gtk3
sudo apt-get install -y vim vim-gtk3 nvim wget jq zsh tmux make cmake gcc tree texlive-xetex texlive-bibtex-extra biber python3-pip
mkdir -p ~/.local/bin
mkdir -p github
git clone https://github.com/dennisfarmer/dotfiles.git ~/github/dotfiles >/dev/null 2>&1 || echo "dennisfarmer/dotfiles.git already downloaded from github..."
wget https://raw.githubusercontent.com/dennisfarmer/scripts/master/copyconfig/copyconfig.sh -O ~/.local/bin/copyconfig
chmod u+x ~/.local/bin/copyconfig
mkdir -p ~/.config
export XDG_CONFIG_HOME="$HOME/.config"

bash ~/.local/bin/copyconfig --config ~/github/dotfiles/WIN10_SETUP/copyconfig_win10.json --dotfiles ~/github/dotfiles --script 

# ~/.config/nvim/...
#mkdir -p ~/.vim/backup
#mkdir -p ~/.vim/swap
mkdir -p ~/.config/nvim/backup
mkdir -p ~/.config/nvim/swap
git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim >/dev/null 2>&1
nvim +PluginInstall +qall
