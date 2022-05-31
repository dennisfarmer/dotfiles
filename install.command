#!/usr/bin/env bash



# dotfiles.github.io




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
	sudo pacman -S --noconfirm wget zsh tmux neovim python-neovim xclip tree mpd xcompmgr dunst xorg-xset unclutter spotifyd xorg-xmodmap pulseaudio xwallpaper slock openssh libnotify ttf-joypixels ttf-linux-libertine ttf-inconsolata ttf-emojione ttf-symbola noto-fonts maim tree
	#for some reason this is essential for xorg to work wtf
	sudo pacman -S --noconfirm bdf-unifont xorg-server xf86-video-intel

# gpg
#mpd-openrc
}
fi
# Install oh-my-zsh
source $HOME/github/dotfiles/env
#sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


#sudo pacman -S xf86-video-intel
#sudo pacman -S xterm
sudo pacman -S pamixer mpc
yay -S ttf-symbola-free
sudo pacman -Syu
#sudo pacman -S lib32-mesa opengl-man-pages lib32-mesa-vdpau lib32-libva-mesa-driver lib32-vulkan-driver
#lib32-vulkan-mesa-layers
#man -t bash | ps2pdf - >bash.pdf

# restart pulseaudio
#pulseaudio --kill
#pulseaudio -D

# check filesystem of a drive
# sudo file -sL /dev/sda1

# 12 zooms of st is optimal zoom (make default?)
# sudo rc-service mpd start
# sudo rc-update add mpd default
# emerge sys-power/acpilight
# rc-update add acpilight boot

function add_arch_repos () {
	pacman -Syu artix-archlinux-support
	echo "
	#[testing]
	#Include = /etc/pacman.d/mirrorlist-arch


	[extra]
	Include = /etc/pacman.d/mirrorlist-arch


	#[community-testing]
	#Include = /etc/pacman.d/mirrorlist-arch


	[community]
	Include = /etc/pacman.d/mirrorlist-arch


	#[multilib-testing]
	#Include = /etc/pacman.d/mirrorlist-arch


	#[multilib]
	#Include = /etc/pacman.d/mirrorlist-arch
	" >> /etc/pacman.conf
	sudo pacman-key --populate archlinux
	sudo pacman -Sy
	sudo pacman -S xorg-xev
}

function initalize_github () {
	git config --global user.email "dennis.j.farmer2@outlook.com"
	git config --global user.name "dennisfarmer"
}
