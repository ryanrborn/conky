#!/bin/bash

id_current=$(cat ~/.conky/conky-pithos/current/current.txt)
id_new=`~/dev/conky/id.sh`
cover=
imgurl=

if [ -z "$id_new" ]
then
	exit 1
fi

if [ "$id_new" != "$id_current" ]; then

	cover=`ls ~/.conky/conky-pithos/covers | grep $id_new`

	if [ "$cover" == "" ]; then

	    imgurl=`~/dev/conky/imgurl.sh $id_new`
	    curl -s $imgurl > ~/.conky/conky-pithos/covers/$id_new.jpg
		# clean up covers folder, keeping only the latest X amount, in below example it is 10
	    rm -f `ls -t ~/.conky/conky-pithos/covers/* | awk 'NR>10'`
	    rm wget-log #wget-logs are accumulated otherwise
	    cover=`ls ~/.conky/conky-pithos/covers | grep $id_new`
	fi

	if [ "$cover" != "" ]; then
		cp ~/.conky/conky-pithos/covers/$cover ~/.conky/conky-pithos/current/current.jpg
	else
		cp ~/.conky/conky-pithos/empty.jpg ~/.conky/conky-pithos/current/current.jpg
	fi

	echo $id_new > ~/.conky/conky-pithos/current/current.txt
fi
