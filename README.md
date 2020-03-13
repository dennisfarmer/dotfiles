# dotfiles
Dotfiles for Dennis Farmer

These are my configuration files for some of the stuff I use on my totally noob Linux rice (I use Arch btw XD). I currently have them uploaded with zero organizational effort involved because I haven't actually learned how to use Git (commit, branch, etc), but I'll figure it out eventually. I'm not sure if it's possible to recreate my rice with dotfiles alone (either that or I just can't find the right ones), but most of the necessary files are available to compare to the preview pics below if you want to recreate my setup (not sure why you would want to anyways)

# Setup Summary
My current setup consists of a frankenstein between KDE Desktop Manager and i3-Gaps Window Manager. Latte-Dock serves as a copy of the MacOS application tray (convenient for multitasking), and dmenu/rofi is used to quickly search through files and apps. 

# i3 + KDE
By using both KDE and i3, I am able to have a universal menu at the top of my screen (File, Edit, View, etc) plus easy settings menus (printer, bluetooth, general settings, wifi setup) while also endulging in the luxury of a tiling window manager. Having automatic window resizing and multi-desktop functionality without the need to click and drag on stuff has made my workflow satisfying to use for both non-CS homework (pdfs with zathura and MS Office stuff with LibreOffice) and programming projects (vim and vscode).

# userChrome.css
For the uninitiated, Firefox allows the use of custom CSS files to alter basic functionality of the web browser. You can view the comments I added in the file, but basically I made full screen mode more functional when using my Thinkpad (I can use my middle button to close tabs rather than clicking X's). Google will basically solve any question you have, which is how I learned the majority of this stuff anyways (LukeSmith.xyz is basically Jesus though, check him out)

## How to setup:

### 1. Enable custom CSS
- Enter `about:config` in your Firefox address bar
- Search for `toolkit.legacyUserProfileCustomizations.stylesheets`
- Set the option to `True`
### 2. Create userChrome.css file
- Enter `about:support` in your Firefox address bar
- In the first table (Application Basics), click on "Open Directory" to open your user directory
- Create a folder called `chrome` in this directory
- In the `chrome` folder, create a new file called `userChrome.css`

# Sample Images

![ ](https://github.com/dfarmer3/dotfiles/blob/master/images/Screenshot_20200204_225105.png)

![ ](https://github.com/dfarmer3/dotfiles/blob/master/images/Screenshot_20200204_225457.png)

![ ](https://github.com/dfarmer3/dotfiles/blob/master/images/Screenshot_20200204_225636.png)
