#!/bin/bash

if [ "$1" == "--up" ]; then
    xbacklight -inc +10%
fi

if [ "$1" == "--down" ]; then
    xbacklight -inc -10%
fi

BRIGHTNESS=$(xbacklight -get)

notify-send.sh "Brightness" "${BRIGHTNESS%.*}/100" \
    --replace-file=/tmp/brightnessnotification \
    -a "" \
    --hint string:image-path:video-display \
    --hint int:has-percentage:${BRIGHTNESS%.*} \
    --hint int:transient:1 \
