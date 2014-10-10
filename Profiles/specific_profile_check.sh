#!/bin/sh

# Check for specific MDM Profile

profiles=`profiles -C -v | grep attribute | awk '/name/{$1=$2=$3=""; print $0}' | grep "MDM Profile"`
if [[ ! -z "$profiles" ]]; then
	echo "<result>$profiles</result>"
else
	echo "<result>Not Installed</result>"
fi

exit 0