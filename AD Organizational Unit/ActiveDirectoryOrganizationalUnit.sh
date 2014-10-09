#!/bin/sh
ad_computer_name=`dsconfigad -show | grep "Computer Account" | awk '{print $4}'`
ad_computer_ou=`dscl /Search read /Computers/$ad_computer_name | \
grep -A 1 dsAttrTypeNative:distinguishedName | \
cut -d, -f2- | sed -n 's/OU\=//gp' | \
sed -n 's/\(.*\),DC\=/\1./gp' | \
sed -n 's/DC\=//gp' | \
awk -F, '{
N = NF
while ( N > 1 )
{
printf "%s/",$N
N--
}

printf "%s",$1
}'`

echo "<result>$ad_computer_ou</result>"