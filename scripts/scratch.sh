#!/bin/env bash
cd ~/Documents/development/scratches
if (($# != 1)); then
	echo "# list of scratches #"
	ls
	exit
fi
if [ ! -f ./$1 ]; then
	touch $1
fi
subl3 $1