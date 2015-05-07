#!/bin/sh

#Check to see if Cisco AnyConnect is installed
plist="/Applications/Cisco/Cisco AnyConnect Secure Mobility Client.app/Contents/Info.plist"

if [[ -f "$plist" ]]; then    
    result=`/usr/bin/defaults read /Applications/Cisco/Cisco\ AnyConnect\ Secure\ Mobility\ Client.app/Contents/Info.plist CFBundleShortVersionString`
    echo "<result>$result</result>"
else
    echo "<result>Not installed</result>"
fi