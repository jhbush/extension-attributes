#!/bin/bash

if [ -e /Library/Internet\ Plug-Ins/Silverlight.plugin ]; then result="$(defaults read /Library/Internet\ Plug-Ins/Silverlight.plugin/Contents/Info SilverlightVersion)"
echo "<result>$result</result>"
else
echo "<result>Not Installed</result>"
fi
exit 0