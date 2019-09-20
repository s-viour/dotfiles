#!/bin/python

import sys
import dbus
import argparse


parser = argparse.ArgumentParser()
parser.add_argument(
    '-t',
    '--trunclen',
    type=int,
    metavar='trunclen'
)
parser.add_argument(
    '-f',
    '--format',
    type=str,
    metavar='custom format',
    dest='custom_format'
)
args = parser.parse_args()

# Default parameters
output = '{artist} - {song}'
trunclen = 46


# parameters can be overwritten by args
if args.trunclen is not None:
    trunclen = args.trunclen
if args.custom_format is not None:
    output = args.custom_format

try:
    session_bus = dbus.SessionBus()
    spotify_bus = session_bus.get_object(
        'org.mpris.MediaPlayer2.spotify',
        '/org/mpris/MediaPlayer2'
    )

    spotify_properties = dbus.Interface(
        spotify_bus,
        'org.freedesktop.DBus.Properties'
    )

    metadata = spotify_properties.Get('org.mpris.MediaPlayer2.Player', 'Metadata')

    artist = metadata['xesam:artist'][0]
    song = metadata['xesam:title']

    output = output.format(artist=artist, song=song)

    if len(output) > trunclen:
        output = output[0:trunclen]
        output += '...' 
        if ('(' in output) and (')' not in output):
            output += ')'
    else:
        output += (trunclen - len(output) + 3) * " "
    
    # Python3 uses UTF-8 by default. 
    if sys.version_info.major == 3:
        print(output.format(artist=artist, song=song))
    else:
        print(output.format(artist=artist, song=song).encode('UTF-8'))
except Exception as e:
    if isinstance(e, dbus.exceptions.DBusException):
        output2 = "not playing"
    else:
        output2 = "encountered error"

    if len(output2) > trunclen:
        output2 = output2[0:trunclen]
        output2 += '...' 
        if ('(' in output2) and (')' not in output2):
            output2 += ')'
    else:
        output2 += (trunclen - len(output) + 3) * " "

    print(output2)

