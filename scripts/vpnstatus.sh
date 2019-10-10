#!/bin/bash

if [ -f "/tmp/vpnconnection" ];
then
	x=$(cat /tmp/vpnconnection)
	sudo systemctl status pia@$x
else
	echo "no vpn activated this session"
fi