#!/bin/sh

text="$(printf '\uf1bc  ' && playerctl metadata title)"
tooltip="$(playerctl metadata artist)"
    echo "{\"text\": \"$text\", \"tooltip\": \"<tt>$tooltip</tt>\", \"class\": \"song\"}"

