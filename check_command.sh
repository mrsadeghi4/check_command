#!/bin/bash

INTERVAL=15
NUM=10
SUCCESS=1
VERBOSE=0
V_ENV=("vinterval" "vnum")
env=("INTERVAL" "NUM")

function help {
	cat << EOL
Usage: $0 [OPTIONS] <COMMAND>
	-h: show this help output
	-i: Interval sevonds (Default: 15)
	-n: Number of tries (Default: 10)
	-v: Verbose mode 
Ecamples:
	$0 -i 15 -n 10 <COMMAND>
	$0 -n 4 <COMMAND>
EOL
}

function check_number {
	if [[ $1 =~ ^[0-9]+$ ]]; then
		return 0
	else
		return 1
	fi
}



while [[ $# -ne 0 ]]; do
#	for item in "${V_ENV[@]}"; do
#		if [[ `echo -n $item` -ne '' ]]; then
#			env[item]="{$!item}"
#		fi
#	done
	if [[ $(echo -n $vinterval) -ne '' ]]; then
		INTERVAL=$vinterval
	fi
	if [[ $(echo -n $vnum) -ne '' ]]; then
		NUM=$vnum
	fi
	case $1 in
	-h)
		help
		exit 0
		;;
	-i)
		check_number $2
		if [[ $? -ne 0 ]]; then
			help
			exit
		fi
		INTERVAL=$2
		shift 2
		;;
	-v)
		VERBOSE=1
		shift
		;;
	-n)
		check_number $2
		if [[ $? -ne 0 ]]; then
			help
			exit 1
		fi
		NUM=$2
		shift 2
		;;
	*)
		COMMAND=$@
		break
		;;
	esac
done

if [[ -z COMMAND ]]; then
	help
	exit 0
fi

for i in $(seq 1 $NUM); do
	$COMMAND
	if [[ $? -eq 0 ]]; then
		SUCCESS=0
		echo "[INFO] Command executed seccessfuly."
		break
	else
		if [[ $VERBOSE -eq 1 ]]; then
			echo "[INFO] Try $i failed. Sleep for $INTERVAL seconds..."
		fi
		sleep $INTERVAL
	fi
done

if [[ $SUCCESS -eq 0 ]]; then
	if [[ $VERBOSE -eq 1 ]]; then
		echo "[INFO] Command got executed successfully."
	fi
	exit 0
else
	if [[ $VERBOSE -eq 1 ]]; then
		echo 2> /dev/null
		echo "[ERROR] Threshold reached and command operation failed."
	fi
	exit 1
fi
