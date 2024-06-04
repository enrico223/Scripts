#!/usr/bin/env bash

$WORK = 60*25
$PAUSE = 60*5
start = date +%s 

timer () {
	if [[current_time - start -eq 0]] then:
		notify-send "Times Up!"
	
	notify-send "Time to work!"
}

 
