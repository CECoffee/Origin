# 自用配置及依赖仓库

![screenshot.png](https://github.com/Dimerbone/dotfiles/blob/master/screenshot.png)

<!--more-->

# README in English

[README_en](https://github.com/Dimerbone/dotfiles/blob/master/README_en.md)

<!--more-->

# 概况

支持的 module：

1. [alsa](#alsa)
2. [backlight](#backlight)
3. [date](#date)
4. [notify (基于dunst)](#notify)
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

依赖：

1. [Font Awesome](https://www.archlinux.org/packages/community/any/ttf-font-awesome/)
2. bdf-unifont（AUR）
3. ttf-fira-code（AUR）
4. [Weather Icon](https://github.com/erikflowers/weather-icons)、jq（weather[polybar]组件需要）
5. Dunst （notify[polybar]组件显示历史通知需要）
6. mpd、ncmpcpp、mpc（mpd[polybar]、music[i3]组件需要）
7. unicode-rxvt（urxvt）（AUR）
8. compton
9. feh
10. fcit-sogoupinyin、fcitx-configtool、fcitx-lilydjwg-git<aur>
11. rofi（rofi[i3]组件需要）
12. [electron-ssr](https://github.com/shadowsocksrr/electron-ssr/releases/)
13. utool（已上传）
14. cmatrix
15. vundle（vim需要）
16. xdotool（notify[polybar]组件需要）
17. powerline-fonts
18. ttf-monaco

前排提示，polybar配合[官方wiki](https://github.com/polybar/polybar/wiki)食用口味更佳。

壁纸:/图片/148626446001.png

![壁纸](https://github.com/Dimerbone/dotfiles/blob/master/图片/1486262446001.png)

<!--more-->

# Modules

## alsa

显示当前音量，根据音量共有三种不同颜色图标。默认声卡选择为`default`，可以在.config/polybar/config里调整声卡选项。

| 绑定     | 事件             |
| -------- | ---------------- |
| 鼠标左击 | 静音/恢复        |
| 滚轮上   | 音量 +，每次 +5% |
| 滚轮下   | 音量 -，每次 -5% |

## backlight

通过写入/sys/class/backlight/intel_backlight/brightness以改变屏幕亮度，配置位于.config/i3/

## date

显示时间。

| 绑定     | 事件              |
| -------- | ----------------- |
| 鼠标左击 | 切换日期/时间显示 |

## notify

通知图标。

| 绑定     | 事件                                                         |
| -------- | ------------------------------------------------------------ |
| 鼠标左击 | 模拟 ctrl+grave，即默认的 dunst 历史快捷键，会被其他快捷键设定覆盖 |

## upload & download

显示上传及下载速度，单位为KB/s，需要在.config/polybar/config中`interface`字段设置自己的网络设备。


## battery

显示电池信息，需要在`nord-config`中设置`battery-full-at`、`battery-bat`以及`battery-adp`字段。

## keyboard

显示键盘大写锁定。因为使用的键盘没有 NumLock，所以暂时不支持，如果需要可以自行添加。

## systray

显示系统托盘。我的系统是 Manjaro dde 社区版，i3 版本 4.16.1，polybar 版本 3.4.0，按照如此配置没有产生显示错误。如果遇到问题可以到官方 issue 中查找，有图标问题的人挺多的。

## mpd

显示 mpd 信息，当 mpd 进程不存在时隐藏。总共有三种显示方式，分别为**播放中**、**暂停**以及**停止**。

- 显示内容包括*暂停*、*上一首*、、*下一首*、*停止*、*列表循环*、*单曲循环*、*列表随机*以及*歌手 - 歌名*.

需要在.config/mpd/mpd.conf中设置`mpd-host`及`mpd-port`。

## i3

显示 i3 workspace 图标，图标可在.config/i3/config中定义。

| 绑定     | 事件                     |
| -------- | ------------------------ |
| 鼠标左击 | i3-msg workspace <index> |
| 滚轮上   | i3-msg workspace prev    |
| 滚轮下   | i3-msg workspace next    |


## weather

显示 Openweather 天气信息，使用的脚本来自于[openweather-fullfeatured](https://github.com/polybar/polybar-scripts/tree/master/polybar-scripts/openweathermap-fullfeatured)，需要个人API及城市代码，在脚本中设置，具体情况可查看项目 Readme。

## info-hackspeed

显示每分钟输入速度，单位默认为 cpm (char per minute)，可选 wpm (word per minute)，在脚本中设置。来自于[info-hackspeed](https://github.com/polybar/polybar-scripts/tree/master/polybar-scripts/info-hackspeed)。

## daily-poem

显示今日诗词，使用了 V友@lhx2008 分享的[今日诗词 API](https://www.jinrishici.com/)，支持显示诗词推荐、来源以及匹配标签。使用需 token，可到 https://v2.jinrishici.com/token 获取 token 后替换.config/polybar/config中的 token。

| 绑定     | 事件         |
| -------- | ------------ |
| 鼠标左击 | 显示诗词内容 |
| 滚轮上   | 显示诗词来源 |
| 滚轮下   | 显示匹配标签 |
| 鼠标右击 | 更新诗词     |

## filesystem

显示根目录空间占用率

## temperature

显示温度，可在.config/polybar/config中设置`thermal-zone`，默认为0。当温度低于`base-temperature`时切换为最低温度显示，当温度高于`warn-temperature`时切换为警戒温度显示，温度图标颜色会根据温度在`base-temperature`到`warn-temperature`之间变化，根据自身情况设置合理的值即可。

## memory

显示内存使用情况，格式为 used/total。

## cpu

显示 cpu 使用情况。
