##########################################################################
# File Name: install.sh
# Author: Dimerbone
# mail: 15857404828@163.com
# Created Time: 2020年01月05日 星期日 16时32分30秒
#########################################################################
#!/bin/zsh
#PATH=/home/edison/bin:/home/edison/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/work/tools/gcc-3.4.5-glibc-2.3.6/bin
#export PATH
echo
echo -e "\033[1;5;31mThink twice before going further.The proccess will irreversibly change local files!(May contain this installation file) \033[0m "
echo -e "\033[1;32mSelect programes & configs you want to install. \033[0m"
echo -e "\033[43;1;30m 1 \033[0m Vim"
echo -e "\033[43;1;30m 2 \033[0m i3"
echo -e "\033[43;1;30m 3 \033[0m Polybar"
echo -e "\033[43;1;30m 4 \033[0m Rofi"
echo -e "\033[43;1;30m 5 \033[0m Dunst"
echo -e "\033[43;1;30m 6 \033[0m Mpd&Ncmpcpp"
echo -e "\033[43;1;30m 7 \033[0m urxvt"
echo -e "\033[43;1;30m A \033[0m ALL"
echo
echo -e "\033[1;33m==> \033[0mEnter n° to select(Example:1 2 3)"
echo -e "\033[1;33m==> \033[0m------------------------------"
echo -n -e "\033[1;33m==> \033[0m" && read str1
######
pwd=$(pwd -P)
vim="vim "
i3="i3 "
polybar="polybar "
rofi="rofi "
dunst="dunst "
mpd="mpd ncmpcpp "
urxvt="urxvt"
all=$vim$i3$polybar$rofi$dunst$mpd$urxvt
ist=""
pacman_S=""
pacman_U=""
aur=""
######
if [[ $str1 =~ "1" ]];then
  hash vim 2>/dev/null || pacman_S=$pacman_S$vim
  ist=$i3
fi

if [[ $str1 =~ "2" ]];then
  echo -e "\033[1;32mAdvanced selections for i3 \033[0m"
  echo -e "\033[1;33m==> \033[0m \033[1;37mtype n° to select. [0m"
  echo -e "\033[43;1;30m 1 \033[0m Use i3lock-fancy instead of i3lock \033[0m"
  echo -e "\033[43;1;30m 2 \033[0m Install cmatrix \033[0m"
  echo -e "\033[43;1;30m 3 \033[0m Install utools \033[0m"
  echo -n -e "\033[1;33m==> \033[0m" && read str2
  
  if [[$str2 =~ "1"]];then
    aur=$aur$("i3lock-fancy")
  else
    replace $pwd/.config/i3/config "i3lock-fancy" "i3lock"
    pacman_S=$pacman_S$("i3lock")
  fi
  
  if [[$str2 =~ "2"]];then
    pacman=$pacman_S$("cmatrix")
  else
    sed -i "63s/^/#/" $pwd/.config/i3/config
  fi
  
  if [[$str2 =~ "3"]];then
    pacman_U=$pwd/utools-0.7.1beta-1-x86_64.pkg.tar.xz
  fi
  
  echo -e "\033[1Type path of wallpaper if you want to use your own ones, or type nothing to use mine. \033[0m"
  echo -e -n "\033[1;33m==> \033[0m" && read str3
  if [ "$str3" == ""];then
    $ist=$ist$("wallpaper")
  else
    sed -i "s/"~/Pictrues/1486262446001.png"/$str3/g" $pwd/.config/i3/config
  fi
  
fi

#if [[$str1 =~ "3"]];then
#fi

#if [[$str1 =~ "4"]] && ist=$ist$rofi
#fi

#if [[$str1 =~ "5"]] && ist=$ist$mpd
#fi

#if [[$str1 =~ "A"]] && ist=$all
#fi
######

