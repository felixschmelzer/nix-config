#!/usr/bin/env bash



# initialize wallpaper daemon and set wallpaper
swww init &
swww img ~/Pictures/wal.png &


nm-applet --indicator &

waybar &

dunst &

hyprlock
