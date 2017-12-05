#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

# Deluge | Debian

# VERSION CHOICE
ver="y"
echo "Install Deluge?:"
read -p "Type yes or no (y/n):" ver
if [ "$ver" = "" ]; then
	ver="y"
fi


	get_char()
	{
	SAVEDSTTY=`stty -g`
	stty -echo
	stty cbreak
	dd if=/dev/tty bs=1 count=1 2> /dev/null
	stty -raw
	stty echo
	stty $SAVEDSTTY
	}
	echo ""
	echo "Press any key to start...or Press Ctrl+c to cancel"
	char=`get_char`

# START
if [ "$ver" = "y" ]; then
	
	apt-get update
	apt-get -y install python-software-properties software-properties-common
	add-apt-repository ppa:deluge-team/ppa -y
	apt-get update
	apt-get install -y deluged deluge-web
	deluged
	deluge-web --fork
	sed -i 's/exit 0/#exitwdwy/' /etc/rc.local
	sed -i '/#exitwdwy/a\deluge-web' /etc/rc.local
	sed -i '/#deluge-web/a\exit 0' /etc/rc.local
	

	
	
else
exit
fi

# END
clear
echo "Congratulations!"
echo "Modified by wdwy"
echo "WebUI: http://your ip:8112/"
echo "Default password: deluge"