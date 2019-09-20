#!/bin/bash
touch /tmp/ethereum_key.txt
echo $1 > /tmp/ethereum_key.txt
cd ~/.ethereum/geth
geth account import /tmp/ethereum_key.txt
rm /tmp/ethereum_key.txt