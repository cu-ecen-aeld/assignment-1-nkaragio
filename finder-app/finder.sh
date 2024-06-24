#!/bin/bash

filesdir=$1
searchstr=$2

if [ -z $filesdir ]; then
	echo "filesdir parameter not specified"
	exit 1
fi

if [ -z $searchstr ]; then
	echo "searchstr parameter not specified"
	exit 1
fi


if [ ! -d $filesdir ]; then
	echo "${filesdir} directory does not exist"
	exit 1
fi

list=$(grep -rc $searchstr $filesdir | grep -v ":0")

X=$(echo "$list" | cut -d":" -f1 | sort | uniq | wc -l)

Y=$(echo "$list" | cut -d":" -f2 | awk '{sum+=$1}END{print sum}')

echo "The number of files are ${X} and the number of matching lines are ${Y}"
