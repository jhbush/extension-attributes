#!/bin/bash

#displays any local accounts between UID 500 and 999

localAccounts=`dscl . list /Users UniqueID | awk '$2 > 500 && $2 < 999 {print $1}'`

echo "<result>$localAccounts</result>" 