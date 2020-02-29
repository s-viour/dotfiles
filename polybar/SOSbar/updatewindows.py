from subprocess import Popen, PIPE, run

p = Popen(["xprop", "-spy", "-root", "_NET_ACTIVE_WINDOW"], stdout=PIPE, stderr=PIPE)

while True:
	p.stdout.readline()
	run(["polybar-msg", "hook", "windows", "1"])
