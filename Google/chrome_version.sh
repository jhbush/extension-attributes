#!/bin/sh

if [ -d /Applications/Google\ Chrome.app ] ; then
	
	RESULT=$( defaults read /Applications/Google\ Chrome.app/Contents/Info CFBundleShortVersionString )
	
	echo "<result>$RESULT</result>"
	
else

	echo "<result>Not Installed</result>"
	
fi