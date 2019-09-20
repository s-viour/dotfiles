#!/bin/python
import requests
import sys
import json

try:
	cmd = sys.argv[1]
except:
	print("")
try:
	args = sys.argv[2]
except:
	print("")
	args = ""

site_url = "https://wakingtitan.com/terminal"
cmd_data = {"command":cmd, "param[]":args}
cookie_data = {"terminal":"%5B%22atlas%22%2C%22csd%22%2C%222fee0b5b-6312-492a-8308-e7eec4287495%22%2C%2205190fed-b606-4321-a52e-c1d1b39f2861%22%2C%22f7c05c4f-18a5-47a7-bd8e-804347a15f42%22%5D"}

r = requests.post(url=site_url, data=cmd_data, cookies=cookie_data)
json_data = json.loads(r.text)

for line in json_data['data']['message']:
	print(line)