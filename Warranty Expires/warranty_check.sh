#!/bin/sh
#get computer serial number
SerialNumber=$(system_profiler SPHardwareDataType | awk '/Serial/ {print $4}')

#create URL to curl for information
WarrantyURL="https://selfsolve.apple.com/wcResults.do?sn=${SerialNumber}&Continue=Continue&num=0"

#get date and echo result in proper format
date=$(curl -ks $WarrantyURL | grep HWSupportInfo)
if $(echo $date | grep -q "Coverage: Expired"); then
    echo '<result>Expired</result>'
    exit 0
else
    date=$(echo $date | grep -oE 'Expiration Date: .*<br\/>' | cut -c 18- | sed s/'<br\/>'//)
    echo '<result>'$(date -jf"%B %d, %Y " "$date" "+%Y-%m-%d")'</result>'
fi