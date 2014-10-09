#!/bin/sh
OS=`/usr/bin/sw_vers -productVersion | /usr/bin/colrm 5`
if [[ "$OS" < "10.5" ]]; then
if [ -f /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Support/systemsetup ];then		
	echo "<result>`/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Support/systemsetup -getnetworktimeserver | awk '{print $4}'`</result>"
else
	echo "<result>The systemsetup binary is not present on this machine.</result>"
fi
else
echo "<result>`/usr/sbin/systemsetup -getnetworktimeserver | awk '{print $4}'`</result>"
fi