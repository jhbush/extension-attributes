#!/bin/sh
mdmEnrollmentProfileID="00000000-0000-0000-A000-4A414D460003"
enrolled=`/usr/bin/profiles -C | /usr/bin/grep "$mdmEnrollmentProfileID"`

if [ "$enrolled" != "" ]; then
	echo "<result>Enrolled</result>"
else
	echo "<result>Not Enrolled</result>"
fi