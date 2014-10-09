#!/bin/sh

# Determine the OS version since the networksetup command differs on OS
OS=`/usr/bin/sw_vers -productVersion | /usr/bin/colrm 5`

# Attempt to read the current airport network for the current OS
if [[ "$OS" < "10.5" ]]; then
	if [ -f /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Support/networksetup ]; then
		result=`/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Support/networksetup -getairportnetwork | sed 's/Current AirPort Network: //g'`
	else
		result="The networksetup binary is not present on this machine."
	fi
elif [ "$OS" == "10.5" ]; then
	result=`/usr/sbin/networksetup -getairportnetwork | sed 's/Current AirPort Network: //g'`
elif [ "$OS" == "10.6" ]; then
	result=`/usr/sbin/networksetup -getairportnetwork AirPort | sed 's/Current AirPort Network: //g'`
else
	device=`/usr/sbin/networksetup -listallhardwareports | grep -A 1 Wi-Fi | awk '/Device/{ print $2 }'` 
	result=`/usr/sbin/networksetup -getairportnetwork $device | sed 's/Current Wi-Fi Network: //g'` 
fi

# Ensure that AirPort was found
hasAirPort=`echo "$result" | grep "Error"`

# Report the result
if [ "$hasAirPort" == "" ]; then
	echo "<result>$result</result>"
else
	echo "<result>No AirPort Device Found.</result>"
fi