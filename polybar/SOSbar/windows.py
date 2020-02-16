import subprocess

icons = {
	"unknown": "",
	"google-chrome": "",
	"spotify": "",
	"discord": "",
	"terminal": "",
	"subl3": "",
	"pcmanfm": "",
	"gimp": ""

}



def get_and_split(cmds):
	out = subprocess.check_output(cmds).splitlines()
	for i in range(0, len(out)):
		out[i] = out[i].decode("utf-8")
	return out

out = get_and_split(["wmctrl", "-lx"])
for i in range(0, len(out)):
	out[i] = out[i].split()

current = get_and_split(["wmctrl", "-d"])
for line in current:
	if line.find("*") != -1:
		current = line[0]
		break


strings = []
for app in out:
	if app[1] == current:
		f = app[2].lower()
		found = False
		for i in icons:
			if f.find(i) != -1:
				found = True
				strings.append("%{{A1:wmctrl -i -a {}:}} {} %{{A}}".format(app[0], icons[i]))
				break

		if not found:
			strings.append("%{{A1:wmctrl -i -a {}:}} {} %{{A}}".format(app[0], icons["unknown"]))

for s in strings:
	print(s, end="  ")

if not len(strings):
	print(" ")