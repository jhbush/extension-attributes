#!/bin/sh

if [ -d /usr/local/bin/cocoaDialog.app ] ; then
	RESULT=$( defaults read /usr/local/bin/cocoaDialog.app/Contents/Info.plist CFBundleVersion )
	echo "<result>$RESULT</result>"
else
	echo "<result>Not Installed</result>"
fi
