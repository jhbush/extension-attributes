#!/bin/bash

if [ -d /Applications/Parallels\ Desktop.app ] ; then
	
	parallelsVersion=$( defaults read /Applications/Parallels\ Desktop.app/Contents/Info CFBundleGetInfoString | awk -F',' '{ print $1}' )
	
	echo "<result>$parallelsVersion</result>"
	
else

	echo "<result>Not Installed</result>"
	
fi

exit 0