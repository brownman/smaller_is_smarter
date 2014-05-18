#!/bin/bash
# about file:
# plugin:        take_photo.sh 
# description:   take a picture   
#. $TIMERTXT_CFG_FILE
#depend_package: ffmpeg video4linux2 flite xcowsay fortune
dir1=~/Pictures
set -o nounset


snap(){
    flite 'smile everyone'

    sleep 1
    flite 'say - cheeers!'
   #,-  say cheers'
    sleep 1
    #echo4 "$last_camera_before" 
    pic_file1=/tmp/monkey.jpeg
    pic_file2=$(echo $dir1/webcam-$(date +%m_%d_%Y_%H_%M).jpeg)
    ffmpeg -y -r 1 -t 3 -f video4linux2 -vframes 1 -s sxga -i /dev/video0 $pic_file1
    #echo4 "$last_camera_after" 
    (/usr/bin/xterm -e xloadimage $pic_file1 &)
    fortune=`fortune`; 
    #printf %s "<span foreground='blue' size='x-large'>$fortune</span> <i>:)</i>!" | 
#--cow-size=rms $* 
    xcowfortune  --time=15 --think --at=0,0
#    echo "$fortune" |  xcowsay  --image /tmp/monkey.jpeg --cow-size=rms $* 
    #(xloadimage $uml_pic &)
    flite 'you ugly'
}

snap
