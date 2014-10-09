#!/bin/sh
if [ -f "/Library/Preferences/com.jamfsoftware.jamf.plist" ]; then
validurl=`defaults read /Library/Preferences/com.jamfsoftware.jamf jss_url | grep https://`
	if [[ $validurl = "" ]]; then
		echo "<result>Failed - URL did not contain HTTPS</result>"
	else
		curlresult=`curl $validurl`
			if [[ $curlresult = "" ]]; then
				echo "<result>Failed - curl was unable to connect</result>"
			else
				echo "<result>Success</result>"
			fi
	fi
else
echo "<result>Failed - No jamf 7.3 conf file found</result>"
fi