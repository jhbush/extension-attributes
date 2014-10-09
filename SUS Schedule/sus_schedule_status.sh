#!/bin/bash

echo "<result>$(/usr/sbin/softwareupdate --schedule | awk '{print $4}')</result>"

