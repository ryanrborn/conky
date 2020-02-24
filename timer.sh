#!/bin/bash

length=`dbus-send --print-reply --dest=org.mpris.MediaPlayer2.io.github.Pithos /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' 2> /dev/null |egrep -A 1 "length"|egrep -v "length"|cut -b 42-|cut -d '"' -f 1|egrep -v ^$`
if [ -z "$length" ]; then
	exit 1
fi
seconds=$((length / 1000000))
minutes=$((seconds / 60))
finalseconds=$(($seconds - $minutes * 60))

totalTime=`printf '%d:%02d' $minutes $finalseconds`

position=`dbus-send --print-reply --dest=org.mpris.MediaPlayer2.io.github.Pithos /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Position' 2> /dev/null | egrep variant | cut -b 24-`
if [ -z "$position" ]; then
	exit 1
fi
seconds=$((position / 1000000))
minutes=$((seconds / 60))
finalseconds=$(($seconds - $minutes * 60))

positionTime=`printf '%d:%02d' $minutes $finalseconds`
echo "$positionTime / $totalTime"
