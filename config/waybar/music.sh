#!/bin/bash
status=$(spotifycli --playbackstatus)
song=$(spotifycli --status)

while :
do
    if [ "$status" != "$(spotifycli --playbackstatus)" ]
    then
        status=$(spotifycli --playbackstatus)
        song=$(spotifycli --status)
        echo "$status $song"
    fi
    if [ "$song" != "$(spotifycli --status)" ]
    then
        status=$(spotifycli --playbackstatus)
        song=$(spotifycli --status)
        echo "$status $song"
    else
        echo "$status $song"
    fi
    sleep 3
done
