#!/bin/bash

# Checks for rc.server file that corrects a Yosemite FileVault issue

if [ -e /etc/rc.server ]; then
	
	echo "<result>Exists</result>"

else

	echo "<result>Does Not Exist</result>"

fi