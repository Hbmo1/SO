#!/bin/bash
if [[ "$1" -gt 5 ]] && [[ "$1" -lt 10 ]] ; then
	echo "$1 é maior do que 5 e menor do que 10"
else
	echo "$1 não pertence ao intervalo [5,10]"
fi

