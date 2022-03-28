#!/bin/bash
if [ $# != 1 ]; then
echo "Wrong parameters"
else
    if [[ $1 =~ [0-9] ]]; then
    echo "Wrong parameters"
    else
    echo $1
    fi
fi