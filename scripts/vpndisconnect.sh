#!/bin/bash

x=$(cat /tmp/vpnconnection)
sudo systemctl stop pia@$x
sudo systemctl status pia@$x