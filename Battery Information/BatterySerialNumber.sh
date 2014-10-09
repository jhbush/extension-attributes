#!/bin/sh

echo "<result>$(ioreg -r -c "AppleSmartBattery" | grep "BatterySerialNumber" | awk '{print $3}' | sed s/\"//g)</result>"