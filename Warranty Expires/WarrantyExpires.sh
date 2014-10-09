#!/bin/sh

#	this script was written to query apple's service database to determine warranty coverage
#	base on a system's serial number. This updated version stores the infomration locally so
#	as not to have to query apple's website repeatedly. 


if [ -f /Library/Preferences/com.apple.warranty.plist ]; then
	#	get plist data
	WarrantyDate=`/usr/bin/defaults read /Library/Preferences/com.apple.warranty WarrantyDate`
	WarrantyStatus=`/usr/bin/defaults read /Library/Preferences/com.apple.warranty WarrantyStatus`
	
	#	convert dates to integers 
	ExpirationDate=`/bin/date -j -f  "%Y-%m-%d" "${WarrantyDate}" +%s`
	TodaysDate=`/bin/date +%s`
	
	#	if warranty is listed as active but date is expired, update plist entry
	if [ "${WarrantyStatus}" == "Active" ] && [ ${TodaysDate} -gt ${ExpirationDate} ]; then 
		WarrantyStatus="Inactive"
		/usr/bin/defaults write /Library/Preferences/com.apple.warranty WarrantyStatus ${WarrantyStatus}
		echo Status updated.
	else
		echo Status unchanged.
	fi
	echo "<result>${WarrantyStatus} : ${WarrantyDate}</result>"
	exit 0
fi


#	set temp file
WarrantyTempFile="/tmp/warranty.$(date +%s).txt"


#	get serial number
SerialNumber=`ioreg -l | awk '/IOPlatformSerialNumber/ { split($0, line, "\""); printf("%s\n", line[4]); }'`
if [ -z "${SerialNumber}" ]; then
		echo "Serial Number not found."
		exit 1
fi


#	query url
WarrantyURL="https://selfsolve.apple.com/wcResults.do?sn=${SerialNumber}&Continue=Continue&num=0"
WarrantyInfo=$(curl -k -s $WarrantyURL | awk '{gsub(/\",\"/,"\n");print}' | awk '{gsub(/\":\"/,":");print}' | sed s/\"\}\)// > ${WarrantyTempFile})


#	check validity of serial number
InvalidSerial=$(grep 'invalidserialnumber\|productdoesnotexist' "${WarrantyTempFile}")
if [[ -n "${InvalidSerial}" ]]; then
	echo "Invalid Serial Number."
	exit 2
fi


#	determine warranty status	
WarrantyStatus=$(grep displayHWSupportInfo "${WarrantyTempFile}")
if [[ $WarrantyStatus =~ "Active" ]]; then
	WarrantyStatus="Active"
else
	WarrantyStatus="Inactive"
fi


#	check for exirpation date
if [[ `grep displayHWSupportInfo "${WarrantyTempFile}"` ]]; then
	WarrantyDate=`grep displayHWSupportInfo "${WarrantyTempFile}" | grep -i "Estimated Expiration Date:"| awk -F'<br/>' '{print $2}'|awk '{print $4,$5,$6}'`
fi


#	convert format of date
if [[ -n "$WarrantyDate" ]]; then
	WarrantyDate=$(/bin/date -jf "%B %d, %Y" "${WarrantyDate}" +"%Y-%m-%d") > /dev/null 2>&1 
else
	WarrantyDate="N/A"
fi


#	write status and date to plist
if [[ -n "$WarrantyStatus" ]] && [[ -n "$WarrantyDate" ]]; then
	/usr/bin/defaults write /Library/Preferences/com.apple.warranty WarrantyStatus ${WarrantyStatus}
	/usr/bin/defaults write /Library/Preferences/com.apple.warranty WarrantyDate ${WarrantyDate}
fi
	

echo Serial Number: "${SerialNumber}"
echo Warranty Status: ${WarrantyStatus}
echo Warranty Expiration: ${WarrantyDate}

echo "<result>${WarrantyStatus} : ${WarrantyDate}</result>"