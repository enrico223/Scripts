#!/usr/bin/env bash

for i in *:
	find i -mindepth 2 -type d | while read -r dir; do
	mv "$dir"/* "$dir"/.. 2>/dev/null
	rmdir "$dir"
done
