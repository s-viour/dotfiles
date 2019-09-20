#!/usr/bin/python3
import os
from sys import argv

if len(argv) < 3:
	print("too few arguments")
	raise SystemExit
elif len(argv) > 3:
	print("too many arguments")
	raise SystemExit

n = argv[1]
p = os.path.join("~/Documents/scripts/", argv[2])
print(p)
if os.path.exists(p):
	os.system("chmod +x {}".format(p))
	with open("~/.zshrc", "a") as f:
		f.write("\nalias {}='{}'".format(n, p))
		f.close()
	with open("~/.bashrc", "a") as f:
		f.write("\nalias {}='{}'".format(n, p))
		f.close()
	print("added existing command '{}' to zshrc as '{}'".format(argv[2], n))
else:
	os.system("touch {}".format(p))
	os.system("chmod +x {}".format(p))
	with open("/home/saviour/.zshrc", "a") as f:
		f.write("\nalias {}='{}'".format(n, p))
		f.close()
	print("created new script {} and opened for editing".format(argv[2]))
	os.system("subl3 {}".format(p))