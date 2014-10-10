#!/bin/sh

STARTECH=$(networksetup -listallhardwareports | awk '/Hardware Port: LAN7500/{getline; getline; print $NF}')

if [[ "$STARTECH" == "" ]]; then

    echo "<result>Not Installed</result>"
else
    echo "<result>$STARTECH</result>"
fi