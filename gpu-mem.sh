#!/bin/bash

max=`nvidia-smi | egrep -A 1 "GeForce" | egrep -v "GeForce" | cut -d '|' -f 3 | cut -d '/' -f 2 | cut -d 'M' -f 1`
min=`nvidia-smi | egrep -A 1 "GeForce" | egrep -v "GeForce" | cut -d '|' -f 3 | cut -d '/' -f 1 | cut -d 'M' -f 1`

mem=`echo "scale=2; ($min/$max)*100" | bc -q`

echo $mem
