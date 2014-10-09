#!/bin/sh

if [ -d "/Library/Application Support/VMware/" ]; then
	
result=`cat /Library/Preferences/VMware\ Fusion/license-fusion* | grep Serial | awk '{print $3}' | sed 's/"//g'`

echo "<result>$result</result>"

else

echo "<result>Not Installed</result>"

fi