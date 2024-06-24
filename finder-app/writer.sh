#!/bin/bash

writefile=$1
writestr=$2

if [ -z $writefile ]; then
	echo "writefile parameter not specified"
	exit 1
fi

if [ -z $writestr ]; then
	echo "writestr parameter not specified"
	exit 1
fi

if [ -e $writefile ]; then
	echo $writestr > $writefile
else
	directory=$(dirname $writefile)
	mkdir -p $directory
	echo $writestr > $writefile
fi

