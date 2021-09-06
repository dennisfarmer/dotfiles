# Helpful links:
# https://nullr0ute.com/2016/09/connect-to-a-wireless-network-using-command-line-nmcli/



# To install Arch Linux follow the installation guide:

# For WiFi, authenticate to the wireless network using the iwctl utility.
# For mobile broadband (WWAN) modems, connect with the mmcli utility
# Ethernet, WLAN and WWAN interfaces using DHCP should work automatically.

#After connecting to the internet, the installation guide can be accessed
#via the convienience script Installation_guide


#iwctl man page:

#device list
#station DEVICE scan
#station DEVICE get-networks
#station DEVICE connect SSID

# prevent accidental running of this file
exit

timedatectl set-ntp true
cfdisk /dev/sda
msfs.ext4 /dev/sda1
msfs.ext4 /dev/sda2
mount /dev/sda2 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot
#lsblk
pacstrap /mnt base base-devel linux linux-firmware vim
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt /bin/bash
pacman -S networkmanager grub man-db
systemctl enable NetworkManager
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
passwd
vim /etc/locale.gen
# ctrl+b for visual block 
# uncomment en_US lines
locale-gen
vim /etc/locale.conf
# LANG=en_US.UTF-8
vim /etc/hostname
# michigan
ln -sf /usr/share/zoneinfo/America/Detroit /etc/localtime
exit
umount -R /mnt
reboot

nmcli radio  # list if devices are enabled
nmcli device  # list devices
# Connect to internet with NetworkManager
nmcli device wifi rescan
nmcli device wifi list
nmcli device wifi connect SSID-Name --ask

export VISUAL="vim"
visudo /etc/sudoers

mkdir /home/dennis/dl  # downloads folder
pacman -S xorg-server xorg-xinit
mkdir /home/dennis/github
cd /home/dennis/github
git clone https://github.com/dennisfarmer/dotfiles.git

sudo pacman -S lightdm
sudo systemctl enable lightdm.service

# check out dialogue package for making a menu-based installer
# similar to LARBS

# check out li-git file manager

