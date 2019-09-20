#!/usr/bin/python3
import os
from os.path import expanduser
from sys import argv
import urllib
import urllib.request

def convert_url(url):
	h_id = url.replace("https://hastebin.com/", "")
	return h_id


def dl(h_id):
	url = "https://hastebin.com/raw/"
	url += h_id
	print(url)
	req = urllib.request.Request(url, headers={'User-Agent' : "Magic Browser"})
	remote = urllib.request.urlopen(req)
	script = remote.read()
	return script


def write(name, file, script):
	home = expanduser("~")
	file_path = home + "/Documents/scripts/"
	file_path += file
	if (os.path.exists(file_path)):
		os.system("rm " + file_path)
	os.system("touch " + file_path)
	os.system("chmod +x " + file_path)
	with open(file_path, "w+") as f:
		f.write(script)
		f.close()
	with open(home + "/.zshrc", "a") as f:
		f.write("\nalias {}='{}'".format(name, file_path))
		f.close()
	with open(home + "/.bashrc", "a") as f:
		f.write("\nalias {}='{}'".format(name, file_path))
		f.close()


if len(argv) < 4:
	print("too few arguments")
	raise SystemExit
elif len(argv) > 4:
	print("too many arguments")
	raise SystemExit

h_id = convert_url(argv[1])
script = dl(h_id)
write(argv[2], argv[3], script.decode("utf-8"))
print("downloaded script: {}".format("https://hastebin.com/" + h_id))