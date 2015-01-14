#!/bin/sh

# Displays the current version of Sophos Anti-Virus installed

if [ -d /Applications/Sophos\ Anti-Virus.app ] ; then
	
	RESULT=$( defaults read /Applications/Sophos\ Anti-Virus.app/Contents/Info.plist CFBundleShortVersionString )
	
	echo "<result>$RESULT</result>"
	
else
	
	echo "<result>Not Installed</result>"
	
fi