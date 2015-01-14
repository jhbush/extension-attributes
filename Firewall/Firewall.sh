#!/bin/sh

# Displays the current status of the built in firewall

OS=$(sw_vers -productVersion | awk -F. '{print $2}')
if [[ ${OS} -lt 6 ]]; then		
result=`/usr/bin/defaults read /Library/Preferences/com.apple.sharing.firewall state`
if [ "$result" == "YES" ]; then
	echo "<result>On</result>"
elif [ "$result" == "NO" ]; then
	echo "<result>Off</result>"
fi
else
result=`/usr/bin/defaults read /Library/Preferences/com.apple.alf globalstate`
if [ "$result" == "0" ]; then
	echo "<result>Off</result>"
else
	echo "<result>On</result>"
fi
fi