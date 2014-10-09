#!/bin/sh

USBMAC=$(networksetup -listallhardwareports | awk '/Hardware Port: USB Ethernet/{getline; getline; print $NF}')

if [[ "$USBMAC" == "" ]]; then

    echo "<result>Not Installed</result>"
else
    echo "<result>$USBmac</result>"
fi