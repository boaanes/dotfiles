#!/bin/bash

TEMP=$(sensors | grep "Package id 0:" | cut -d ' ' -f 5 | cut -d '+' -f 2- | cut -d '.' -f 1)

printf " $TEMP°C"
