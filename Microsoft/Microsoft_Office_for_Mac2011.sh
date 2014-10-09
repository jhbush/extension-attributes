#!/bin/sh

if [ -d /Applications/Microsoft\ Office\ 2011 ] ; then
	RESULT=$( defaults read /Applications/Microsoft\ Office\ 2011/Office/MicrosoftComponentPlugin.framework/Versions/14/Resources/Info CFBundleShortVersionString )
	echo "<result>$RESULT</result>"
else
	echo "<result>Not Installed</result>"
fi