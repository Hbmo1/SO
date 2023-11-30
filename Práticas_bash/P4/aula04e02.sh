#!/bin/bash

function numeric_to_string() {
	case "$1" in
	1)
		echo "Um"
		return 1
		;;
	2)
		echo "Dois"
		return 2
		;;
	3)
		echo "Tres"
		return 3
		;;
	4)
		echo "Quatro"
		return 4
		;;
	5)	
		echo "Cinco"
		return 5
		;;
		
	*)
		echo "Outro numero"
		return $1
		;;
	esac
}
numeric_to_string $1
echo "Numero inserido: $?"
