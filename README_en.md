# Configures and Dependences of my own

![screenshot.png](https://github.com/Dimerbone/dotfiles/blob/master/screenshot.png)

<!--more-->

# README in Chinese

[README_zh_cn](https://github.com/Dimerbone/dotfiles/blob/master/README.md)

<!--more-->

# general situation

The supported modules：

1. [alsa](#alsa)
2. [backlight](#backlight)
3. [date](#date)
4. [notify (based on dunst)](#notify)
5. [upload](#upload)
6. [download](#upload)
7. [battery](#battery)
8. [keyboard](#keyboard)
9. [filesystem](#filesystem)
10. [mpd](#mpd)
11. [i3](#i3)
12. [weather](#weather)
13. [info-hackspeed](#info-hackspeed)
14. [daily-poem](#daily-poem)
15. [temperature](temperature)
16. [memory](#memory)
17. [cpu](#cpu)

Dependence：

1. [Font Awesome](https://www.archlinux.org/packages/community/any/ttf-font-awesome/)
2. bdf-unifont（AUR）
3. ttf-fira-code（AUR）
4. [Weather Icon](https://github.com/erikflowers/weather-icons)、jq（required by weather[polybar] module）
5. Dunst （required by notify[polybar] module）
6. mpd、ncmpcpp、mpc（required by mpd[polybar] & music[i3] modules）
7. unicode-rxvt（urxvt）（AUR）
8. compton
9. feh（required by rofi[i3] module）
10. fcit-sogoupinyin、fcitx-configtool、fcitx-lilydjwg-git（AUR）
11. rofi（required by rofi[i3] module）
12. [electron-ssr](https://github.com/shadowsocksrr/electron-ssr/releases/)
13. utool（uploaded）
14. cmatrix
15. vundle（required by vim）
16. xdotool（required by notify[polybar] module）
17. powerline-fonts
18. ttf-monaco

Desktop-background:/图片/148626446001.png

![background](https://github.com/Dimerbone/dotfiles/blob/master/图片/1486262446001.png)

<!--more-->

# Modules

## alsa

Display current volume，There are three different color ICONS depending on the volume.
| Action | Event |
| :------: | :------: |
| Left-click the mouse | mute/unmute |
| Upward roller | volume +5% every time |
| Downward rooller | volume -5% every time |

## backlight

change screen luminance by rewriting/sys/class/backlight/intel_backlight/brightness，related scripts and configs are in .config/i3/

## date

Display the time.

| Action | Event |
| :--------------------: | :---------------------: |
| Left-click the mouse | Toggle between date and time |

## notify

Display messages.

| Action | Event |
| :------: | :---------------------------------: |
| Left-click the mouse | simulate ctrl+grave -- default dunst shortcut to view history(s)，it'll be overwritten by other shortcuts |

## upload

Display upload and download speed，you are supposed to overwrite .config/polybar/config `wlp3s0` and `enp2s0` with your own Ethernet device.


## battery

Display battery information，you maybe need to reset`battery-full-at`、`battery-bat` and `battery-adp` fields in .config/polybar/config.

## keyboard

Keyboard caps lock is displayed. Because the keyboard I use does not have NumLock, it is not supported for the time being.Add it yourself if you need it.

## systray

My system is Manjaro dde community edition, i3 version 4.16.1, polybar version 3.4.0, according to this configuration, there is no display error.If there's a problem, you can look it up in the official issues. There are quite a lot of people with icon problems.

## mpd

Displays MPD information, which is hidden when the MPD process does not exist. There are three ways to display MPD information: ** playing **, ** pause **, and ** stop **.

- display content including *Pause*,*Next*,*suspended*,*next*,*stop*,*list cycle*,*single playing*,*random* and *singer - title*.

`mpd-host` and `mpd-port` need to be set in .config/mpd/mpd.conf.

## i3

Display icons of i3 workspaces，the iconscanbe reset in .config/i3/config.

| Action | Event |
| :------: | :------: |
| Left-click the mouse | i3-msg workspace <index> |
| Upward roller | i3-msg workspace prev    |
| Downward roller | i3-msg workspace next    |


## weather

Display Openweather information using the script from[openweather-fullfeatured](https://github.com/polybar/polybar-scripts/tree/master/polybar-scripts/openweathermap-fullfeatured),personal API and city code are required, reset them in .config/polybar/script/openweather-fuulfeatured,read project Readme for details.

## info-hackspeed

Display inputting speed，the default unit is cpm (char per minute)，the unit wpm (word per minute) is available，set it in config/polybar/script/info-hackspeed.sh.The script is from [info-hackspeed](https://github.com/polybar/polybar-scripts/tree/master/polybar-scripts/info-hackspeed).

## daily-poem

Show daily Chinese poems，V友@lhx2008[Daily-poem API](https://www.jinrishici.com/) is used，displaying poetry contents, sources, and matching key words are supported.Please replace the token in .config/polybar/config after getting the token from https://v2.jinrishici.com/token.

| Action | Event |
| :------: | :--------: |
| Left-click the mouse | Display poetry content |
| Upward roller | Display poetry source |
| Downward roller | Display matching key words |
| Right-click the mouse | Update poems |

## filesystem

Show root space usage

## temperature

Display temperature，you can set `thermal-zone` in .config/polybar/config，the default value is 0.Toggle lowest temerature displaying when the temperature is lower than `base-temperature`，Toggle warning temperature displaying when it is higher than `warn-temperature`，the color of the Temperature Icon will automatically change according to `base-temperature`and`warn-temperature`，change their values according to your own situation.

## memory

Display memory situation，the layout is used/total.

## cpu

Display cpu information.
