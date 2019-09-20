#!/bin/bash
filename="/home/saviour/Pictures/screencaps/screenshot-$(date +%m-%d-%y_%T).png"
gnome-screenshot -a --file=$filename
xclip -selection clipboard -t image/png -i $filename
