neofetch
echo -n "exit to login screen? [y/n] "
read -n 1 answer
if [ "$answer" = "y" ]; then
	openbox --exit
fi