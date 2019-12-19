##########################################################################
# File Name: bright.sh
# Author: Dimerbone
# mail: 2298843694@qq.com
# Created Time: 2019年08月15日 星期四 10时05分35秒
#########################################################################
#!/bin/zsh
#PATH=/home/edison/bin:/home/edison/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/work/tools/gcc-3.4.5-glibc-2.3.6/bin
#export PATH

echo "Please type in your password to access brightness controller."&&sudo chmod 777 /sys/class/backlight/intel_backlight/brightness && echo "Brightness Controller Accessed" && sleep 4s
