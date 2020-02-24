#!/bin/bash

id=`dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.io.github.Pithos /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' 2> /dev/null | egrep -A 1 "mpris:trackid" | cut -b 75- | cut -d '"' -f 1 | egrep -v ^$`
echo $id
