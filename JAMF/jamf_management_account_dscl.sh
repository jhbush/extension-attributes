#!/bin/sh

# Displays the current management account used by the JSS

apiURL="https://jss.viasat.com:8443/JSSResource/computers/macaddress/"
apiUser="geppetto"
apiPass="IL0vL1nux!"
MacAdd=$( networksetup -getmacaddress en0 | awk '{ print $3 }' | sed 's/:/./g' )

JSSAdmin=$( curl -s -u $apiUser:$apiPass "$apiURL$MacAdd" | xpath /computer/general/remote_management/management_username[1] | sed 's/<management_username>//;s/<\/management_username>//' )

if [[ $(dscl . -search /Users RecordName $JSSAdmin) ]]; then
	
echo "<result>OK - $JSSAdmin</result>"

else

echo "<result>MISSING - $JSSAdmin</result>"

fi
