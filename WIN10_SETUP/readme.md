# Windows 10 Dotfile Installation Walkthrough

### WSL Debian
```zsh
sudo apt update
sudo apt install exfat-fuse exfat-utils
```
https://medium.com/@alllexsm/how-to-install-z-shell-zsh-on-cygwin-dd9ee380d783

### WSL mount drive
```zsh
mkdir /mnt/e
sudo mount -t drvfs e: /mnt/e
```

### Windows 10 AutoHotKey Script
```zsh
cp win10/caps.ahk /mnt/c/users/dennis/AppData/Roaming/Microsoft/Windows/Start\ Menu/Programs/Startup/caps.ahk
```


### Windows Terminal Config
```zsh
cp /mnt/c/Users/denni/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json ./
```

















### Cygwin Setup:

```zsh
# Install Packages
/cygdrive/c/Users/dennis/Downloads/setup-x86_64.exe -q -P lynx,wget,tar,git,vim,gcc-g++,cmake,make

# Install Cygwin Package Manager
wget -P /bin/ rawgit.com/transcode-open/apt-cyg/master/apt-cyg
chmod +x /bin/apt-cyg
apt-cyg install zsh

```

### Create Cygwin zsh shortcut on desktop

```
> Create Shortcut:
C:\cygwin64\bin\mintty.exe -i /Cygwin-Terminal.ico /bin/zsh --login
```


### Mingw make:

add `c:\MinGW\bin` to PATH (also needed for g++ to work from cmd)
https://stackoverflow.com/questions/32127524/how-to-install-and-use-make-in-windows
```zsh
copy c:\MinGW\bin\mingw32-make.exe c:\MinGW\bin\make.exe
```
```zsh
g++ -o ....
main.exe
------------
make.exe run
```
