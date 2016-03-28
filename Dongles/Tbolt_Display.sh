#!/bin/sh

DISPMAC=$(networksetup -listallhardwareports | awk '/Hardware Port: Display Ethernet/{getline; getline; print $NF}')

if [[ "$DISPMAC" == "" ]]; then

    echo "<result>Display Ethernet not found</result>"
else
    echo "<result>$DISPMAC</result>"
fi
