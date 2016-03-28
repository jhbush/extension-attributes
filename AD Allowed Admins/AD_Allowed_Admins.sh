#!/bin/bash

# Displays Allowed Admin Groups for Active Directory

ADDomainCheck=`dsconfigad -show | awk '/Active Directory Domain/{print $NF}'`

if [ "$ADDomainCheck" = "" ]; then
	result="Not Bound to Active Directory"
elif [ "$ADDomainCheck" != "" ]; then
	result=$(dsconfigad -show | grep "Allowed admin groups" | awk 'BEGIN {FS = "="};{print $2}' | sed 's/ //')
	fi
echo "<result>$result</result>"