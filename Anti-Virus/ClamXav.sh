#!/bin/sh

# Displays the current version of ClamXav installed

if [ -d /Applications/ClamXav.app ] ; then
	
	RESULT=$( defaults read /Applications/ClamXav.app/Contents/Info CFBundleShortVersionString )
	
	echo "<result>$RESULT</result>"
	
else

	echo "<result>Not Installed</result>"
	
fi