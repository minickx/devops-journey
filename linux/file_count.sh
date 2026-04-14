#!/bin/bash

file_count() {
local dir="$1"
local count
count=$(ls -1 "$dir" 2>/dev/null | wc -l)
echo "$dir:"
echo "$count"
}


file_count "/etc"
file_count "/var"
file_count "/usr/bin"
