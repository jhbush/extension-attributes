#!/bin/sh

# Jason Bush 2014

# Displays the current network time server

OS=$(sw_vers -productVersion | awk -F. '{print $2}')
if [[ ${OS} -lt 6 ]]; then
if [ -f /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Support/systemsetup ];then		
	echo "<result>`/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Support/systemsetup -getnetworktimeserver | awk '{print $4}'`</result>"
else
	echo "<result>The systemsetup binary is not present on this machine.</result>"
fi
else
echo "<result>`/usr/sbin/systemsetup -getnetworktimeserver | awk '{print $4}'`</result>"
fi