#!/bin/bash

user=`last -1 | awk '{print $1}'`

idleTime=`defaults read /Users/$user/Library/Preferences/ByHost/com.apple.screensaver.* | grep idleTime | awk '{print $3}' | cut -f1 -d';'`

echo "<result>$idleTime</result>"

exit 0