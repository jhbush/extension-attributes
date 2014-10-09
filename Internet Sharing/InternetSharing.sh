#!/bin/sh

if [ "`/usr/libexec/PlistBuddy -c "Print :NAT:Enabled" /Library/Preferences/SystemConfiguration/com.apple.nat.plist`" == 1 ]; then
	echo "<result>Fail (Internet Sharing Enabled)<result>"
else
	echo "<result>Pass (Internet Sharing Disabled)</result>"
fi