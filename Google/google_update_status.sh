#!/bin/sh

# Checks the status of Google Chrome updates. If 0 is returned updates are disabled. 

consoleUser=`ls -l /dev/console | cut -d " " -f4`
VALUE=`defaults read /Users/$consoleUser/Library/Preferences/com.google.Keystone.Agent checkInterval`

echo "<result>$VALUE</result>"