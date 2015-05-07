#!/bin/bash

# Display the logged in users Chrome Extensions

loggedInUser=$( ls -l /dev/console | awk '{print $3}' )

JSONS=$( find "/Users/${loggedInUser}/Library/Application Support/Google/Chrome/Default/Extensions/" -maxdepth 4 -name "manifest.json" )

while read JSON; do
    NAME=$( awk -F'"' '/name/{print $4}' "$JSON" )
    if [[ ! -z "$NAME" ]] && [[ ! "$NAME" =~ "_MSG_" ]]; then
        EXTS+=( "${NAME}\n" )
    fi
done < <(echo "$JSONS")

echo "<result>$(echo -e "${EXTS[@]}" | sed -e 's/^[ \t]*//' -e '/^$/d' | sort )</result>"