#!/bin/bash

MYDOMAIN='YOUR.DOMAIN.COM'

COMPNAME=`scutil --get ComputerName | tr '[:upper:]' '[:lower:]'`

SERVICEACCOUNTPASS=`security 2>&1 >/dev/null find-generic-password -ga $COMPNAME\$ | cut -d'"' -f2`

echo $SERVICEACCOUNTPASS | kinit --password-file=STDIN $COMPNAME\$@$MYDOMAIN

if [[ $? != 0 ]]
then
	echo "<result>"Fail"</result>"
else
	echo "<result>"Pass"</result>"
fi