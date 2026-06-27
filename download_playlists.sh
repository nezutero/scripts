#!/usr/bin/env bash

# Math playlists
MATH_PLAYLISTS=(
  'https://www.youtube.com/playlist?list=PLDesaqWTN6EQ2J4vgsN1HyBeRADEh4Cw-'
  'https://youtube.com/playlist?list=PLDesaqWTN6ESk16YRmzuJ8f6-rnuy0Ry7'
  'https://www.youtube.com/playlist?list=PLDesaqWTN6ESPaHy2QUKVaXNZuQNxkYQ_'
  'https://www.youtube.com/playlist?list=PL5102DFDC6790F3D0'
)

for playlist in "${MATH_PLAYLISTS[@]}"; do
  nix run nixpkgs#yt-dlp -- \
    -f "bestvideo+bestaudio/best" \
    --merge-output-format mkv \
    -o '~/videos/math/%(playlist_title)s/%(playlist_index)s - %(title)s.%(ext)s' \
    "$playlist"
done
