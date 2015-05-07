#!/bin/bash

###
#
#            Name:  using_icloud_login.sh
#     Description:  This extension attribute determines whether the current
#                   account is using iCloud as its primary authentication
#                   method (a feature Apple introduced in Yosemite).
#          Author:  Elliot Jordan <elliot@lindegroup.com>
#         Created:  2015-04-13
#   Last Modified:  2015-04-13
#         Version:  1.0
#
###

OS_major=$(/usr/bin/sw_vers -productVersion | awk -F . '{print $1}')
OS_minor=$(/usr/bin/sw_vers -productVersion | awk -F . '{print $2}')

if [[ "$OS_major" -eq 10 && "$OS_minor" -le 9 ]] || [[ "$OS_major" -lt 10 ]]; then

    RESULT="False: This version of OS X doesn't support iCloud login."

elif [[ "$OS_major" -eq 10 && "$OS_minor" -ge 11 ]] || [[ "$OS_major" -gt 10 ]]; then

    RESULT="Unknown: This version of OS X hasn't been tested with this extension attribute."

else

    CURRENT_USER=$(/usr/bin/stat -f%Su /dev/console)

    if [[ "$CURRENT_USER" == "root" || "$CURRENT_USER" == "" ]]; then

        RESULT="Unknown: Nobody is currently logged in."

    else

        if dscl . -read "/Users/$CURRENT_USER" AuthenticationAuthority | grep -q ";AppleID;"; then

            RESULT="True: using iCloud login"

        else

            RESULT="False: using standard login"

        fi

    fi

fi

echo "<result>$RESULT</result>"

exit 0