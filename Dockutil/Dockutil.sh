#!/bin/bash

# Jason Bush 2015

# Displays the current version of dockutil installed

if [ -f /usr/local/bin/dockutil ] ; then

	RESULT=$( /usr/local/bin/dockutil --version )

	echo "<result>$RESULT</result>"
else
	echo "<result>Not Installed</result>"
fi
