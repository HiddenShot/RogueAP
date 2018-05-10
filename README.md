# Rogue AP with Raspberry Pi

Tested on Raspberry pi, Raspberry Pi B+ and Raspberry Pi 2 with Raspian.
This is an update to the Rogue_AP script written in python.
The code was migrated to bash to speed up its execution.
It should only be used on a Raspberry Pi or an embedded computer (Orange Pi, etc.). Running it on a PC will cause an error when starting the Rogue AP. 
Please, if you find an error report it on our Twitter: @H11d3nSh0t

--------------------

## Explanation

With the help of the raspberry pi a Rogue AP will be created for an MITM.

The raspberry pi connects to the legitimate router over Ethernet, with an external network interface will connect to a mobile router and to this mobile router will connect a pc or device to establish a connection by ssh with the raspberry pi and run the script for the creation of the Rogue AP. Afterwards, another network interface will be connected to generate the AP.

At the end of the creation of the Rogue AP you can disconnect the network interface with which the raspberry pi was connected to the mobile router. 

When a client tries to connect to the Rogue network all its traffic will be captured by tshark.

--------------------

## Previous work

It is necessary to have aircrack, tshark and bridge utils installed on the raspberry pi.

Install bridge utils:
```shell
sudo apt-get install bridge-utils
```
Install tshark:
```shell
sudo apt-get install tshark
```
It is necessary to configure a couple of things for the correct execution of tshark:
```shell
sudo dpkg-reconfigure wireshark-common
```
and select "yes" to allow any user to capture traffic.
```shell
sudo adduser $USER wireshark
```
to add the user to the Wireshark group.

The following command must also be executed to enable ip forward on the kernel:
```shell
sudo echo 1 > /proc/sys/net/ipv4/ip_forward
```
To configure the default wifi connection network edit the file: /etc/network/interfaces with the parameters under "iface wlan0 inet dhcp":
```shell
wpa-ssid my SSID
wpa-psk my password
```

--------------------

## Installation 

On your Raspberry Pi:

```shell
git clone https://github.com/HiddenShot/RogueAP.git
```
```shell
cd RogueAP
```
```shell
sudo chmod +x rogue.sh
```
```shell
./rogue.sh
```

Follow us on twitter for new updates and other tools: @H11d3nSh0t
Thanks :)

