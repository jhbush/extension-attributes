#!/bin/bash

#
# Function to grab a string from a json formatted file
#

function jsonval {
    temp=`echo $json | sed -e 's/\\\\\//\//g' -e 's/[{}]//g' | awk -v k="text" '{n=split($0,a,","); for (i=1; i<=n; i++) print a[i]}' | sed -e 's/\"\:\"/\|/g' -e 's/\]//' -e 's/[\,]/ /g' -e 's/\"//g' | grep -w $property | tail -1`
    echo ${temp##*|}
}

#
# Function to do one users extensions
#

function getuserextensions {
    cd "/Users/${loggedInUser}/Library/Application Support/Google/Chrome/Default/Extensions"
    for d in *; do
        JSONS=$( find "/Users/${loggedInUser}/Library/Application Support/Google/Chrome/Default/Extensions/$d" -maxdepth 3 -name "manifest.json" )
        while read JSON; do
            NAME=$( awk -F'"' '/"name"/{print $4}' "$JSON" )
        done < <(echo "$JSONS")
        if [[ "$NAME" =~ "_MSG_" ]]; then
            property=$(echo $NAME | sed -e "s/__MSG_//" -e "s/__//" )
            myPath=$(echo $JSONS | sed "s:manifest.json:_locales/en_US/messages.json:" )
            if [ ! -f "$myPath" ]; then
                myPath=$(echo $JSONS | sed "s:manifest.json:_locales/en/messages.json:" )
            fi
            json=$(cat "$myPath" | sed '/description/d')
            NAME=$(jsonval | sed 's/.*://' )
            if [ -z "$NAME" ]; then
                property=$(echo "-i $property")
                NAME=$(jsonval | sed 's/.*://' )
            fi
        fi
        if [ "${#d}" -eq 32 ];then
            EXTS+=( "${NAME} • ${d}\n" )
        fi
    done
}

#
# Main Body of code
#

loggedInUser=$( ls -l /dev/console | awk '{print $3}' )
if [ ! -d "/Users/${loggedInUser}/Library/Application Support/Google/Chrome/Default/Extensions" ]; then
    echo "<result>No User logged in unable to check</result>"
    exit 0
fi
curdir=${PWD}
getuserextensions
cd "$curdir"
echo "<result>$(echo -e "${EXTS[@]}" | sed -e 's/^[ \t]*//' -e '/^$/d' | sort )</result>"
exit 0