#!/bin/bash

read -p "Do you want to write the output to a log file? (Y/N)" log

if [[ $log == Y || $log == y ]]; then
	name="$(date +"%d_%m_%y_%H_%M_%s").status"
	./printLogs.sh > $name
fi
