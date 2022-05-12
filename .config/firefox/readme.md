# Firefox Configuration

Access profile folder by visiting `about:support` from Firefox

`$HOME/.mozilla/firefox/bg1kmeem.default-release/`

<br>

Copy themes (stored in this directory's folders) to `extensions` folder


# `userChrome.css` Configuration:

contents of `$HOME/.mozilla/firefox/somethings.defaults/chrome/userChrome.css`
```
#contentAreaContextMenu{ margin: 5px 0 0 5px }
```


Copy `installs.ini` and `profiles.ini` to your firefox directory (`$HOME/.mozilla/firefox`)



# `userChrome.css` Configuration:

contents of `$HOME/.mozilla/firefox/somethings.defaults/chrome/userChrome.css`
```
#contentAreaContextMenu{ margin: 5px 0 0 5px }
```
Visit `about:config` from Firefox
Set `toolkit.legacyUserProfileCustomizations.stylesheets` to `true`

(fixes firefox right click issue)

<hr>

### My config

Visit `about:config` from Firefox

Set `accessibility.typeaheadfind.enablesound` to `false`
<<<<<<< HEAD
    accessibility.typeaheadfind.manual = false
    accessibility.typeaheadfind = false
    accessibility.typeaheadfind.autostart = false
=======

>>>>>>> ad1c3c348725b4269df7f9fcdf4ab4f14f57630b
Set `browser.tabs.insertAfterCurrent` to `true`

Set `browser.sessionstore.resume_from_crash` to `false`

Set `security.dialog_enable_delay` to 0

Set `browser.compactmode.show` to `true`

Customize Toolbar >> Density >> Compact

Set `layout.css.devPixelsPerPx` to desired value
(default is 1.0, x200 looks nice with ~0.8)

Disable "Search for text when you start typing" within settings > Browsing


### Website Zoom Levels:

**x230 (1366x758):**

- github.com: 80%
- webassign.net: 70%

**x1c3 (2560x1440):**

- reddit.com: 170%
- youtube.com 140%
