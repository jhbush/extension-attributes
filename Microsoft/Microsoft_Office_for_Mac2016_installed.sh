#!/bin/bash
# Determine if Office for Mac 2016 is insatlled.
count=0
officeApps=( "Excel.app" "Outlook.app" "PowerPoint.app" "Word.app")
for app in ${officeApps[*]}; do
	if [[ -d "/Applications/Microsoft $app" ]]; then
		count=$((count+1))
		else
		count=0
	fi
	done
echo "$count"
if [[ ${count} -eq 4 ]]; then	
	echo "<result>Installed</result>"
 	else
    echo "<result>Not Installed</result>"
fi