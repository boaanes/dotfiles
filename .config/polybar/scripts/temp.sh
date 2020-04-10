#!/bin/bash

TEMP=$(sensors | grep "Package id 0:" | cut -d ' ' -f 5 | cut -d '+' -f 2- | cut -d '.' -f 1)
ICON=""

if [[ $TEMP -gt 80 ]]; then
    ICON=""
elif [[ $TEMP -gt 60 ]]; then
    ICON=""
elif [[ $TEMP -gt 45 ]]; then
    ICON=""
elif [[ $TEMP -gt 30 ]]; then
    ICON=""
else
    ICON=""
fi

printf "$ICON $TEMP°C"
