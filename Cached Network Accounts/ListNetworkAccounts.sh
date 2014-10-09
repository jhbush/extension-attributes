#!/bin/bash

# Check for AD accounts using OriginalNodeName flag
# Added \n for new line return for results may need removed

NETACCLIST=`/usr/bin/dscl . list /Users OriginalNodeName | awk '{print $1}' 2>/dev/null`

if [ "$NETACCLIST" == "" ]; then
	
        echo "<result>No Network Accounts</result>"

else
        echo -e "<result>\n$NETACCLIST\n</result>"

fi

exit 0