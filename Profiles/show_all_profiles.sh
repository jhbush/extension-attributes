#!/bin/bash

var=`profiles -P -v | awk -F: '/attribute: name:/{print $NF}' | sed 's/\ //'`

echo "<result>$var</result>"