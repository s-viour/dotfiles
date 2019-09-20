#!/bin/env bash

clrscr () {
	echo -e "\033[2J\033[1;1H"
}

tabdown () {
	for ((i=1; i<$(tput lines); i+=7)); do
	    echo -e "\n"
	done
}

tabover () {
	for ((i=1; i<$(tput cols); i+=4 )); do
		echo -n " "
	done
}

curdate=$(date +"%Y-%m-%d")
qoddate=$(cat ~/.qodcache | grep '\"date\":' | awk -F ':' '{print $2}' | tr -d '"')
qoddate=${qoddate::-1}

if [ ! $curdate = $qoddate ]; then
	json=$(curl -s https://quotes.rest/qod)
	echo "${json}" > ~/.qodcache
else
	json=$(cat ~/.qodcache)
fi

quote=$(echo "${json}" | grep '\"quote\":' | awk -F ':' '{print $2}' | tr -d '"')
author=$(echo "${json}" | grep '\"author\":' | awk -F ':' '{print $2}' | tr -d '"')

clrscr
tabdown
echo "\"${quote::-1}\""
tabover
echo "~ ${author::-1}"
read