#!/bin/sh

# Display the current verison of Microsoft Lync installed.

if [ -d /Applications/Microsoft\ Lync.app ] ; then
	
	RESULT=$( defaults read /Applications/Microsoft\ Lync.app/Contents/Info CFBundleShortVersionString )
	
	echo "<result>$RESULT</result>"
	
else
	
	echo "<result>Not Installed</result>"
	
fi