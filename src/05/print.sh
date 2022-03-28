#!/bin/bash

nameF=($top5Folders)
sizeF=($top5FoldersSize)

nameFP=($top10Files)
nameFS=($top10FilesSize)
nameFT=($top10FilesType)

nameEF=($top10ExeFiles)
nameES=($top10ExeFilesSize)

echo "Numbers of Folders = $numberOfFolders"
echo "Top 5 folders:"

for (( i = 0; i < 5; i++ )); do
	printf "%d - " "$((i + 1))"
	printf "${nameF[$i]}, "
	printf "${size[$i]}\n"
done

echo "Numbers of Files = $numberOfAllFiles"
echo "Number of:"
echo "Configuration Files = $numberOfConfFiles"
echo "Txt Files = $numberOfTxtFiles"
echo "Exe Files = $numberOfExeFiles"
echo "Log Files = $numberOfLogsfiles"
echo "Archive Files = $numberOfRarFiles"
echo "Symb Links = $numberOfSLKFiles"

echo "Top 10 Files:"

for (( i = 0; i < 10; i++ )); do
	printf "%d - " "$((i + 1))"
	printf "${nameFP[$i]}, "
	printf "${nameFS[$i]}, "
	printf "${nameFT[$i]}\n"
done

echo "Top 10 exe Files:"

for (( i = 0; i < 10; i++ )); do
	printf "%d - " "$((i + 1))"
	printf "${nameEF[$i]}, "
        printf "${nameES[$i]}, "
	function getHash {
		export hashCalc="$(md5sum ${nameEF[$i]} | awk '{print $1}')"
	}
	printf "$hashCalc\n"
done

END=$(date +%s%N)
DIFF=$((( $END - $START )/1000000))
echo "Script working $DIFF ms."
