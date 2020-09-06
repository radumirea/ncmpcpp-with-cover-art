#!/bin/bash

COVER="/tmp/album_cover.png"
COVER_SIZE="400"

file="$MUSIC_DIR/$(mpc --format %file% current)"
album="${file%/*}"
art=$(find "$album"  -maxdepth 1 | grep -m 1 ".*\.\(jpg\|png\|gif\|bmp\)")
if [ "$art" = "" ]; then
  art="$HOME/.ncmpcpp/default_cover.jpg"
fi
ffmpeg -loglevel 0 -y -i "$art" -vf "scale=$COVER_SIZE:-1" "$COVER"

