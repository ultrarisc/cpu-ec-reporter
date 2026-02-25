#!/bin/bash
lsmod | grep ledtrig_netdev
Module_flag=$?
if [ "$Module_flag" -eq 0 ];then
	# set activity led
	if [ -d "/sys/class/leds/stmmac-0:00:eth-activity/" ];then
		echo netdev >/sys/class/leds/stmmac-0:00:eth-activity/trigger
		echo 0 >/sys/class/leds/stmmac-0:00:eth-activity/link_10
		echo 0 >/sys/class/leds/stmmac-0:00:eth-activity/link_100
		echo 0 >/sys/class/leds/stmmac-0:00:eth-activity/link_1000
		echo 1 >/sys/class/leds/stmmac-0:00:eth-activity/rx
		echo 1 >/sys/class/leds/stmmac-0:00:eth-activity/tx
	fi
	# set link led
	if [ -d "/sys/class/leds/stmmac-0:00:eth-link/" ];then
		echo netdev >/sys/class/leds/stmmac-0:00:eth-link/trigger
		echo 0 >/sys/class/leds/stmmac-0:00:eth-link/rx
		echo 0 >/sys/class/leds/stmmac-0:00:eth-link/tx
		echo 1 >/sys/class/leds/stmmac-0:00:eth-link/link_10
		echo 1 >/sys/class/leds/stmmac-0:00:eth-link/link_100
		echo 1 >/sys/class/leds/stmmac-0:00:eth-link/link_1000
	fi
	exit 0
fi
