#!/bin/bash
# To make file executable run this command
#    chmod +x test.sh
primary_display=$(xrandr | grep " con" | grep "primary" |  awk -F'[ ]' '{print $1}')
secondary_display=$(xrandr | grep " con" | grep -v "primary" |  awk -F'[ ]' '{print $1}')

echo $primary_display
echo $secondary_display

xrandr --output "$primary_display" --auto --output "$secondary_display" --right-of "$primary_display" --auto