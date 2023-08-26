#!/usr/bin/env bash

SHORT_POMODORO = 1500
LONG_POMODORO = 45
SHORT_BREAK = 5
LONG_BREAK = 15

possibilities = "Short\ pomodoro Long\ pomodoro" 
selected = $(printf "%s\n" $possibilies)
function countdown() {
    local timer=$1
    while [ $timer -gt 0 ]; do
        printf "\r%02d:%02d " $((timer / 60)) $((timer % 60))
        sleep 1
        ((timer--))
    done
    printf "\r%02d:%02d " $((timer / 60)) $((timer % 60))
    echo " Time's up!"
}

case $selected in
	Short pomodoro)
		countdown($SHORT_POMODORO);;
	Long pomodoro)
		countdown($LONG_POMODORO);;
esac
	
