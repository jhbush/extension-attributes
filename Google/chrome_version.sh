#!/bin/sh

# Detects the current version of Chrome installed

# Jason Bush 2014

if [ -d /Applications/Google\ Chrome.app ] ; then
	
	RESULT=$( defaults read /Applications/Google\ Chrome.app/Contents/Info CFBundleShortVersionString )
	
	echo "<result>$RESULT</result>"
	
else

	echo "<result>Not Installed</result>"
	
fi