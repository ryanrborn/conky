#!/bin/bash

temp=`nvidia-smi | egrep -A 1 "GeForce" | egrep -v "GeForce" | cut -d '|' -f 2 | cut -c 6- | cut -d 'C' -f 1 | sed "s/^ *//"`

echo "$temp°C"
