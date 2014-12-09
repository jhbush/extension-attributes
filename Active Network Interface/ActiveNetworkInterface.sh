#!/bin/sh

# Jason Bush 2014

# Displays the active network interface

OS=$(sw_vers -productVersion | awk -F. '{print $2}')
if [[ ${OS} -lt 6 ]]; then
if [ -f /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Support/networksetup ];then		
	echo "<result>`/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Support/networksetup -listnetworkserviceorder 2>&1 | grep $(/usr/sbin/netstat -rn 2>&1 | /usr/bin/grep -m 1 'default' | /usr/bin/awk '{ print $6 }') | sed -e "s/.*Port: //g" -e "s/,.*//g"`</result>"
else
	echo "<result>The networksetup binary is not present on this machine.</result>"
fi
else
echo "<result>`/usr/sbin/networksetup -listnetworkserviceorder 2>&1 | grep $(/usr/sbin/netstat -rn 2>&1 | /usr/bin/grep -m 1 'default' | /usr/bin/awk '{ print $6 }') | sed -e "s/.*Port: //g" -e "s/,.*//g"`</result>"
fi