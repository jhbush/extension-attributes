#!/bin/sh

# Checks if the mach_kernel file is hidden or not

hiddenflagstatus=`stat -r /mach_kernel | awk '{print $15}'`

if [ "$hiddenflagstatus" = "32768" ]
 
then
	
	echo "<result>Hidden</result>"

else

	echo "<result>Not Hidden</result>"

fi

	exit 0