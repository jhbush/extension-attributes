#!/bin/bash

# Check if ROOT has been enabled

if dscl . read /Users/root | grep -q AuthenticationAuthority; then
	
    echo "<return>Enabled</return>"

else

    echo "<return>Disabled</return>"

fi