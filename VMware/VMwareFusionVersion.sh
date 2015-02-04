#!/bin/sh

# Displays the current version of VMware Fusion installed.

if [ -d /Applications/VMware\ Fusion.app ] ; then
	RESULT=$( defaults read /Applications/VMware\ Fusion.app/Contents/Info CFBundleShortVersionString )
	echo "<result>$RESULT</result>"
else
	echo "<result>Not Installed</result>"
fi