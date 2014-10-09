#!/bin/bash

# Displays the current users Documents folder size

currentUser=`ls -l /dev/console | awk '{print $3}'`

echo "<result>$( du -hc /Users/$currentUser/Documents | awk '/total/ {print $1}' )</result>"