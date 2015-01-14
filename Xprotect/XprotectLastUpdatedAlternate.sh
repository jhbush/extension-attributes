#!/bin/sh

# Script to find the last time Apple updated Xprotect on a target computer.

XPROTECT="$(stat -f '%Sm' /System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/XProtect.meta.plist)"

echo "<result>$XPROTECT</result>"

exit 0