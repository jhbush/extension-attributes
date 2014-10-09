#!/bin/bash

if [ -d /Library/Internet\ Plug-Ins/Flip4Mac\ WMV\ Plugin.plugin ]; then 
	
	RESULT=$( defaults read /Library/Internet\ Plug-Ins/Flip4Mac\ WMV\ Plugin.plugin/Contents/Info CFBundleShortVersionString )

echo "<result>$RESULT</result>"

else

echo "<result>Not Installed</result>"

fi

exit 0