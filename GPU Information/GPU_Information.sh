#!/bin/bash

gpuType=$(system_profiler SPDisplaysDataType | awk -F': ' '/Chipset Model/ {print $2}' | tail -1)

echo "<result>$gpuType</result>"

exit 0