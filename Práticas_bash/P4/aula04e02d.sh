#!/bin/bash

function grThanOrEq(){
	if [[ $1 -eq $2 ]]; then
		return 0
	elif [[ $1 -gt $2 ]]; then
		return 1
	else 
		return 2
	fi
}

function printer(){
	echo "Insira um nº: "
	read n1
	echo "Insira outro nº: "
       	read n2	
	grThanOrEq n1 n2
	case "$?" in
		0)
			echo "$n1 == $n2"
			;;
		1)
			echo "$n1 > $n2"
			;;
		2)
			echo "$n2 > $n1"
			;;
		*)
			echo "Erro"
			;;
	esac	
}
printer
