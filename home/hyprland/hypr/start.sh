#!/usr/bin/env bash



# initialize wallpaper daemon and set wallpaper
swww init &
swww img ~/.config/hypr/wal.png &


nm-applet --indicator &

waybar &

dunst &

hyprlock
