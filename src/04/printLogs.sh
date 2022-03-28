#!/bin/bash

whiteF="\033[107m"
redF="\033[41m"
greenF="\033[42m"
blueF="\033[44m"
purpleF="\033[45m"
blackF="\033[40m"

end="\e[0m"


whiteT="\033[97m"
redT="\033[31m"
greenT="\033[32m"
blueT="\033[34m"
purpleT="\033[35m"
blackT="\033[30m"

arr[0]=$Fiparam;
arr[1]=$Sparam;
arr[2]=$Tparam;
arr[3]=$Fparam;

for i in 0 1 2 3; do
	if [[ -z ${arr[$i]} ]]; then
		arr[$i]=1
		param[$i]=1
	fi
done

for i in 0 1 2 3; do
	if [[ ${arr[$i]} == 1 ]]; then
                color[$i]="(white)"
        elif [[ ${arr[$i]} == 2 ]]; then
		color[$i]="(red)"
        elif [[ ${arr[$i]} == 3 ]]; then
		color[$i]="(green)"
        elif [[ ${arr[$i]} == 4 ]]; then
		color[$i]="(blue)"
        elif [[ ${arr[$i]} == 5 ]]; then
		color[$i]="(purple)"
        elif [[ ${arr[$i]} == 6 ]]; then
		color[$i]="(black)"
        fi
done

for i in 0 1 2 3; do
	if [[ ${arr[$i]} < 1 || ${arr[$i]} > 6 ]]; then
		echo "Wrong arguments"
		exit 1
	fi
done

if [[ ${arr[0]} == ${arr[1]} ]]; then
	echo "Background and text color must not match, return the script"
	exit 1	
elif [[ ${arr[2]} == ${arr[3]} ]]; then
	echo "Background and text color must not match, return the script"
        exit 1
fi

for i in 0 2; do
	if [[ ${arr[$i]} == 1 ]]; then
		narr[$i]=$whiteF
	elif [[ ${arr[$i]} == 2 ]]; then
		narr[$i]=$redF
	elif [[ ${arr[$i]} == 3 ]]; then
		narr[$i]=$greenF
	elif [[ ${arr[$i]} == 4 ]]; then
		narr[$i]=$blueF
	elif [[ ${arr[$i]} == 5 ]]; then
		narr[$i]=$purpleF
	elif [[ ${arr[$i]} == 6 ]]; then
		narr[$i]=$blackF
	fi
done

for i in 1 3; do
	if [[ ${arr[$i]} == 1 ]]; then
                narr[$i]=$whiteT
        elif [[ ${arr[$i]} == 2 ]]; then
                narr[$i]=$redT
        elif [[ ${arr[$i]} == 3 ]]; then
                narr[$i]=$greenT
        elif [[ ${arr[$i]} == 4 ]]; then
                narr[$i]=$blueT
        elif [[ ${arr[$i]} == 5 ]]; then
                narr[$i]=$purpleT
        elif [[ ${arr[$i]} == 6 ]]; then
                narr[$i]=$blackT
        fi
done

echo -e "${narr[0]}${narr[1]}HOSTNAME$end = ${narr[2]}${narr[3]}$HOSTNAME$end"
echo -e "${narr[0]}${narr[1]}TIMEZONE$end = ${narr[2]} ${narr[3]}$TIMEZONE$end"
echo -e "${narr[0]}${narr[1]}USER$end = ${narr[2]}${narr[3]}$USER$end"
echo -e "${narr[0]}${narr[1]}OS$end = ${narr[2]}${narr[3]}$OS$end"

if [[ ${param[0]} == 1 ]]; then
	echo "Column 1 background = default ${color[0]}"
else
	echo "Column 1 background = ${arr[0]} ${color[0]}"
fi

if [[ ${param[1]} == 1 ]]; then
        echo "Column 1 font color = default ${color[1]}"
else
        echo "Column 1 font color = ${arr[1]} ${color[1]}"
fi

if [[ ${param[2]} == 1 ]]; then
        echo "Column 2 background = default ${color[2]}"
else    
        echo "Column 2 background = ${arr[2]} ${color[2]}"
fi  

if [[ ${param[3]} == 1 ]]; then
        echo "Column 2 font color = default ${color[3]}"
else
        echo "Column 2 font color = ${arr[3]} ${color[3]}"
fi

echo -e "${narr[0]}${narr[1]}DATE$end = ${narr[2]}${narr[3]}$DATE$end"
echo -e "${narr[0]}${narr[1]}UPTIME$end = ${narr[2]}${narr[3]}$UPTIME$end"
echo -e "${narr[0]}${narr[1]}UPTIME_SEC$end = ${narr[2]}${narr[3]}$UPTIME_SEC$end"
echo -e "${narr[0]}${narr[1]}IP$end = ${narr[2]}${narr[3]}$IP$end"
echo -e "${narr[0]}${narr[1]}MASK$end = ${narr[2]}${narr[3]}$MASK$end"
echo -e "${narr[0]}${narr[1]}GATEWAY$end = ${narr[2]}${narr[3]}$GATEWAY$end"
echo -e "${narr[0]}${narr[1]}RAM_TOTAL$end = ${narr[2]}${narr[3]}$RAM_TOTAL$end"
echo -e "${narr[0]}${narr[1]}RAM_USED$end = ${narr[2]}${narr[3]}$RAM_USED$end"
echo -e "${narr[0]}${narr[1]}RAM_FREE$end = ${narr[2]}${narr[3]}$RAM_FREE$end"
echo -e "${narr[0]}${narr[1]}SPACE_ROOT$end = ${narr[2]}${narr[3]}$SPACE_ROOT$end"
echo -e "${narr[0]}${narr[1]}SPACE_ROOT_USED$end = ${narr[2]}${narr[3]}$SPACE_ROOT_USED$end"
echo -e "${narr[0]}${narr[1]}SPACE_ROOT_FREE$end = ${narr[2]}${narr[3]}$SPACE_ROOT_FREE$end"
