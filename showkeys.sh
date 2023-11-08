#!/usr/bin/env bash
if [[ ! $(pgrep wshowkeys) ]]; then 
	wshowkeys -a bottom -m 70
else
	pkill wshowkeys
fi

