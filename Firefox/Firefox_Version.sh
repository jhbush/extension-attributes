#!/bin/sh

if [ -d /Applications/Firefox.app ] ; then
	
	RESULT=$( defaults read /Applications/Firefox.app/Contents/Info CFBundleShortVersionString )
	
	echo "<result>$RESULT</result>"
	
else

	echo "<result>Not Installed</result>"
	
fi