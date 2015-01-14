#!/bin/sh

# Displays the status of printer sharing

printerSharingStatus=`cupsctl | grep "_share_printers=" | sed 's/_share_printers=//g'`

if [ $printerSharingStatus == 0 ]; then
echo "<result>Disabled</result>"
else
echo "<result>Enabled</result>"
fi

exit 0

