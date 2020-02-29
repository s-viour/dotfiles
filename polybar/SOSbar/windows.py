import subprocess
import sys

icons = {
	"unknown": "",
	"google-chrome": "",
	"spotify": "",
	"discord": "",
	"terminal": "",
	"subl3": "",
	"pcmanfm": "",
	"gimp": "",
	"xreader": ""

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

active_window_class = None
try:
	active_window = subprocess.check_output(["xdotool", "getactivewindow"]).decode("UTF-8")
	active_window_xprop = subprocess.check_output(["xprop", "-id", active_window]).decode("UTF-8")

	for line in active_window_xprop.splitlines():
		if line.find("WM_CLASS(STRING)") != -1:
			active_window_class = line
			break

except Exception:
	pass

if active_window_class:
	active_window_class = active_window_class.split("=")[1].strip().replace("\"", "").split()[1].lower()

strings = []
for app in out:
	if app[1] == current:
		f = app[2].lower()
		found = False
		for i in icons:
			if f.find(i) != -1:
				if f.find(active_window_class) != -1:
					found = True
					strings.append("%{{B#7a8587}}%{{A1:wmctrl -i -a {}:}} {} %{{A}}%{{B-}}".format(app[0], icons[i]))
					break

				found = True
				strings.append("%{{A1:wmctrl -i -a {}:}} {} %{{A}}".format(app[0], icons[i]))
				break

		if not found:
			strings.append("%{{A1:wmctrl -i -a {}:}} {} %{{A}}".format(app[0], icons["unknown"]))

for s in strings:
	print(s, end=" ")

if not len(strings):
	print(" ")