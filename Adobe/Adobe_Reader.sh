#!/bin/sh

# Detects Adobe Reader version

if [ -f "/Applications/Adobe Reader.app/Contents/Info.plist" ] ; then
	VERSION=$( defaults read "/Applications/Adobe Reader.app/Contents/Info.plist" CFBundleVersion )
else
	VERSION="Not installed."
fi

echo "<result>$VERSION</result>"