#!/usr/bin/env bash

for video in ./files/*.{mov,MOV,mp4}; do
	full=$(basename -- "$video")
	extension="${full##*.}"
	filename="${full%.*}"

	if [[ $1 == 'topleft' ]] ||  [[ $1 == 'topright' ]] || [[ $1 == 'botleft' ]] ||  [[ $1 == 'botright' ]]; then
		markimage=$1
	else
		markimage='topleft'
	fi

	ffmpeg -i "$video" -i "./lib/${markimage}.png" -filter_complex "overlay=main_w-overlay_w-0+0:0-0+0" "./dist/marked-${filename}.${extension}";
done;