#!/bin/bash
sudo date -s '01/01/2014 00:01'
sleep 1
sudo pkill ntpd
sudo pkill gpsd
gpsd -b -n -D 2 /dev/ttyUSB0
sleep 2
GPSDATE=`gpspipe -w | head -10 | grep TPV | sed -r 's/.*"time":"([^"]*)".*/\1/' | head -1`
echo $GPSDATE
sudo date -s "$GPSDATE"
#/usr/sbin/ntpd
