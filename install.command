#!/usr/bin/env bash
OS="$1"
if [[ "$OS" == "macos" ]]; then {
	brew install koekeishiya/formulae/yabai
	brew services start yabai

	brew install koekeishiya/formulae/skhd
	brew services start skhd


	#sudo apt-get install texlive-fonts-extra



	brew install hammerspoon --cask
	git clone https://github.com/AdamWagner/stackline.git ~/.hammerspoon/stackline
	# run hs.ipc.cliInstall() in hanmmerspoon console
	brew install tree




	# download FUSE for macos: https://github.com/osxfuse/osxfuse/releases
	## DOESN'T WORK ON BIG SUR
	#brew install ntfs-3g
	brew tap gromgit/homebrew-fuse
	brew install ntfs-3g-mac


	# Manual Mounting:
	#https://www.howtogeek.com/236055/how-to-write-to-ntfs-drives-on-a-mac/
	#sudo mkdir /Volumes/NTFS
	#diskutil list
	#umount /dev/disk2s1  # umount the ntfs drive
	#sudo /usr/local/bin/ntfs-3g /dev/disk2s1 /Volumes/NTFS -olocal -oallow_other

	# Auto Mounting (Requires disabling SIP)
	sudo mv /sbin/mount_ntfs /sbin/mount_ntfs.bak
	sudo ln -s /usr/local/sbin/mount_ntfs /sbin/mount_ntfs

	# to undo:
	# sudo mv /sbin/mount_ntfs.bak /sbin/mount_ntfs
}
elif [[ "$OS" == "arch" ]]; then {
	sudo pacman -S --noconfirm wget zsh tmux neovim python-neovim xclip tree mpd xcompmgr dunst xorg-xset unclutter spotifyd xorg-xmodmap pulseaudio xwallpaper slock openssh libnotify ttf-joypixels ttf-linux-libertine ttf-inconsolata ttf-emojione ttf-symbola noto-fonts
    #for some reason this is essential for xorg to work wtf
    sudo pacman -S --noconfirm bdf-unifont xorg-server xf86-video-intel
}
fi
# Install oh-my-zsh
source $HOME/github/dotfiles/env
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
mkdir -p $XDG_CONFIG_HOME/tmux
mkdir -p $XDG_CONFIG_HOME/zsh
mkdir -p $XDG_CONFIG_HOME/nvim
mkdir -p $XDG_CONFIG_HOME/nvim/backup
mkdir -p $XDG_CONFIG_HOME/nvim/swap
mkdir -p $XDG_CONFIG_HOME/nvim/undo

ln -s $DOT/tmuxrc $HOME/.config/tmux/tmux.conf
ln -s $DOT/zshrc $HOME/.config/zsh/.zshrc
ln -s $DOT/vimrc $HOME/.config/nvim/init.vim
ln -s $DOT/zshenv $HOME/.zshenv
sudo pacman -S xf86-video-intel
sudo pacman -S xterm
sudo pacman -S pamixer mpc
yay -S ttf-symbola-free
sudo pacman -Syu
sudo pacman -S lib32-mesa opengl-man-pages lib32-mesa-vdpau lib32-libva-mesa-driver lib32-vulkan-driver
lib32-vulkan-mesa-layers
