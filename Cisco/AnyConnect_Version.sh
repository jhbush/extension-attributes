#!/bin/sh

# Check if Cisco AnyConnect is installed and if so what version is installed

if [ -d /Applications/Cisco ] ; then
	RESULT=$( awk -F'"' '/file version/{print $2}' /opt/cisco/anyconnect/ACManifestVPN.xml )
	echo "<result>$RESULT</result>"
else
	echo "<result>Not Installed</result>"
fi