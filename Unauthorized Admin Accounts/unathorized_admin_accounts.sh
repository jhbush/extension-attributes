#!/bin/bash

# Get the Local Admin Users from DSCL
a=`dscl . -read /Groups/admin GroupMembership`

# Build an Array of the users
admins=($a)

# List the users I don't want to report on. Separate by space to add more.
ignore=(GroupMembership: administrator _viamanagement)

# Loop through the ignore array and trim them from the admin array
for i in "${ignore[@]}"; do admins=(${admins[@]//*$i*})

done

# Report Attribute back to Casper

if [ "${#admins[@]}" = 0 ]; then
	
    echo "<result>Admin Accounts OK</result>"

else

    echo "<result>WARNING: ${admins[@]}</result>"

fi