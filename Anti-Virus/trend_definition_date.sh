#!/bin/sh

# Returns current virus definition date, if found

if [ -f /Library/Application\ Support/TrendMicro/common/conf/tmccmac.conf.plist ]; then
    DATE=`/usr/libexec/PlistBuddy -c "print :ACTIVEUPDATE:LastUpdateDatePatternV" /Library/Application\ Support/TrendMicro/common/conf/tmccmac.conf.plist`
    DATE=`date -r $DATE | awk '{ print $3,$2,$4}'`
else
    DATE="Not Found"
fi

echo "<result>$DATE</result>"