#!/bin/bash

if [ -e /Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/bin/java ]; then
result="$(/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/bin/java -version 2>&1 | grep "java" | awk '{ print substr($3, 2, length($3)-2); }')"
echo "<result>$result</result>"
else
echo "<result>Java not installed</result>"
fi