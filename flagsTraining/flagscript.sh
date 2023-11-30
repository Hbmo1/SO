#!/bin/bash



ARGS=$(getopt --options ascph --long "status,show,commit,push,help" -- "$@")

eval set --"$ARGS"

stats="false"
show="false"
commit="false"
push="false"
help="false"

while true; do
	case "$1" in
		-a|--status)
			stats="true"
			shift;;
		-s|--show)
			show="true"
			shift;;
		-c|--commit)
			commit="true"
			shift;;
		-p|--push)
			push="true"
			shift;;
		-h|--help)
			help="true"
			shift;;
		--)
			break;;
		*)
			printf "unknown option $s\n" "$1"
			exit 1;;
	esac
done

if [ "$stats" == true ]; then
	echo "getting status"
fi

if [ "$show" == true ]; then
	echo "show me the money!!!"
fi

if [ "$commit" == true ]; then
	echo "committing"
fi

if [ "$push" == true ]; then
	echo "pushing"
fi

if [ "$help" == true ]; then
	echo "Stop it, get some help."
	echo "$(basename "$0") options available: [-a, --status] [-s, --show] [-c, --commit] [-p, --push] [-h, --help] [--]"
	exit 1
fi

echo "ins't this script the coolest thing you have seen all day?"
