#!/bin/bash
 
status=` dbus-send --print-reply --dest=org.mpris.MediaPlayer2.io.github.Pithos /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'PlaybackStatus' 2> /dev/null | tail -1 | cut -d "\"" -f2`
if [ -z "$status" ]; then
	exit 1
fi
if [ $status = "Playing" ]; then
	echo "▶"
elif [ $status = "Paused" ]; then
	echo "⏸"
else
	echo $status
fi
