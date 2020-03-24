# My Dotfiles (System Configuration)

These are my configuration files for some of the stuff I use on my Arch Linux rice (Did I mention I use Arch btw?), organized in the same folder hierarchy that exists on my system. Later on I'll write a bash or python script that installs everything automatically, but for now rebuilding my setup will consist solely of lots of copy and pasting (super fun!).

### Setup Summary
My current setup consists of a frankenstein between KDE Desktop Manager and i3-Gaps Window Manager. I currently am using KDE's default taskbar for my statusbar needs (until I find a good polybar config), and dmenu/rofi is used to quickly search through my files and apps. 

### i3 + KDE
I'm using KDE as desktop manager because <strike>linuwux is haard </strike> I like having a comfy settings GUI to fall back on when I can't figure things out through the command line. At my current stage of experience, I'm not too worried about being a ultra-leet poweruser, just as long as my interface doesn't incumber my productivity. The i3 tiling window manager makes it extremely convenient to switch between tasks and launch applications through hotkeys (for example, Win+D opens my dmenu search, and Win+Q closes the focused program on the current desktop). Most of what I do on Windows just consists of auto-sizing windows by dragging them to the sides of the screen anyways, so having a system designed around this concept is super great for ease of use.

### Dependencies
`packages.txt` contains *most* of the required packages for my setup, minus various AUR packages and independently installed applications like anaconda.

### Python Anaconda Trick
To avoid the prompt string from being changed by Anaconda, run the following after installation:

`conda config --set changeps1 False`

### Install AUR helper (pakku)
`git clone https://aur.archlinux.org/pakku.git`

`cd pakku`

`makepkg -si`

### Wallpaper
Place your desired wallpaper in the path `~/Pictures/wallpaper.jpg`

### Firefox userChrome.css
Even if you're operating on a non-superior Mac-OS or Windows operating system, you can still take advantage of Firefox's support for custom CSS. This allows modification of the interface through a .css file, which gives the opportunity for a wide range of customization.

#### 1. Enable custom CSS
- Enter `about:config` in your Firefox address bar
- Search for `toolkit.legacyUserProfileCustomizations.stylesheets`
- Set this option to `True`
#### 2. Create userChrome.css file
- Enter `about:support` in your Firefox address bar
- In the first table (Application Basics), click on "Open Directory" to open your user directory
- Create a folder called `chrome` in this directory
- In the new `chrome` folder, create a new file called `userChrome.css`

### Sample Images:

![ ](https://github.com/dfarmer3/dotfiles/blob/master/PreviewImages/Preview1.png)

![ ](https://github.com/dfarmer3/dotfiles/blob/master/PreviewImages/Preview2.png)

![ ](https://github.com/dfarmer3/dotfiles/blob/master/PreviewImages/Preview3.png)
