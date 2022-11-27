#!/bin/sh

if [ ! $(pgrep "spotifyd")]; then 
    spotifyd
fi 

spt;

if [ ! $(pgrep "spt")]; then 
    killall spotifyd
fi
