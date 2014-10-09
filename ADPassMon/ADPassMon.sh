#!/bin/bash

if [ -d /Applications/ADPassMon.app ] ; then
	
	RESULT=$( defaults read /Applications/ADPassMon.app/Contents/Info CFBundleShortVersionString )
	
	echo "<result>$RESULT</result>"
	
else

	echo "<result>Not Installed</result>"
	
fi

exit 0