#!/bin/sh

TBMAC=$(networksetup -listallhardwareports | awk '/Hardware Port: Thunderbolt Ethernet/{getline; getline; print $NF}')

if [[ "$TBMAC" == "" ]]; then

    echo "<result>Not Installed</result>"
else
    echo "<result>$TBMAC</result>"
fi