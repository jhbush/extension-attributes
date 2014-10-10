#!/bin/bash

free=`diskutil info /|grep "Free Space"|awk '{print$4}'`

echo "<result>"${free%.*}"</result>"