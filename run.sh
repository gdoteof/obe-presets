#!/bin/bash

screen -d -m -S obe01 obecli
sleep 1
# screen -p 0 -S obe01 -X stuff $'set obe opts system-type=lowestlatency\012'
screen -p 0 -S obe01 -X stuff $'set input decklink\012'
screen -p 0 -S obe01 -X stuff $'set input opts video-format=1080i60\012'
screen -p 0 -S obe01 -X stuff $'probe input\012'
sleep 2
screen -p 0 -S obe01 -X stuff $'set stream opts 0:bitrate=8000,threads=3,format=avc,intra-refresh=1\012'
screen -p 0 -S obe01 -X stuff $'set stream opts 1:bitrate=224,format=mp2\012'
screen -p 0 -S obe01 -X stuff $'set muxer opts ts-muxrate=5000000,ts-type=dvb\012'
screen -p 0 -S obe01 -X stuff $'set outputs 1\012'
screen -p 0 -S obe01 -X stuff $'set output opts 0:target=udp://204.13.46.48:9171?ttl=5\012'
screen -p 0 -S obe01 -X stuff $'start\012'
