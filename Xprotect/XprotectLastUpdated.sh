#!/bin/sh

# Script to find the last time Apple updated Xprotect on a target computer.

XPROTECT=`ls -l /System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/XProtect.meta.plist | awk '{print $6,$7,$8}'`

echo "<result>$XPROTECT</result>"

exit 0