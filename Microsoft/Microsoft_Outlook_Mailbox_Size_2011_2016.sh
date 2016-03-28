#!/bin/bash

# Displays the size of Office for Mac 2011 and 2016 Outlook identities

echo "<result>"

UserList=$(dscl . list /Users UniqueID | awk '$2 > 1000 { print $1 }') 

for u in $UserList; 
do
if [ -d /Users/"$u"'/Library/Group Containers/UBF8T346G9.Office' ]; then
results=$(du -sh /Users/"$u"'/Library/Group Containers/UBF8T346G9.Office/Outlook/Outlook 15 Profiles/Main Profile' | grep -v "\[Back" | grep -v "\.plist" | awk '{print $1}')
else continue
fi
echo "$u" "$results" "2016"

done

for u in $UserList; 
do
if [ -d /Users/"$u"/Documents/Microsoft\ User\ Data/Office\ 2011\ Identities/ ]; then
results=$(du -sh /Users/"$u"/Documents/Microsoft\ User\ Data/Office\ 2011\ Identities/ | grep -v "\[Back" | grep -v "\.plist" | awk '{print $1}')
else continue
fi
echo "$u" "$results" "2011"

done

echo "</result>"
exit 0
