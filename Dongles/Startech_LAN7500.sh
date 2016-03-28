#!/bin/sh

# Determines if the StarTech LAN7500 kernel extension is installed.

if [[ -e /System/Library/Extensions/LAN7500.kext ]]; then

    echo "<result>Installed</result>"
else
    echo "<result>Not Installed</result>"
fi