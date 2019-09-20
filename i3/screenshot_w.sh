#!/bin/bash
filename="/home/saviour/Pictures/screencaps/screenshot-$(date +%m-%d-%y_%T).png"
gnome-screenshot -w --file=$filename
xclip -selection clipboard -t image/png -i $filename
