#!/bin/sh
##################################################################
# Extension Attribute checks status of Shell Shock vulnerability.
# Cobbled together from other's hard work by Christopher Miller
# for ITSD-ISS of JHU-APL, Dated 2014-10-03
##################################################################

ShellShockStatus=`env x='() { :;}; echo vulnerable' bash -c 'echo' | grep vulnerable`
if [ "$ShellShockStatus" != "vulnerable" ]
			then
			    ShellShockStatus="Patched"
fi	

echo "<result>$ShellShockStatus</result>"		
exit 0