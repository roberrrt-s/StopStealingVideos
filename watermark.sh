#!/usr/bin/env bash

for video in ./files/*.mov; do
	filename="${video##*/}"
	ffmpeg -i "$video" -i "./lib/watermark.png"  -filter_complex "overlay=main_w-overlay_w-0+0:0-0+0" "./dist/marked-${filename}";
done;