#!/bin/sh
currentUser=`last -1 -t console | awk '{print $1}'`

if [ -f "/usr/bin/mcxquery" ]; then
result=`/usr/bin/mcxquery -user "$currentUser" | grep -A 1 -w com.microsoft.autoupdate2 | tail -1 | awk '{print $5}'`
if [ "$result" == "" ]; then
	result="Not set."
fi
fi

echo "<result>$result</result>"