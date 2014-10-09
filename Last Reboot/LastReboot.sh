#!/bin/bash

lastReboot=`who -b | awk '{print $3" "$4}'`

echo "<result>"$lastReboot"</result>"

exit 0