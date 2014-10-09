#!/bin/sh
jamfKeychain="/Library/Application Support/JAMF/JAMF.keychain"

if [ -f "$jamfKeychain" ]; then
	echo "<result>Enabled</result>"
else
	echo "<result>Not Enabled</result>"
fi