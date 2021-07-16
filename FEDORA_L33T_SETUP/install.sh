#!/usr/bin/env bash
sudo dnf update -y
#texlive-bibtex-extra biber python3-pip
sudo dnf install -y vim wget jq zsh tmux make cmake gcc tree texlive-xetex
sudo dnf install -y okular brasero cups kate gwenview nodejs youtube-dl xclip
sudo dnf install -y cmake g++ R rstudio python-devel git libpq-devel libev-devel
mkdir -p ~/.local/bin
mkdir -p ~/github
git clone https://github.com/dennisfarmer/dotfiles.git ~/github/dotfiles >/dev/null 2>&1 || echo "dennisfarmer/dotfiles.git already downloaded from github..."
wget https://raw.githubusercontent.com/dennisfarmer/scripts/master/copyconfig/copyconfig.sh -O ~/.local/bin/copyconfig
chmod u+x ~/.local/bin/copyconfig
mkdir -p ~/.config
export XDG_CONFIG_HOME="$HOME/.config"

bash ~/.local/bin/copyconfig --config ~/github/dotfiles/FEDORA_L33T_SETUP/copyconfig_fedora.json --dotfiles ~/github/dotfiles --script 

mkdir -p ~/.vim/backup
mkdir -p ~/.vim/swap
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim >/dev/null 2>&1
vim +PluginInstall +qall
