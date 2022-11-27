#!/bin/bash

commands=`echo "ls mv zip unzip tar df dd mount read find locate" | tr ' ' '\n'`
parsers=`echo "sed awk grep jq tr"

selected=`printf "$commands\n$parsers" | fzf`
read -p "query: " query 

if printf $commands | grep -qs $selected; then
		kitty --single-instance "curl cht.sh/$selected/`echo $query | tr ' ' '+' & while [ : ]; do sleep 1""
else 
		curl cht.sh/$selected~$query & while [ : ]; do sleep 1; done
fi 
