#!/bin/bash

imgurl=`dbus-send --print-reply --dest=org.mpris.MediaPlayer2.io.github.Pithos /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' 2> /dev/null | egrep -A 1 "artUrl" | egrep -v "artUrl"| cut -b 44- | cut -d '"' -f 1`
echo $imgurl
