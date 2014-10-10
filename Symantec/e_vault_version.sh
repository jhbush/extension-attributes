#!/bin/bash

if [ -d /Library/Application\ Support/Symantec\ Enterprise\ Vault/Enterprise\ Vault\ Toolbar.app ] ; then
	
	RESULT=$( defaults read /Library/Application\ Support/Symantec\ Enterprise\ Vault/Enterprise\ Vault\ Toolbar.app/Contents/Info CFBundleShortVersionString )
	
	echo "<result>$RESULT</result>"
	
else

	echo "<result>Not Installed</result>"
	
fi

exit 0
