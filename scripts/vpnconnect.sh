#!/bin/bash

if [ $# -eq 0 ]
  then
    pia-tools -l | less
    exit 1
fi

if [[ "$(pia-tools -l)" == *$1* ]];
then
	echo "connecting..."
	sudo systemctl start pia@$1
	sudo systemctl status pia@$1

	touch /tmp/vpnconnection
	echo "$1" > /tmp/vpnconnection
else
	pia-tools -l | less
	exit 1
fi