#!/bin/sh

printf "VPN: " && (pgrep -a openvpn$ | head -n 1 | awk '{print $NF }' | cut -d '.' -f 1 | cut -d '/' -f 5 && echo down) | head -n 1
