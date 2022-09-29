#!/usr/bin/env bash

# polybar-msg cmd quit
killall -q polybar

sleep 1
polybar laptop -c ~/.config/polybar/config 2>&1 | tee -a /tmp/polybar.log & disown

echo "Bar launched"
