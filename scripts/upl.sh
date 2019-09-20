#!/bin/bash
str=$*
curl -s --upload-file "${str}" https://transfer.sh/file."${str: -3}"