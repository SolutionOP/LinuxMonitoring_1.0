#!/bin/bash

if [ $# != 4 ]; then
    echo "Wrong parameters"
else
    export Fiparam=$1
    export Sparam=$2
    export Tparam=$3
    export Fparam=$4
    
    chmod +x exportInfo.sh
    ./exportInfo.sh
fi
