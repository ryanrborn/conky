#!/bin/bash

name=`nvidia-smi | grep "GeForce" | cut -c 8- | cut -d ' ' -f 1-3`

echo $name
