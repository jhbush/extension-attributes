#!/bin/sh
 
# Locating the last logged in user.
lastUser=`defaults read /Library/Preferences/com.apple.loginwindow lastUserName`
 
# Calculating last Logged in user's Home Folder Size.
userHomeFolderSize=`du -sk /Users/$lastUser/ | awk '{ print $1 }'`
 
# Calculating last logged in user's Outlook Database Size
microsoftData=`du -sk /Users/$lastUser/Documents/Microsoft\ User\ Data | awk '{ print $1 }'`
 
# Subtracting out Outlook Database Size
totalSize=$(($userHomeFolderSize - $microsoftData))

# Converting from Kilobytes to Gigabytes
GIGABYTES=$(echo "scale=2;${totalSize}/1024/1024"|bc)
 
echo "<result>"${GIGABYTES}"</result>" 