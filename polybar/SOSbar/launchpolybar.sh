unlink /tmp/ipc-bottom

polybar --config=/home/saviour/.config/polybar/SOSbar/config SOS &
polybar --config=/home/saviour/.config/polybar/SOSbar/config SOS2 &
ln -s /tmp/polybar_mqueue.$! /tmp/ipc-bottom
/usr/bin/python3 ~/.config/polybar/SOSbar/polybar-spotify-controls/scripts/spotify/py_spotify_listener.py
