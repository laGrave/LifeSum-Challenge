#!/bin/bash
PROJECT_NAME="LifeSum Challenge"

#kill $(ps aux | grep 'Xcode' | awk '{print $2}') 2> /dev/null
#rm -rf $PROJECT_NAME".xcworkspace"
#rm -rf $PROJECT_NAME".xcodeproj"

sh ./Scripts/swiftgen.sh
