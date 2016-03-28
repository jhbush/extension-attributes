#!/bin/sh

if [ -d /Applications/Autonomy/Connected\ Backup ] ; then
	RESULT=$( defaults read /Applications/Autonomy/Connected\ Backup/Connected\ Backup.app/Contents/Info CFBundleShortVersionString )
	echo "<result>$RESULT</result>"
else
	echo "<result>Not Installed</result>"
fi
