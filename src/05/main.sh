#!/bin/bash

export START=$(date +%s%N)

if [[ $# != 1 ]]; then
	echo "Wrong arguments!"
	exit 1
fi

if [[ "${1: -1}" != "/" ]]; then
	echo "Wrong path!"
	exit 1
fi

nullFile="$(find $1)"
if [[ -z $nullFile ]]; then
	exit 1
fi

export numberOfFolders="$(ls -l $1 | grep -c ^d)"
export top5Folders="$(du -h $1 | sort -hr | head -5 | awk '{print $2}')"
export top5FoldersSize="$(du -h $1 | sort -hr | head -5 | awk '{print $1}')"
export numberOfAllFiles="$(ls -laR $1 | grep "^-" | wc | awk '{print $1}')"
export numberOfConfFiles="$(find $1 -type f -name "*.conf" | wc -l)"
export numberOfTxtFiles="$(find $1 -type f -name "*.txt" | wc -l)"
export numberOfExeFiles="$(find $1 -type f -name -executable | wc -l)"
export numberOfLogsFiles="$(find $1 -type f -name "*.log" | wc -l)"
export numberOfRarFiles="$(find $1 -type f -name "*.zip" -o -name "*.7z" -o -name "*.rar" -o -name "*.tar" | wc -l)"
export numberOfSLKFiles="$(find $1 -type l | wc -l)"
export top10Files="$(find $1 -type f -exec du -h {} + | sort -hr | head -10 | awk '{print $2}')"
export top10FilesSize="$(find $1 -type f -exec du -h {} + | sort -hr | head -10 | awk '{print $1}')"
export top10FilesType="$(find $1 -type f -exec du -h {} + | sort -hr | head -10 | awk -F'.' '{print $3}')"
export top10ExeFiles="$(find $1 -type f -executable -exec du -h {} + | sort -hr | head -10 | awk '{print $2}')"
export top10ExeFilesSize="$(find $1 -type f -executable -exec du -h {} + | sort -hr | head -10 | awk '{print $1}')"

chmod +x print.sh
./print.sh
