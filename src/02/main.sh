#!/bin/bash

if [ $# != 0 ]; then
    echo "Wrong parameters"
else
    chmod +x exportInfo.sh
    ./exportInfo.sh
fi