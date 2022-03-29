#!/bin/bash
status=$(spotifycli --playbackstatus)
song=$(spotifycli --status)

if [ "$status" = "Spotify is off" ]; then
    echo ""
else
    echo "$status $song"
fi
