#!/bin/sh

# Checks for hidden file set by the set_ownership.sh script

result=$(cat /private/var/systemtype)

echo "<result>$result</result>"