#!/bin/bash

echo "<result>"

UserList=`dscl . list /Users UniqueID | awk '$2 > 1000 { print $1 }'` 

for u in $UserList; 
do
if [ -d /Users/$u/Documents/Microsoft\ User\ Data/Office\ 2011\ Identities/ ]; then
results=`du -sh /Users/$u/Documents/Microsoft\ User\ Data/Office\ 2011\ Identities/ | grep -v "\[Back" | grep -v "\.plist" | awk '{print $1}'`
else continue
fi
echo $u $results

done
echo "</result>"
exit 0