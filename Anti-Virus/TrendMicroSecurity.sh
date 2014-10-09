#!/bin/sh

# Returns the "Product Version" of the installed client, if found

if [ -f /Library/Application\ Support/TrendMicro/TmccMac/UIMgmt.app/Contents/Info.plist ]; then
    VERSION=`defaults read /Library/Application\ Support/TrendMicro/TmccMac/UIMgmt.app/Contents/Info CFBundleShortVersionString`
else
    VERSION="Not Installed"
fi

echo "<result>$VERSION</result>"