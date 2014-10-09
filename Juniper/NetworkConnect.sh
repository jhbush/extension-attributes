#!/bin/sh

# Checks the version of Juniper Network Connect

if [ -d /Applications/Network\ Connect.app ] ; then
	
RESULT=`cat /Applications/Network\ Connect.app/Contents/Resources/en.lproj/InfoPlist.strings | grep CFBundleShortVersionString | awk '{print $5}' | sed 's/";//g'`
	 
	echo "<result>$RESULT</result>"
	
else

	echo "<result>Not Installed</result>"
	
fi