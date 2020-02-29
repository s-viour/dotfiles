#!/bin/bash
pkill polybar

unlink /tmp/ipc-bottom

polybar --config=/home/saviour/documents/dotfiles/polybar/SOSbar/config SOS &
polybar --config=/home/saviour/documents/dotfiles/polybar/SOSbar/config SOS2 &
ln -s /tmp/polybar_mqueue.$! /tmp/ipc-bottom &
/usr/bin/python3 ~/documents/dotfiles/polybar/SOSbar/polybar-spotify-controls/scripts/spotify/py_spotify_listener.py &
/usr/bin/python3 ~/documents/dotfiles/polybar/SOSbar/updatewindows.py
