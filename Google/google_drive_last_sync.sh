#!/bin/bash

#  Checks for the last successful sync between Google Drive Cloud and Local files.
#  Works by checking the log file for the last successful=True which occurs on a successful connection to Google to sync a file/folder change.
#  This attribute will check against the most recent user to log in via the login window.

#  Created by Ben Courtade on 2/26/15

lastUser=$(defaults read /Library/Preferences/com.apple.loginwindow.plist lastUserName)

fileSync=$(cat /Users/$lastUser/Library/"Application Support"/Google/Drive/user_default/sync_log.log | grep successful=True | cut -d " " -f1,2 | cut -d "," -f1 |  tail -1)

echo "<result>$fileSync</result>"