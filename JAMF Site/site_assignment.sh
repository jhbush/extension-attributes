#!/bin/sh

apiURL="https://jss.domain.com:8443/JSSResource/computers/macaddress/"
apiUser="username"
apiPass="password"
MacAdd=$( /usr/sbin/networksetup -getmacaddress en0 | /usr/bin/awk '{ print $3 }' | /usr/bin/sed 's/:/./g' )

siteName=$( /usr/bin/curl -H "Accept: application/xml" -skfu $apiUser:$apiPass "$apiURL${MacAdd}/subset/general" | xmllint --format - | xpath //site 2>&1 | awk -F'>|<' '/name/{print $3}' )
if [[ "$siteName" != "" ]]; then
	echo "<result>$siteName</result>"
else
    echo "<result>Not Available</result>"
fi
