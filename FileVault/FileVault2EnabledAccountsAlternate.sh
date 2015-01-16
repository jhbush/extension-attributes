#!/bin/bash

# Display enabled FileVault Users

FileVaultEnabledUsers=$(fdesetup list 2>&1 | cut -d, -f1)

if [ "$FileVaultEnabledUsers" == "Error: FileVault is Off." ]; then
	
echo "<result>FileVault 2 Encryption Not Enabled</result>"

	else	

echo "<result>"$FileVaultEnabledUsers"</result>"

fi

exit 0