#!/bin/bash

FileVaultEnabledUsers=`fdesetup list | cut -d, -f1`

echo "<result>"$FileVaultEnabledUsers"</result>"

exit 0