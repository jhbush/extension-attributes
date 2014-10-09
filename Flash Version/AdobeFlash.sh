#!/bin/bash

if [ -d //Library/Internet\ Plug-Ins/Flash\ Player.plugin ] ; then
	
	flashVersion=$( defaults read /Library/Internet\ Plug-Ins/Flash\ Player.plugin/Contents/version CFBundleShortVersionString )
	
	echo "<result>$flashVersion</result>"
	
else

	echo "<result>Not Installed</result>"
	
fi

exit 0