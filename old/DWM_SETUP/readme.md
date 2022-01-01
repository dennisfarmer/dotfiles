# Arch DWM Setup

See `lukesmith/.local` folder

### `/usr/share/xsessions/dwm.desktop`:
```zsh
[Desktop Entry]
Name=dwm
Exec=/usr/libexec/xinit-compat
```
```zsh
sudo chown root:root /usr/share/xsessions/dwm.desktop
sudo chmod 0644 /usr/share/xsessions/dwm.desktop
```
### `~/.xsession`:
```zsh
sudo chown fedora:fedora /home/fedora/.xsession
sudo chmod 0755 /home/fedora/.xsession
```

### Opening a terminal
If #MODKEY was changed to Mod4Mask:

`Windows Key + Shift + Enter`

If #MODKEY was left as the default:

`Left Alt + Shift + Enter`

### Quit DWM
If #MODKEY was changed to Mod4Mask:

`Windows Key + Shift + Q`

If #MODKEY was left as the default:

`Left Alt + Shift + Q`


<https://gitlab.com/-/snippets/2048501>
