#!/bin/sh

# Displays the current version of NTPD installed

echo "<result>$(what /usr/sbin/ntpd | awk -F- '{getline; print $NF}')</result>"