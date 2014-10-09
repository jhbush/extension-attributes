#!/bin/sh
echo "<result>`/usr/bin/pmset -g 2>&1 | grep \* | awk '{$NF=""; print $0}'`</result>"
	