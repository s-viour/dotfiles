#!/bin/bash

if [ -z "$1" ]
  then
    echo "no file supplied"
    exit 1
fi

ffmpeg -y -i $1 -vf fps=20,scale=512:-1:flags=lanczos,palettegen /tmp/palette.png

ffmpeg -i $1 -i /tmp/palette.png -filter_complex "fps=10,scale=320:-1:flags=lanczos[x];[x][1:v]paletteuse" ./output.gif

rm /tmp/palette.png
