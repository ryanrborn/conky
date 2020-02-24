#!/bin/bash

result=`ps -ef | grep /usr/bin/pithos | grep -v grep`

if [ "$result" != "" ]; then
	touch /home/ryan/dev/conky/pithos-is-running.txt
else
	rm -f /home/ryan/dev/conky/pithos-is-running.txt
fi

