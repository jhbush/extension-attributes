#!/bin/bash

################################
# Check Junos Pulse version
################################

if [ -d /Applications/Junos\ Pulse.app ]; then
	
RESULT=`grep -o "DisplayVer.*" /Applications/Junos\ Pulse.app/Contents/Resources/JunosPulseVersion.ini | cut -d'=' -f2`
	
	echo "<result>$RESULT</result>"
	
else

	echo "<result>Not Installed</result>"
	
fi