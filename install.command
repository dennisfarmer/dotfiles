#!/usr/bin/env bash


brew install koekeishiya/formulae/yabai
brew services start yabai

brew install koekeishiya/formulae/skhd
brew services start skhd

ln -s $HOME/Github/dotfiles/tmuxrc $HOME/.config/tmux/tmux.conf
ln -s $HOME/Github/dotfiles/zshrc $HOME/.config/zsh/.zshrc

#sudo apt-get install texlive-fonts-extra



# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
ln -s ~/Github/dotfiles/zshrc ~/.config/zsh/.zshrc
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




