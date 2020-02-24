#!/bin/bash

album=`dbus-send --print-reply --dest=org.mpris.MediaPlayer2.io.github.Pithos /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' 2> /dev/null |egrep -A 1 "album"|egrep -v "album"|cut -b 44-|cut -d '"' -f 1|egrep -v ^$`
echo $album
