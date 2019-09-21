unlink /tmp/ipc-bottom

polybar --config=/home/saviour/Documents/dotfiles/polybar/SOSbar/config SOS &
polybar --config=/home/saviour/Documents/dotfiles/polybar/SOSbar/config SOS2 &
ln -s /tmp/polybar_mqueue.$! /tmp/ipc-bottom
/usr/bin/python3 ~/Documents/dotfiles/polybar/SOSbar/polybar-spotify-controls/scripts/spotify/py_spotify_listener.py
