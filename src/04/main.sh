#!/bin/bash

if [ $# != 0 ]; then
    echo "Wrong parameters"
else
    source config.txt
    export Fiparam=$column1_background
    export Sparam=$column1_font_color
    export Tparam=$column2_background
    export Fparam=$column2_font_color
    
    chmod +x exportInfo.sh
    ./exportInfo.sh
fi
