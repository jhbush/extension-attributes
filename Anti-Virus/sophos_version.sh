#!/bin/bash

if [ -d /Applications/Sophos\ Anti-Virus.app ] ; then
	
	RESULT=$( defaults read /Applications/Sophos\ Anti-Virus.app/Contents/Info CFBundleShortVersionString )
	
	echo "<result>$RESULT</result>"
	
else

	echo "<result>Not Installed</result>"
	
fi

exit 0