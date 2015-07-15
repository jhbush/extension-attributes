#!/bin/bash

RESULT=$(ls "/Library/Java/JavaVirtualMachines" | awk -F "_|.jdk" '/.jdk/{print $2}' | tail -1)

if [[ -z $RESULT ]]; then
    RESULT="No JDK found."
fi

echo "<result>$RESULT</result>"

exit 0