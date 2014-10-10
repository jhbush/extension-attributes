#!/bin/sh

# Check if Cisco AnyConnect is installed and if so what version is installed

if [ -d /Applications/Cisco ] ; then
	RESULT=$( cat /opt/cisco/anyconnect/ACManifestVPN.xml | grep "file version" | awk '{print $2}' | cut -d= -f2 | sed 's/"//g' )
	echo "<result>$RESULT</result>"
else
	echo "<result>Not Installed</result>"
fi