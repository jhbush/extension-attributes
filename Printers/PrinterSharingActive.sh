#!/bin/bash

# Displays the status of printer sharing

printerSharingStatus=`cupsctl | grep "_share_printers=" | sed 's/_share_printers=//g'`

if [ $printerSharingStatus == 1 ]; then
	
	/usr/sbin/cupsctl --no-share-printers

	/usr/sbin/lpadmin -p ALL -o printer-is-shared="False"

	echo "<result>Disabled</result>"

else 
	
	echo "<result>Disabled</result>"

fi