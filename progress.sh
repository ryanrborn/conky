#!/bin/bash

length=`dbus-send --print-reply --dest=org.mpris.MediaPlayer2.io.github.Pithos /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' 2> /dev/null |egrep -A 1 "length"|egrep -v "length"|cut -b 42-|cut -d '"' -f 1|egrep -v ^$`

position=`dbus-send --print-reply --dest=org.mpris.MediaPlayer2.io.github.Pithos /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Position' 2> /dev/null | egrep variant | cut -b 24-`

if [ -z "$length" ]
then
	exit 1
fi

if [ -z "$position" ]
then
	exit 1
fi

progress=`echo "scale=2; ($position/$length)*100" | bc -q`
echo "$progress"
