#!/bin/sh

# Returns the "Parent Server" of the installed client, if found

if [ -f /Library/Application\ Support/TrendMicro/common/conf/ServerInfo.plist ]; then
    SERVER=`defaults read /Library/Application\ Support/TrendMicro/common/conf/ServerInfo DisplayName`
else
    SERVER="Not Found"
fi

echo "<result>$SERVER</result>"