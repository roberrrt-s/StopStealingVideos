#!/usr/bin/env bash

for video in ./files/*.mov; do
	filename="${video##*/}"

	if [[ $1 == 'topleft' ]] ||  [[ $1 == 'topright' ]] || [[ $1 == 'botleft' ]] ||  [[ $1 == 'botright' ]]; then
		markimage=$1
	else
		markimage='topleft'
	fi

	ffmpeg -i "$video" -i "./lib/${markimage}.png" -filter_complex "overlay=main_w-overlay_w-0+0:0-0+0" "./dist/marked-${filename}";
done;