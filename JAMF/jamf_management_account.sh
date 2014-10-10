#!/bin/sh

# Displays the current management account used by the JSS

apiURL="https://jss.yourdomain.com:8443/JSSResource/computers/macaddress/"
apiUser="user"
apiPass="password"
MacAdd=$( networksetup -getmacaddress en0 | awk '{ print $3 }' | sed 's/:/./g' )

ManAccount=$( curl -s -u $apiUser:$apiPass "$apiURL$MacAdd" | xpath /computer/general/remote_management/management_username[1] | sed 's/<management_username>//;s/<\/management_username>//' )

if [[ "$ManAccount" != "" ]]; then
	
	echo "<result>OK - $ManAccount</result>"
	
else

	echo "<result>MISSING - $ManAccount</result>"
	
fi