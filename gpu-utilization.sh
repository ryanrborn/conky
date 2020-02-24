#!/bin/bash

utilization=`nvidia-smi | egrep -A 1 "GeForce" | egrep -v "GeForce" | cut -d '|' -f 4 | cut -c 5- | cut -d '%' -f 1`;

echo $utilization
