##########################################################################
# File Name: brightup.sh
# Author: amoscykl
# mail: amoscykl980629@163.com
# Created Time: 2019年08月11日 星期日 08时37分01秒
#########################################################################
#!/bin/zsh
varl=+50
varl=$(($varl + $(cat /sys/class/backlight/intel_backlight/brightness)))
echo $varl > /sys/class/backlight/intel_backlight/brightness
