#!/usr/bin/env bash

while true; do
	if [[ $(date +%k) -gt 8 ]] && [[ $(date +%k) -lt 17 ]]; then
		kitty +kitten themes Gruvbox\ Light
	else
		kitty +kitten themes Argonaut
	fi
done
