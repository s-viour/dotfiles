#!/bin/bash

clear
neofetch
echo -n "are you sure you want to logout? [yes/no] "
read answer

if [[ "$answer" == "yes" ]]; then
	i3-msg exit
fi
